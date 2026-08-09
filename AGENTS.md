# AGENTS.md — working rules for this repository

Audience: humans and coding agents contributing to the **public methodology** repo.

This file is an operations contract. It is **not** a semantic answer key about any commercial entity.

## Role boundary

- You own: methodology docs, JSON schemas, public sample datasets, probe runners, analysis, preregistration manifests, release-safe observations.
- You do **not** own: storefront deploy, Next.js pages, Cloudflare Workers, or private analytics tokens for the live commercial site.
- Treat live experiment surfaces as read-only canon. Cite production URLs; do not mirror private site code into this repo.

## Canon split

| Surface | Role |
|---------|------|
| **This GitHub repo** | Method — protocols, schemas, code, release-safe data, reproducibility |
| **Live commercial domain** | Experiment — entity, variants, probe endpoints, observatory |

Do not duplicate marketing or ontology narrative here in a form that functions as a retrieval cheat sheet.

## Hard rules

1. **No fabrication** of observations, scores, or Observatory percentages.
2. **Never mix data baskets** in week-level KPI narratives (`synthetic`, `product_probe`, `crawler`, `organic`).
3. **Never commit secrets**: `.env`, API tokens, Cloudflare credentials, cookies, auth headers.
4. **Never commit PII** or raw server logs. Organic data enters only via the release pipeline (see `datasets/organic/README.md`).
5. **Never publish sealed holdouts**, scoring rubrics, expected answers, or adversarial prompts (`sealed/` is gitignored).
6. **Never commit distribution drafts** (`comms/`, including LinkedIn) — local only.
7. **No post-hoc gold:** freeze rubrics before scored runs; never rewrite rubrics after seeing model answers.
8. **No semantic ground truth** in public files that tells an agent how a commercial entity “should” be understood (capabilities lists framed as correct answers, fit/unfit keys, expected citations).
9. Experiment IDs are stable: do not renumber AW-001…. Document live experiments (AW-004, AW-005, …) as method shells; never import Worker scorers or gold.
10. Prefer `fetch` / `run` / `observation` schemas; do not treat HTTP fetch batches as agent observations.
11. Bridge with the private site: hub URLs + redacted aggregate counts may be published; KV/AE dumps, gold, and scorer code must not.

## Sealed vault

Holdouts, adversarial prompts, and scoring rubrics live in local **`sealed/`** (gitignored). Public side publishes **hashes only** under `preregistration/`.

If you need a holdout for scoring: read `sealed/` locally; never `git add` or push that directory.

## How results are recorded

- Prefer `fetch` / `run` / `observation` schemas (`schemas/README.md`).
- Record `environment.model_version` (or honest `unknown`).
- Write release-safe aggregates under the appropriate `datasets/<basket>/` path.
- Append dated notes under `analysis/` or experiment `results.md` — include `last_verified` when citing live URLs.
- Negative results are first-class; do not spin them as wins.

## Naming

- Experiments: `AW-NNN` directories under `experiments/`.
- Organic releases: `datasets/organic/releases/YYYY-MM-DD-<slug>.json`.
- Public intents: `datasets/synthetic/public/` only (no gold fields).

## Before every commit

- No `.env`, tokens, cookies, or Cloudflare credentials
- No IPs, emails, phone numbers, or raw document text
- No `sealed/` or `comms/` (gitignored — never force-add)
- No raw server / CDN log dumps
- Organic files only under `datasets/organic/releases/` after review
- No home-directory paths or internal hostnames

## When blocked on live-site behavior

Stop. File a short issue note for the website operator. Do not patch the storefront from this repo.
