#!/usr/bin/env bash
# AW-004 Phase 0 — surface verification (fetch.v1), not A/B/C/D comparison.
# Origin: synthetic. No secrets. No gold labels.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT_DIR="${ROOT}/results"
mkdir -p "${OUT_DIR}"

STAMP="$(date -u +"%Y-%m-%dT%H%M%SZ")"
ISO_TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
OUT_JSON="${OUT_DIR}/aw004_surfaces_${STAMP}.json"

URLS=(
  "https://scanovich.ai/research/agent-web/"
  "https://scanovich.ai/research/agent-web/aw-004/"
  "https://scanovich.ai/research/agent-web/bring-your-agent/"
  "https://scanovich.ai/research/agent-web/observatory/"
)

ACCEPT_MODES=(
  "text/html"
  "text/markdown"
)

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

{
  echo '{'
  echo "  \"schema\": \"scanovich.agent_web_fetch.batch.v1\","
  echo "  \"experiment_id\": \"AW-004\","
  echo "  \"phase\": \"0\","
  echo "  \"phase_name\": \"surface_verification\","
  echo "  \"origin\": \"synthetic\","
  echo "  \"timestamp\": \"${ISO_TS}\","
  echo '  "environment": {'
  echo '    "agent_family": "harness",'
  echo '    "product": "curl",'
  echo '    "model": "none",'
  echo '    "model_version": "none",'
  echo '    "retrieval_mode": "none",'
  echo '    "tooling_mode": "harness",'
  echo '    "locale": "unknown"'
  echo '  },'
  echo '  "fetches": ['
} > "${OUT_JSON}"

first=1
idx=0
for url in "${URLS[@]}"; do
  for accept in "${ACCEPT_MODES[@]}"; do
    idx=$((idx + 1))
    body="${tmp}/body"
    hdr="${tmp}/hdr"
    rm -f "${body}" "${hdr}"
    : > "${body}"
    : > "${hdr}"

    set +e
    code="$(curl -sS -L \
      -H "Accept: ${accept}" \
      -H "User-Agent: ScanovichAgentWebLab/0.1 (+https://github.com/FUYOH666/scanovich-agent-web-lab)" \
      -D "${hdr}" \
      -o "${body}" \
      -w "%{http_code}" \
      --connect-timeout 15 \
      --max-time 45 \
      "${url}" 2>"${tmp}/curl.err")"
    curl_ec=$?
    set -e
    if [[ "${curl_ec}" -ne 0 || -z "${code}" ]]; then
      code="000"
    fi

    bytes="$(wc -c < "${body}" | tr -d ' ')"
    ctype="$(awk 'BEGIN{IGNORECASE=1} /^content-type:/{sub(/\r$/,""); print; exit}' "${hdr}" | sed 's/[Cc]ontent-[Tt]ype:[[:space:]]*//')"
    served="unknown"
    case "${ctype}" in
      *markdown*) served="markdown" ;;
      *html*) served="html" ;;
      *json*) served="json" ;;
    esac
    req="html"
    [[ "${accept}" == "text/markdown" ]] && req="markdown"
    success=false
    [[ "${code}" =~ ^2 ]] && success=true
    fid="$(printf 'aw004-phase0-%02d' "${idx}")"

    if [[ "${first}" -eq 0 ]]; then
      echo ',' >> "${OUT_JSON}"
    fi
    first=0
    # escape ctype for JSON
    ctype_json="${ctype//\\/\\\\}"
    ctype_json="${ctype_json//\"/\\\"}"
    cat >> "${OUT_JSON}" <<EOF
    {
      "schema": "scanovich.agent_web_fetch.v1",
      "fetch_id": "${fid}",
      "experiment_id": "AW-004",
      "phase": "0",
      "timestamp": "${ISO_TS}",
      "origin": "synthetic",
      "canon_url": "${url}",
      "variant": "unknown",
      "representation": { "requested": "${req}", "served": "${served}" },
      "exposure": {
        "fetch_success": ${success},
        "http_status": ${code},
        "bytes": ${bytes},
        "content_type": "${ctype_json}"
      },
      "notes": "Phase 0 surface verification; variant not assigned"
    }
EOF
  done
done

{
  echo ''
  echo '  ]'
  echo '}'
} >> "${OUT_JSON}"

echo "Wrote ${OUT_JSON}" >&2
