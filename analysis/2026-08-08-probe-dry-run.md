# Field note — public probe dry-run

**Date:** 2026-08-08  
**Basket:** `synthetic`  
**Artifact:** `results/aw004_surfaces_2026-08-08T082742Z.json`  
**last_verified:** 2026-08-08

## Summary

Runner `probes/runners/fetch_aw004_surfaces.sh` fetched hub, AW-004, Bring Your Agent, and Observatory with `Accept: text/html` and `Accept: text/markdown`.

All eight requests returned HTTP 200. For these paths, the response `Content-Type` remained HTML even when Markdown was requested — i.e. `requested=markdown` / `served=html` in this synthetic run.

This is an exposure observation only; it does not score understanding and does not claim product-agent behavior.
