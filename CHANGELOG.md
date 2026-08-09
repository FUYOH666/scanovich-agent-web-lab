# Changelog

## v0.1.2 — 2026-08-09

- Document live **AW-005 / EC-001** Evidence Challenge (method shell only)
- README links challenge hub + redacted stats glance
- Bridge rule: hub URL + aggregate counts may cross; gold/scorer/KV stay private
- Clarify AW-004 Phase 0 Markdown→HTML as expected control on research surfaces

## v0.1.1 — 2026-08-08

- AW-004 phases documented (0 surface verification → 1 A–D → 2 external agents)
- Phase 0 finding clarified: Markdown Accept alone served HTML on research surfaces
- Split schemas: `fetch` / `run` / `observation` (+ public `scoring-rubric` shape)
- Observation/run `environment` metadata (`model_version`, retrieval/tooling mode, locale, …)
- Scoring freeze: rubrics before runs; no post-hoc gold labels
- Sealed hash now covers holdouts + adversarial + rubrics

## v0.1.0 — 2026-08-08

- Initial public methodology repository
- Observation + Decision Packet JSON Schemas
- Four data baskets (`synthetic`, `product_probe`, `crawler`, `organic`)
- Public sample Intent Corpus v0.1 (20 prompts); holdouts sealed + hashed
- AW-004 preregistration manifests
- Experiment shells for AW-001 and AW-004
- Public probe runner against live surfaces
- Local distribution drafts stay out of git (`comms/` gitignored)
