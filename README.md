# Agent Web Lab

Open experiments on how AI agents discover, interpret, compare and act on information published on the web.

We test HTML, Markdown, structured data, provenance and machine-readable decision objects on a **live commercial domain**.

**Status:** `v0.1` — methodology established, observations accumulating.

---

### LIVE EXPERIMENT

**AW-004** — Representations for AI agents  
https://scanovich.ai/research/agent-web/aw-004/

### TRY WITH YOUR AGENT

**Bring Your Agent** — you become an operator of the experiment  
https://scanovich.ai/research/agent-web/bring-your-agent/

### LAB HUB

https://scanovich.ai/research/agent-web/

### DATA

- Public sample intents: [`datasets/synthetic/public/`](datasets/synthetic/public/)
- Baskets & release rules: [`datasets/README.md`](datasets/README.md)
- Observation schema: [`schemas/observation.schema.json`](schemas/observation.schema.json)

### METHODOLOGY

[`METHODOLOGY.md`](METHODOLOGY.md) · [`docs/terminology.md`](docs/terminology.md) · [`docs/limitations.md`](docs/limitations.md)

---

## Canon split

| Surface | Role |
|---------|------|
| **This repository** | Method — protocols, schemas, code, release-safe datasets, reproducibility |
| **scanovich.ai** | Experiment — live variants, probe endpoints, observatory, commercial reality |

Do not treat this repo as a mirror of the site narrative.

## Data baskets

`synthetic` · `product_probe` · `crawler` · `organic`

Never mix them in week-level KPI stories. Indexing bots and live agents are different observation types.

## Scientific integrity

- Public sample corpus (~20 prompts) for reproducibility demos
- Holdouts + gold labels stay **sealed** (hashed in [`preregistration/`](preregistration/))
- No expected answers or semantic ground-truth cheat sheets in public files
- Organic data only via scrub → review → [`datasets/organic/releases/`](datasets/organic/releases/)

See [`docs/sealed-vault.md`](docs/sealed-vault.md).

## Not in public git (see `.gitignore`)

| Path | Why |
|------|-----|
| `sealed/` | Holdouts, gold labels, raw ingest |
| `comms/` | LinkedIn / distribution drafts (local only) |
| `private/`, `.env`, logs | Secrets / operator scratch |

## Secret / PII checklist (before every commit)

- [ ] No `.env`, tokens, cookies, or Cloudflare API credentials
- [ ] No IPs, emails, phone numbers, or raw document text
- [ ] No `sealed/` or `comms/` (gitignored — do not force-add)
- [ ] No raw server / CDN log dumps
- [ ] Organic files only under `releases/` after manual review
- [ ] No home-directory paths or internal hostnames

## Cite

See [`CITATION.cff`](CITATION.cff) (GitHub “Cite this repository”).

## License

| Material | License |
|----------|---------|
| Source code (`probes/`, runners, scripts) | [MIT](LICENSES/MIT.txt) |
| Documentation | [CC BY 4.0](LICENSES/CC-BY-4.0.txt) |
| Published datasets | [CC BY 4.0](LICENSES/CC-BY-4.0.txt) unless a release states otherwise |

## Working in this repo

Contributor / agent rules: [`AGENTS.md`](AGENTS.md) (operations only — not an answer key).

## Quick start

```bash
git clone https://github.com/FUYOH666/scanovich-agent-web-lab.git
cd scanovich-agent-web-lab
# read README → METHODOLOGY.md → schemas/
# run a public probe against live URLs (no local site required)
bash probes/runners/fetch_aw004_surfaces.sh
```
