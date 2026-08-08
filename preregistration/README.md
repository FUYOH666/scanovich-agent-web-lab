# Preregistration

Public manifests that freeze experimental commitments **without** revealing sealed holdout contents or scoring rubrics.

## Files

| File | Purpose |
|------|---------|
| `AW-004.md` | Human-readable preregistration (phases, scoring freeze) |
| `experiment-config.json` | Machine-readable config (no answer keys) |
| `holdout-manifest.sha256` | SHA-256 digest of the sealed Intent Corpus + rubrics freeze |

## Hash procedure

Sealed vault (local, gitignored): `sealed/`

Canonical concatenation (byte-exact):

```text
sha256(
  holdouts/holdout_corpus_v0.1.jsonl
  + "\n--FILE--\n"
  + adversarial/adversarial_corpus_v0.1.jsonl
  + "\n--FILE--\n"
  + rubrics/scoring_rubric_v0.1.jsonl
)
```

Rubrics must be frozen **before** scored model runs. Do not rewrite rubrics after seeing answers.

After AW-004 closes, publish the sealed corpus + rubrics and verify the digest.
