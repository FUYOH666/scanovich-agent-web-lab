# Methodology — Agent Web Lab

**Version:** v0.1  
**Canon split:** this repository = **Method**; live commercial domain = **Experiment**.

## Operational definition

> **Agent attention is used operationally, not psychologically:** it denotes observable selection events such as fetch, retrieval, inclusion in context, citation, consideration and action.

## Funnel

```text
Machine Exposure → Understanding → Consideration → Recommendation → Action → Economic Outcome
```

## What we optimize

Not vanity traffic. **Data Velocity:**

```text
DataVelocity =
  AgentDiversity
  × IntentDiversity
  × OriginDiversity
  × VariantCoverage
  × Repetitions
```

Independent origins (external agents, crawlers, researchers) outweigh large volumes of single-harness synthetic traffic.

## Representations under test (AW-004)

| Variant | Surface |
|---------|---------|
| A | Semantic HTML |
| B | HTML + JSON-LD |
| C | Markdown (e.g. `Accept: text/markdown` / selected AI UA paths) |
| D | Decision Packet |

HTML is the source of truth on the live site. Markdown and JSON are alternates, not replacements.

Live brief: https://scanovich.ai/research/agent-web/aw-004/  
`last_verified`: 2026-08-08

## Data baskets

| Basket | Initiator |
|--------|-----------|
| `synthetic` | Lab harness / scripts |
| `product_probe` | Operators in consumer AI products |
| `crawler` | Indexing bots |
| `organic` | Independent humans / agents |

Never mix baskets in week-level KPI narratives.  
**Indexing behavior ≠ live agent behavior.**

## Anti-contamination

Public web material can inflate agent benchmarks when models retrieve the benchmark itself (search-time contamination). Therefore:

- ~20 public intent examples (prompts only)
- Holdouts + adversarial prompts + gold labels stay in a **sealed vault**
- `preregistration/holdout-manifest.sha256` publishes the digest only
- This repo must not ship expected answers or semantic ground-truth cheat sheets

See `docs/sealed-vault.md` and `preregistration/`.

## Observations

Unit of record: `schemas/observation.schema.json` (`scanovich.agent_web_observation.v1`).

Organic path: private ingest → scrub → normalize → manual review → `datasets/organic/releases/`.

## Disclaimers

- Allowing `OAI-SearchBot` helps discovery possibility; it does **not** guarantee ChatGPT search inclusion.
- Manual product chats and search indexing are different processes.
- Negative results are published when measured.
- No fabricated percentages on Observatory stubs.

## Related

- [docs/terminology.md](docs/terminology.md)
- [docs/limitations.md](docs/limitations.md)
- [datasets/README.md](datasets/README.md)
