#!/usr/bin/env bash
# Public synthetic probe: fetch live AW-004 / BYA / hub surfaces.
# Origin basket: synthetic. No secrets. No gold labels.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT_DIR="${ROOT}/results"
mkdir -p "${OUT_DIR}"

STAMP="$(date -u +"%Y-%m-%dT%H%M%SZ")"
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
  echo "  \"schema\": \"scanovich.agent_web_observation.batch.v0\","
  echo "  \"experiment_id\": \"AW-004\","
  echo "  \"origin\": \"synthetic\","
  echo "  \"timestamp\": \"${STAMP}\","
  echo '  "fetches": ['
} > "${OUT_JSON}"

first=1
for url in "${URLS[@]}"; do
  for accept in "${ACCEPT_MODES[@]}"; do
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

    err_note=""
    if [[ -s "${tmp}/curl.err" ]]; then
      err_note=" curl_error=$(tr '\n' ' ' < "${tmp}/curl.err" | sed 's/"/\\"/g')"
    fi

    if [[ "${first}" -eq 0 ]]; then
      echo ',' >> "${OUT_JSON}"
    fi
    first=0
    cat >> "${OUT_JSON}" <<EOF
    {
      "canon_url": "${url}",
      "variant": "unknown",
      "representation": { "requested": "${req}", "served": "${served}" },
      "exposure": {
        "fetch_success": ${success},
        "http_status": ${code},
        "bytes": ${bytes}
      },
      "notes": "content-type: ${ctype}${err_note}"
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
