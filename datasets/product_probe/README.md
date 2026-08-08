# Basket: product_probe

Intentional runs inside consumer products (ChatGPT, Claude, Gemini, Perplexity, etc.) by lab operators.

Rules:

- Redact/anonymize any incidental PII before commit.
- Store release-safe observations only (see `schemas/observation.schema.json`).
- Do not commit full chat exports with account identifiers.

Set `"origin": "product_probe"`.
