# AW-006 — AI-search citation baseline (method note)

**Status:** Perplexity half-baseline + post–Buyer Language Bridge remeasure ingested  
**last_verified:** 2026-08-09  
**Private site:** `4.13.0`  
**Parallel with:** AW-003 / AW-004 / AW-005

## What it is

A **search-grounded** measurement track: do AI search products mention / cite the live commercial domain?

Harness dumps and API keys stay on the **private** site.

## Public artifacts

| Artifact | Path |
|----------|------|
| OpenClaw smoke | [`analysis/2026-08-09-aw006-openclaw-smoke.md`](../../analysis/2026-08-09-aw006-openclaw-smoke.md) |
| Perplexity baseline | [`analysis/2026-08-09-aw006-perplexity-baseline.md`](../../analysis/2026-08-09-aw006-perplexity-baseline.md) |
| Post-bridge remeasure | [`analysis/2026-08-09-aw006-post-bridge-remeasure.md`](../../analysis/2026-08-09-aw006-post-bridge-remeasure.md) |

## Latest Perplexity signal (post-bridge)

| Set | Mention rate |
|-----|-------------:|
| buyer-broad (40) | **12.5%** — mid B05 = 5/5 → `/customs/`; broad broker **0%** |
| trade_customs (20) | **5%** — no lift vs prior ~15% baseline |

Roadmap targets (broad 2–3 hits / trade_customs ≥25–30%) **not met**.  
Next lever: **off-site evidence**, not another on-site GEO pass.

## H0 (current)

Mid dossier language can retrieve `/customs/`. Broad broker-tool language does not. Engine variance remains. **No ranking guarantees.**

See [`hypothesis.md`](hypothesis.md) · [`protocol.json`](protocol.json) · [`results.md`](results.md).
