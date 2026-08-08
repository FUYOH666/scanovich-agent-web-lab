# Preregistration

Public manifests that freeze experimental commitments **without** revealing sealed holdout contents.

## Files

| File | Purpose |
|------|---------|
| `AW-004.md` | Human-readable preregistration note |
| `experiment-config.json` | Machine-readable config (no answer keys) |
| `holdout-manifest.sha256` | SHA-256 digest of the sealed Intent Corpus v0.1 freeze |

## Hash procedure

Sealed vault (local, gitignored): `sealed/`

Canonical concatenation (byte-exact):

```text
sha256(
  holdouts/holdout_corpus_v0.1.jsonl
  + "\n--FILE--\n"
  + adversarial/adversarial_corpus_v0.1.jsonl
  + "\n--FILE--\n"
  + gold/gold_labels_v0.1.jsonl
)
```

After AW-004 closes, publish the sealed corpus and verify the digest matches `holdout-manifest.sha256`.
