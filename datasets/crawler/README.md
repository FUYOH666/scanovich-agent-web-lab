# Basket: crawler

Indexing and retrieval bots (examples: OAI-SearchBot, Googlebot, Bingbot, ClaudeBot).

These observations measure **discovery / indexing exposure**, not live user-facing agent chat behavior.

Rules:

- Aggregate or anonymize user-agent strings if they embed unusual tokens.
- Never commit raw CDN log lines with IPs or query secrets.
- Prefer counts and boolean exposure fields in observation records.

Set `"origin": "crawler"`.

Remember: **crawler ≠ organic live agent**.
