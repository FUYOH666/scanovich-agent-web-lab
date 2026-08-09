# Field note — AW-006 Perplexity Sonar baseline (scrubbed)

**Date:** 2026-08-09  
**Experiment:** AW-006  
**Engine:** Perplexity Sonar  
**Basket:** `synthetic` (scripted harness)  
**Private site:** `4.12.2`  
**Source:** scrubbed private-lab summary (raw JSONL stays private)  
**last_verified:** 2026-08-09

**Half-baseline:** 20 frozen blind prompts × 5 repeats = **100** valid runs, **0** errors.  
OpenAI Responses + `web_search` half **not run** yet (private key pending).

## Headline rates

| Metric | Value |
|--------|------:|
| Valid runs / errors | 100 / 0 |
| Mentions of the live domain | 4 |
| Overall mention rate | **4%** |
| Digicust present in competitive blobs | 10 runs |
| Confidios present (this engine/window) | 0 |

### By prompt class

| Class | Valid | Mentions | Rate |
|-------|------:|---------:|-----:|
| ultra_specific_category | 20 | 1 | 5% |
| trade_customs | 20 | 3 | **15%** |
| supplier_spreadsheet | 25 | 0 | 0% |
| evidence_conflict | 20 | 0 | 0% |
| generic_ai_docs | 15 | 0 | 0% |

## Engine variance (method)

| Probe | Result |
|-------|--------|
| OpenClaw + OpenAI-search smoke | Ultra-specific fingerprint can hit the live domain |
| Perplexity Sonar (this baseline) | Same fingerprint class often misses (e.g. strong smoke prompt → **0/5** here) |

Do **not** generalize visibility from one engine or one smoke.

## Interpretation (lab, not marketing)

1. Perplexity Sonar does **not** treat the live domain as a category default (4% overall).
2. Best adjacency so far: **trade / customs dossier** language (~15%) — not supplier-spreadsheet shortlists (0%).
3. Digicust appears in competitive blobs; the live domain is not the default shortlist pick.
4. Evidence-conflict and generic AI-docs classes: **0%** mentions in this window.
5. Harness stability on Perplexity after retries: usable meter for this engine (0 transport errors).

## Explicit non-claims

- No guaranteed AI-search ranking or citation outcomes.
- Smoke ≠ multi-engine baseline; OpenAI half still pending.
- No L3 storefront “GEO variant” from this half alone — private freeze until both engines are reviewed.

## Live canon (cite only)

- Lab hub: https://scanovich.ai/research/agent-web/  
- EC-001: https://scanovich.ai/research/agent-web/evidence-challenge/  
- Stats: https://scanovich.ai/api/evidence-challenge/001/stats  

EC-001 gold / Worker scorer remain private.
