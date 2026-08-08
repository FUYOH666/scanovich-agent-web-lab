# Field note — AW-004 Phase 0 surface verification

**Date:** 2026-08-08  
**Phase:** 0  
**Basket:** `synthetic`  
**Unit:** `fetch` (not observation)  
**Artifact:** `results/aw004_surfaces_2026-08-08T082742Z.json`  
**last_verified:** 2026-08-08

## Finding

> **Phase 0:** requesting Markdown did not by itself produce Markdown on these four research surfaces.

Runner `probes/runners/fetch_aw004_surfaces.sh` fetched hub, AW-004, Bring Your Agent, and Observatory with `Accept: text/html` and `Accept: text/markdown`.

All eight requests returned HTTP 200. For every path, `requested=markdown` still yielded `served=html` (`Content-Type: text/html`).

This is surface verification only. It does **not** test assigned variants A–D, and it does not score agent understanding.

## Interpretation bounds

- Does not imply Markdown twins are absent everywhere on the commercial domain
- Does not measure live ChatGPT/Claude fetch behavior
- Useful as a negative/neutral control before Phase 1
