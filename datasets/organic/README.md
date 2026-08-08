# Basket: organic

Independent humans and their agents that we did **not** initiate.

## Release pipeline (mandatory)

```text
private ingestion (sealed vault raw/)
      ↓
PII / secrets scrub
      ↓
normalization to observation schema
      ↓
manual release review
      ↓
datasets/organic/releases/YYYY-MM-DD-<slug>.json
```

## Forbidden in this public tree

- Raw server logs
- IPs, cookies, emails, Telegram IDs, auth tokens
- Unreviewed paste-back with personal data
- Automatic commits from logging pipelines

## Paste-back minimum (after scrub)

Align with `schemas/observation.schema.json`. Optional free-text notes must contain **no PII**.

`releases/` may be empty in v0.1 until the first reviewed pack exists.

Set `"origin": "organic"`.
