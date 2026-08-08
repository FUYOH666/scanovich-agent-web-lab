# Sealed vault (operator)

Holdout intents, adversarial prompts, and **scoring rubrics** must **not** appear in the public git tree.

## Location

```text
scanovich-agent-web-lab/
├── …public files…
└── sealed/                 # gitignored — never commit / never push
    ├── holdouts/
    ├── adversarial/
    ├── rubrics/            # frozen before scored runs
    ├── gold/               # superseded; do not post-hoc fill
    └── raw/
```

`.gitignore` contains `sealed/`. Do not `git add -f sealed/`.

## Scoring freeze

```text
freeze intents → freeze rubrics → HASH → run models → blind annotation → score
```

Do not author gold prose after seeing model outputs. Rubric shape: `schemas/scoring-rubric.schema.json`.

## Preregistration hash

See `preregistration/README.md` (holdouts + adversarial + rubrics).
