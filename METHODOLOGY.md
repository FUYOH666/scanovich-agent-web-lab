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

### Phases

| Phase | Focus |
|------:|-------|
| 0 | Surface verification (Accept / client → served representation) |
| 1 | Controlled A–D comparison |
| 2 | External agent observations (BYA / product probes) |

Phase 0 finding (2026-08-08): Markdown Accept alone did not yield Markdown on the four research surfaces — HTML was served. See `results/` and `analysis/2026-08-08-probe-dry-run.md`.

Live brief: https://scanovich.ai/research/agent-web/aw-004/  
`last_verified`: 2026-08-08

## Units of record

| Unit | Schema | Meaning |
|------|--------|---------|
| **Fetch** | `schemas/fetch.schema.json` | One HTTP/server exposure |
| **Observation** | `schemas/observation.schema.json` | Agent understanding → action |
| **Run** | `schemas/run.schema.json` | Intent + environment + fetches + observation |

One agent run may produce many fetches. Do not count every fetch as an observation.

Record `environment.model_version` (or honest `unknown`) — product labels alone are not stable over months.

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
- Holdouts + adversarial prompts + scoring rubrics stay in **`sealed/`** (gitignored)
- `preregistration/holdout-manifest.sha256` publishes the digest only
- This repo must not ship expected answers or semantic ground-truth cheat sheets

See `docs/sealed-vault.md` and `preregistration/`.

## Scoring freeze (no post-hoc gold)

```text
freeze intents → freeze rubric → HASH → run models → blind annotation → score
```

Do not author “correct answers” after seeing model outputs. Rubrics use `required_concepts` / `must_not_claim` / `constraint_checks` (see `schemas/scoring-rubric.schema.json`).

## Organic releases

Private ingest → scrub → normalize → manual review → `datasets/organic/releases/`.

## Disclaimers

- Allowing `OAI-SearchBot` helps discovery possibility; it does **not** guarantee ChatGPT search inclusion.
- Manual product chats and search indexing are different processes.
- Negative results are published when measured.
- No fabricated percentages on Observatory stubs.

## Related

- [docs/terminology.md](docs/terminology.md)
- [docs/limitations.md](docs/limitations.md)
- [datasets/README.md](datasets/README.md)
