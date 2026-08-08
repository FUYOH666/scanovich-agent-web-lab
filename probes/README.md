# Probes

Public, secret-free recipes for hitting **live** experiment URLs.

- `public/` — static prompt templates (no gold answers)
- `runners/` — shell scripts that fetch surfaces and write release-safe JSON under `results/` (gitignored scratch optional)

Rules:

- Never embed API keys
- Never print or commit sealed holdouts
- Label output with `origin: synthetic` unless you intentionally ran a product UI
