# Schemas

| Schema | Role |
|--------|------|
| `fetch.schema.json` | Server/HTTP exposure event |
| `observation.schema.json` | Agent behavior after exposure |
| `run.schema.json` | Bundles intent + environment + fetches + observation |
| `decision-packet.schema.json` | Machine-readable offer shape (live `/ai/capabilities.json`) |
| `scoring-rubric.schema.json` | Public shape of sealed rubrics |

Do not treat HTTP fetch batches as observations. One agent run may produce many fetches.
