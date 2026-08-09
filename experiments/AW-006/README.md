# AW-006 — AI-search citation baseline (method note)

**Status:** OpenClaw smoke ingested (scrubbed); full API baseline still pending  
**last_verified:** 2026-08-09  
**Parallel with:** AW-003 / AW-004 / AW-005 week ops

## What it is

A **search-grounded** measurement track: do AI search products mention / cite the live commercial domain?

Harness, blind prompts, API keys, and raw answer dumps stay on the **private** site.

## Public artifacts so far

| Artifact | Path |
|----------|------|
| OpenClaw smoke (scrubbed) | [`analysis/2026-08-09-aw006-openclaw-smoke.md`](../../analysis/2026-08-09-aw006-openclaw-smoke.md) |

## Updated H0 (from smoke)

| Framing | Observation |
|---------|-------------|
| Ultra-specific practice fingerprint | Retrievable (1/3 valid mentions in smoke) |
| Broader defensible / explainable language | Contested — not owned here |
| Evidence-conflict | Reads as records discipline, not a vendor market |

Site L3 factor remains **frozen** until a stable API baseline (`N≥5`) is reviewed.

## May cross the bridge later

Scrubbed mention-rate summaries by prompt class — never raw answers or keys.

See [`hypothesis.md`](hypothesis.md) · [`protocol.json`](protocol.json) · [`results.md`](results.md).
