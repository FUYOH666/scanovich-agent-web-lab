# AW-006 — AI-search citation baseline (method note)

**Status:** private-site harness scaffolded (`4.12.1`); full baseline not yet run  
**last_verified:** 2026-08-09  
**Parallel with:** AW-003 / AW-004 / AW-005 week ops (does not pause them)

## What it is

A **search-grounded** measurement track: do AI search products mention / cite the live commercial domain for a frozen blind prompt set?

Harness, blind prompts, API keys, and raw answer dumps live on the **private** site only.

## What may appear here later

| Allowed | Forbidden |
|---------|-----------|
| Scrubbed mention-rate summaries by prompt class | Full prompts if they act as answer keys for the baseline |
| H0 outcome notes (presence / absence patterns) | Raw model answers, API keys, engine dumps |
| Link to live lab hub | Copying private runner / `.env` |

Until a scrubbed summary is exported via the bridge, this folder is a **placeholder protocol** only.

## H0 (qualitative, public-safe)

Ultra-specific private-practice framing → expect mentions.  
Broad supplier-spreadsheet shortlists → expect absence until/unless a later controlled machine-surface variant is tested.

Site factor for any L3 variant is **frozen** until baseline review (private field note).

See [`hypothesis.md`](hypothesis.md) · [`protocol.json`](protocol.json).
