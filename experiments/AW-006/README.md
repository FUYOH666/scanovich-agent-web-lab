# AW-006 — AI-search citation baseline (method note)

**Status:** Perplexity Sonar half-baseline ingested (scrubbed); OpenAI half pending  
**last_verified:** 2026-08-09  
**Private site:** `4.12.2`  
**Parallel with:** AW-003 / AW-004 / AW-005

## What it is

A **search-grounded** measurement track: do AI search products mention / cite the live commercial domain?

Harness, blind prompts, API keys, and raw answer dumps stay on the **private** site.

## Public artifacts

| Artifact | Path |
|----------|------|
| OpenClaw smoke (scrubbed) | [`analysis/2026-08-09-aw006-openclaw-smoke.md`](../../analysis/2026-08-09-aw006-openclaw-smoke.md) |
| Perplexity baseline (scrubbed) | [`analysis/2026-08-09-aw006-perplexity-baseline.md`](../../analysis/2026-08-09-aw006-perplexity-baseline.md) |

## Rates so far (Perplexity, N=100)

| | |
|--|--:|
| Overall mention rate | **4%** |
| Best class (`trade_customs`) | ~**15%** |
| `supplier_spreadsheet` / `evidence_conflict` / `generic_ai_docs` | **0%** |

Engine variance: OpenClaw smoke can hit an ultra-specific fingerprint; Perplexity often does not.

## H0 (current)

Fingerprint / trade-dossier adjacency can appear; wide supplier and evidence-conflict shortlists do not default to the live domain. **No guaranteed ranking claims.**

Site L3 “GEO variant” remains **frozen** until the OpenAI half is reviewed.

See [`hypothesis.md`](hypothesis.md) · [`protocol.json`](protocol.json) · [`results.md`](results.md).
