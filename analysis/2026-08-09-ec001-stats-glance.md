# Field note — EC-001 aggregate stats glance

**Date:** 2026-08-09  
**Experiment:** AW-005 / EC-001  
**Basket:** mixed (API exposes aggregates only — treat as lab instrumentation, not organic proof)  
**Source:** `GET https://scanovich.ai/api/evidence-challenge/001/stats`  
**last_verified:** 2026-08-09

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
| `/api/evidence-challenge/001/stats` | 200 |
| `/research/agent-web/evidence-challenge/` | 404 at verification time |

Challenge HTML ships with the private site deploy; stats Worker was already live. Re-verify hub URL after Render catches up.

## Integrity

No gold, no scorer logic, no KV dumps. Counts only — suitable for public method chronology.
