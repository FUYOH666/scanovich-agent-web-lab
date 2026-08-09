# AW-005 — Evidence Challenge #001 (EC-001)

**Live hub:** https://scanovich.ai/research/agent-web/evidence-challenge/  
**Aggregate stats (redacted counts):** https://scanovich.ai/api/evidence-challenge/001/stats  
**Lab hub:** https://scanovich.ai/research/agent-web/  
**last_verified:** 2026-08-09

## What it is

A live challenge where an operator’s AI must reconcile **conflicting synthetic sources**, produce a scored truth answer, and optionally **share** so a second participant can enter.

This repository documents the experiment as **method**. Scorer gold, Worker code, and KV/AE dumps stay on the private site — they do not cross into this repo.

## What may be recorded here

| Allowed | Forbidden |
|---------|-----------|
| Hub URL + experiment id | Gold answers / scoring keys |
| Redacted aggregate stats (`completed_runs`, rates) | Raw KV / AE dumps, IPs, full UA strings |
| Scrubbed paste-backs → `datasets/organic/releases/` | Unreviewed submissions |

## Relation to AW-004

AW-004 (Bring Your Agent) measures representation / understanding on probe URLs.  
AW-005 measures **evidence conflict resolution** and share/referral loops. Both run in parallel.

## Status

| Surface | Notes |
|---------|--------|
| Stats API | Live (aggregate counts only) |
| Challenge HTML | Deployed with the private site release that ships the UI |

See [`hypothesis.md`](hypothesis.md) · [`protocol.json`](protocol.json).
