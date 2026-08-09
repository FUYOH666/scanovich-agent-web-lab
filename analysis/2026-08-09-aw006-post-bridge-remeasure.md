# Field note — AW-006 post Buyer Language Bridge remeasure (scrubbed)

**Date:** 2026-08-09  
**Experiment:** AW-006  
**Variant:** Buyer Language Bridge v1 live on `scanovich.ai` before runs  
**Engine:** Perplexity Sonar · **0** errors  
**Private site:** `4.13.0`  
**Source:** scrubbed private-lab summary (raw JSONL stays private)  
**last_verified:** 2026-08-09

OpenAI half still blocked (no private key).

## Buyer-broad set (40 runs)

| Slice | Mention rate | Notes |
|-------|-------------:|-------|
| Overall (`buyer-broad`, 40) | **12.5%** (5/40) | |
| `buyer_broad_broker` | **0%** (0/15) | Digicust / SaaS / gov-style shortlists |
| `buyer_mid_dossier` | **33%** (5/15) | **All B05** — 5/5 |
| `buyer_bridge_private` | **0%** (0/10) | |

**Clean mid hit:** mid dossier phrasing stably cited the live domain + `https://scanovich.ai/customs/` on every B05 repeat.

On-site bridge text alone did **not** produce non-zero mentions on broad broker-tool language in this window.

## Frozen `trade_customs` subset (20 runs)

| | |
|--|--:|
| Mention rate (this window) | **5%** (1/20) |
| Pre-bridge Perplexity baseline (same class) | **15%** |

No claim of lift. Small-N + possible post-deploy crawl lag — do **not** treat as proven regression from the bridge alone.

## Vs stated success criteria

| Target | Result |
|--------|--------|
| trade_customs ≥25–30% | **Not met** (5%) |
| Non-zero on 2–3 broad broker prompts | **Not met** (0% broad) |
| Mid ladder signal | **Met for B05** (stable `/customs/` citation) |
| No ranking claims on storefront | Held |

## Interpretation (honest)

1. Mid phrasing that already looks like a private trade dossier still retrieves the live domain (B05).
2. Broad “AI tools for customs brokers” still does not — on-site bridge alone is insufficient for that class.
3. Next lever: **off-site evidence** linking mid-problem language → `/customs/`, not another GEO pass over the homepage.
4. Re-measure after index lag; add OpenAI half when the private key exists.

## Explicit non-claims

- No guaranteed AI-search ranking or citation outcomes.
- Bridge ≠ category ownership for broad broker queries.
- Raw answers, Worker/gold, and harness dumps stay private.

## Live canon (cite only)

- https://scanovich.ai/research/agent-web/  
- https://scanovich.ai/customs/  
- https://scanovich.ai/research/agent-web/evidence-challenge/  
