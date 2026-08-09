# Field note — EC-001 aggregate stats glance

**Date:** 2026-08-09  
**Experiment:** AW-005 / EC-001  
**Basket:** mixed (API exposes aggregates only — treat as lab instrumentation, not organic proof)  
**Source:** `GET https://scanovich.ai/api/evidence-challenge/001/stats`  
**last_verified:** 2026-08-09 (hub re-check after private site 4.12.0 deploy)

## Redacted counts (point-in-time)

| Field | Value |
|-------|------:|
| total_runs | 3 |
| completed_runs | 3 |
| truth_passes | 3 |
| conflict_passes | 3 |
| shared_runs | 0 |
| referred_submissions | 0 |

## Surface check

| URL | HTTP |
|-----|-----:|
| https://scanovich.ai/api/evidence-challenge/001/stats | 200 |
| https://scanovich.ai/research/agent-web/evidence-challenge/ | 200 |

Both hub and stats API are live. Gold answers and Worker scorer remain private.

## Integrity

No gold, no scorer logic, no KV dumps. Counts only — suitable for public method chronology.
