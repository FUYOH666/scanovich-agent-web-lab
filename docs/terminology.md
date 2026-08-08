# Terminology

## Agent attention (operational)

**Agent attention** is used **operationally, not psychologically**. It denotes observable selection events such as:

- fetch
- retrieval
- inclusion in context
- citation
- consideration
- action

It is a measurement metaphor, not a claim that models have human-like attention.

## Attention & Decision Integrity

Research framing for how human and machine selection layers shape commercial decisions — exposure through action — without treating ranking manipulation as the goal.

## Funnel (shared vocabulary)

```text
Machine Exposure → Understanding → Consideration → Recommendation → Action → Economic Outcome
```

Parallel human sketch (not a full psychology model):

```text
Exposure → Attention → Interpretation → Decision → Action
```

## Data Velocity

```text
DataVelocity =
  AgentDiversity
  × IntentDiversity
  × OriginDiversity
  × VariantCoverage
  × Repetitions
```

**OriginDiversity** is especially valuable: many controlled runs from one harness are weaker than fewer runs across independent agent families and human origins.

## Baskets

| Term | Meaning |
|------|---------|
| synthetic | Lab harness / scripts |
| product_probe | Operator-initiated consumer product runs |
| crawler | Indexing bots |
| organic | Independent visitors / their agents |

## Variants (AW-004)

| Code | Representation |
|------|----------------|
| A | Semantic HTML |
| B | HTML + JSON-LD |
| C | Markdown |
| D | Decision Packet |

HTML remains the universal source of truth on the live experiment domain; other forms are alternates.

## Search-time contamination

Risk that an evaluating agent finds benchmark context or answers on the public web (including this repository) and inflates scores. Mitigations: sealed holdouts, hash preregistration, no public gold labels, no semantic answer keys in `AGENTS.md`.
