#!/usr/bin/env bash
# Local + CI checks: JSON parse, JSON Schema, hygiene patterns.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "${ROOT}"

fail=0

echo "== JSON parse =="
while IFS= read -r -d '' f; do
  if ! python3 -m json.tool "${f}" >/dev/null; then
    echo "INVALID JSON: ${f}" >&2
    fail=1
  fi
done < <(find schemas experiments preregistration results -type f \( -name '*.json' \) -print0 2>/dev/null)

echo "== JSONL parse (public intents) =="
INTENTS="datasets/synthetic/public/intents_v0.1.jsonl"
if [[ -f "${INTENTS}" ]]; then
  python3 - <<'PY'
import json, sys
from pathlib import Path
p = Path("datasets/synthetic/public/intents_v0.1.jsonl")
n = 0
for i, line in enumerate(p.read_text().splitlines(), 1):
    line = line.strip()
    if not line:
        continue
    try:
        json.loads(line)
        n += 1
    except json.JSONDecodeError as e:
        print(f"INVALID JSONL {p}:{i}: {e}", file=sys.stderr)
        sys.exit(1)
print(f"ok intents lines={n}")
if n < 20:
    print(f"expected ≥20 public intents, got {n}", file=sys.stderr)
    sys.exit(1)
PY
fi

echo "== JSON Schema documents =="
python3 - <<'PY'
import json, sys
from pathlib import Path

try:
    import jsonschema
    from jsonschema import Draft202012Validator
except ImportError:
    print("jsonschema not installed; skip Draft202012 checks", file=sys.stderr)
    sys.exit(0)

errors = 0
for path in sorted(Path("schemas").glob("*.schema.json")):
    doc = json.loads(path.read_text())
    try:
        Draft202012Validator.check_schema(doc)
        print(f"ok schema {path}")
    except Exception as e:
        print(f"BAD SCHEMA {path}: {e}", file=sys.stderr)
        errors = 1

# Validate known instances
pairs = [
    ("preregistration/experiment-config.json", None),  # loose
    ("experiments/AW-004/protocol.json", None),
    ("experiments/AW-005/protocol.json", None),
    ("experiments/AW-006/protocol.json", None),
]
# Spot-check first fetch in Phase 0 results against fetch schema if present
results = Path("results/aw004_surfaces_2026-08-08T082742Z.json")
fetch_schema = Path("schemas/fetch.schema.json")
if results.exists() and fetch_schema.exists():
    data = json.loads(results.read_text())
    schema = json.loads(fetch_schema.read_text())
    v = Draft202012Validator(schema)
    for i, item in enumerate(data.get("fetches", [])):
        errs = sorted(v.iter_errors(item), key=lambda e: e.path)
        if errs:
            print(f"fetch validation failed index={i}: {errs[0].message}", file=sys.stderr)
            errors = 1
            break
    else:
        print(f"ok validated {len(data.get('fetches', []))} fetches against fetch.schema.json")

sys.exit(errors)
PY
py_ec=$?
if [[ "${py_ec}" -ne 0 ]]; then
  fail=1
fi

echo "== Hygiene / secret patterns (tracked tree) =="
# Fail on likely secrets or private dumps in tracked paths
if rg -n --hidden \
  -g '!.git/**' -g '!LICENSES/**' -g '!scripts/ci/**' \
  -e 'BEGIN (RSA |OPENSSH )?PRIVATE KEY' \
  -e 'CLOUDFLARE_API_TOKEN\s*=\s*[^y]' \
  -e 'OPENAI_API_KEY\s*=\s*sk-' \
  -e 'PERPLEXITY_API_KEY\s*=\s*' \
  -e 'ghp_[A-Za-z0-9]{20,}' \
  -e 'sk-[A-Za-z0-9]{20,}' \
  . 2>/dev/null; then
  echo "Possible secret material found" >&2
  fail=1
else
  echo "ok no high-confidence secret patterns"
fi

# Must not track sealed/ or comms/
if git ls-files | rg -n '^(sealed|comms)/'; then
  echo "Tracked forbidden paths sealed/ or comms/" >&2
  fail=1
else
  echo "ok sealed/ and comms/ not tracked"
fi

# Home paths / obvious PII dumps
if git grep -nE '/Users/[A-Za-z0-9._-]+/|/home/[A-Za-z0-9._-]+/' -- \
  ':!scripts/ci/**' ':!docs/institutional-packaging.md' 2>/dev/null | rg -v 'example|placeholder'; then
  echo "Possible home-directory paths in tracked files" >&2
  fail=1
else
  echo "ok no home-directory paths"
fi

echo "== Required public files =="
for f in README.md METHODOLOGY.md LICENSE CITATION.cff \
  schemas/fetch.schema.json schemas/run.schema.json schemas/observation.schema.json \
  experiments/AW-004/README.md experiments/AW-005/README.md experiments/AW-006/README.md \
  preregistration/holdout-manifest.sha256; do
  if [[ ! -f "${f}" ]]; then
    echo "MISSING ${f}" >&2
    fail=1
  fi
done

if [[ "${fail}" -ne 0 ]]; then
  echo "VALIDATION FAILED" >&2
  exit 1
fi
echo "ALL CHECKS PASSED"
