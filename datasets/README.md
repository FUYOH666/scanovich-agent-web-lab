# Datasets

Observations and public sample intents for Agent Web Lab.

## Baskets

| Basket | Meaning | Public path |
|--------|---------|-------------|
| **synthetic** | Harness / API / scripted probes | `synthetic/` (public samples under `synthetic/public/`) |
| **product_probe** | Intentional runs in ChatGPT / Claude / Gemini / Perplexity by operators | `product_probe/` |
| **crawler** | Indexing bots (OAI-SearchBot, Googlebot, Bingbot, ClaudeBot, …) | `crawler/` |
| **organic** | Independent human/agent traffic we did not initiate | `organic/releases/` only |

**Never mix baskets** in week-level KPI narratives.

Contrast of interest: **indexing / crawler behavior ≠ live agent fetch behavior**.

## Intent Corpus v0.1 split

| Portion | Count | Where |
|---------|------:|-------|
| Public examples | 20 | `synthetic/public/intents_v0.1.jsonl` |
| Private holdouts | 60 | sealed vault (hashed in `preregistration/`) |
| Adversarial holdouts | 20 | sealed vault |

Public examples are **prompts only** — no gold labels.

## Schema

Prefer `schemas/observation.schema.json` for stored observations.

## License

Published datasets: **CC BY 4.0** unless a release states otherwise.
