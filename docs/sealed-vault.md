# Sealed vault (operator)

Holdout intents, adversarial prompts, and gold labels must **not** appear in the public git tree.

## Location

One project folder. Sealed material lives **inside** this repo as a local, gitignored directory:

```text
scanovich-agent-web-lab/
├── …public files…
└── sealed/                 # gitignored — never commit / never push
    ├── holdouts/
    ├── adversarial/
    ├── gold/
    └── raw/                # pre-scrub organic ingestion
```

`.gitignore` contains `sealed/`. Do not `git add -f sealed/`.

## What belongs in sealed

- ~60 holdout intents + ~20 adversarial holdouts (Intent Corpus v0.1 private portion)
- Gold labels / expected answer shapes
- Future experiment variants not yet live
- Raw organic ingestion before scrub

## Preregistration

Before scored holdout runs:

1. Freeze the sealed corpus files.
2. Compute a SHA-256 over the canonical archive (see `preregistration/README.md`).
3. Publish only the digest in `preregistration/holdout-manifest.sha256`.

After AW-004 closes, the corpus may be published and the hash verified.
