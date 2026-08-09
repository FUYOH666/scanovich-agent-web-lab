# Agent Web Lab

[![CI](https://img.shields.io/github/actions/workflow/status/FUYOH666/scanovich-agent-web-lab/ci.yml?branch=main&style=flat-square&label=CI)](https://github.com/FUYOH666/scanovich-agent-web-lab/actions)
[![Release](https://img.shields.io/github/v/release/FUYOH666/scanovich-agent-web-lab?style=flat-square)](https://github.com/FUYOH666/scanovich-agent-web-lab/releases)
[![Live lab](https://img.shields.io/badge/live-scanovich.ai-0f766e?style=flat-square)](https://scanovich.ai/research/agent-web/)
[![License: MIT](https://img.shields.io/badge/code-MIT-111827?style=flat-square)](LICENSE)
[![License: CC BY 4.0](https://img.shields.io/badge/docs%20%26%20data-CC%20BY%204.0-1d4ed8?style=flat-square)](LICENSES/CC-BY-4.0.txt)

**Open experiments on how AI agents discover, interpret, compare, and act on information published on the open web.**

Not a ranking playbook. A living measurement program on a real commercial domain.

---

### The question

> What actually determines whether an AI system can discover, understand, consider, and act on a business online?

Humans have long studied how information captures and directs attention.  
We measure the equivalent **selection layer in AI agents** — operationally, not psychologically:

`fetch → retrieval → understanding → consideration → citation → action`

---

### Live canon

| Surface | URL |
|---------|-----|
| Lab hub | https://scanovich.ai/research/agent-web/ |
| Evidence Challenge (AW-005 / EC-001) | https://scanovich.ai/research/agent-web/evidence-challenge/ |
| EC-001 stats (counts only) | https://scanovich.ai/api/evidence-challenge/001/stats |
| Bring Your Agent (AW-004) | https://scanovich.ai/research/agent-web/bring-your-agent/ |
| AW-004 brief | https://scanovich.ai/research/agent-web/aw-004/ |
| Live proof leaf | https://scanovich.ai/customs/ |

EC-001: cite the hub + scrubbed counts. **Gold / Worker scorer stay private.**

---

### Start here

| | |
|---|---|
| **Try it** | [Bring Your Agent](https://scanovich.ai/research/agent-web/bring-your-agent/) — probe how an agent reads the live site |
| **Evidence challenge** | [Evidence Challenge #001](https://scanovich.ai/research/agent-web/evidence-challenge/) — conflicting sources → scored truth → share |
| **Method notes** | [AW-004](experiments/AW-004/) · [AW-005](experiments/AW-005/) · [AW-006](experiments/AW-006/) |

---

### What we’ve already measured

**Phase 0 (AW-004).** On four research surfaces, `Accept: text/markdown` still returned HTML — an expected control for those paths.  
→ [`analysis/2026-08-08-probe-dry-run.md`](analysis/2026-08-08-probe-dry-run.md)

**EC-001 (AW-005).** Hub + stats API live; aggregate counts only (gold private).  
→ [`analysis/2026-08-09-ec001-stats-glance.md`](analysis/2026-08-09-ec001-stats-glance.md)

**AW-006 (Perplexity meter).** Half-baseline **4%** overall mention rate. After Buyer Language Bridge: buyer-broad **12.5%**, but those hits were **one mid-dossier prompt** (stable `/customs/` citation — prompt stability, not category width); broad broker language **0%**; trade_customs remeasure **5%** (lift targets not met). OpenAI Responses + `web_search` half still pending. Next lever under test: **off-site evidence** (hypothesis, not proven).  
→ [`analysis/2026-08-09-aw006-perplexity-baseline.md`](analysis/2026-08-09-aw006-perplexity-baseline.md) · [`analysis/2026-08-09-aw006-post-bridge-remeasure.md`](analysis/2026-08-09-aw006-post-bridge-remeasure.md)

We publish rates and negative results. We do **not** claim guaranteed AI-search ranking.

---

### Method ↔ Experiment

| | Role |
|---|---|
| **This repository** | Method — protocols, schemas, probes, release-safe data |
| **scanovich.ai** | Experiment — live pages, probe URLs, observatory |

We do not mirror the site into GitHub. The site is the instrument; this repo is how others can reproduce the method.

---

### How we measure

Four independent data baskets — never mixed in weekly narratives:

`synthetic` · `product_probe` · `crawler` · `organic`

**Indexing behavior ≠ live agent behavior.**

Units of record: [`fetch`](schemas/fetch.schema.json) → [`run`](schemas/run.schema.json) → [`observation`](schemas/observation.schema.json)

Integrity by design: public sample prompts for demos; holdouts and scoring rubrics stay sealed and pre-hashed — so the test cannot quietly rewrite itself after results appear.

→ [`METHODOLOGY.md`](METHODOLOGY.md) · [`preregistration/`](preregistration/) · [`datasets/`](datasets/)

---

### Explore the repo

| Path | What you’ll find |
|------|------------------|
| [`METHODOLOGY.md`](METHODOLOGY.md) | Funnel, Data Velocity, limitations |
| [`schemas/`](schemas/) | Fetch / run / observation / Decision Packet |
| [`experiments/AW-004/`](experiments/AW-004/) | Bring Your Agent |
| [`experiments/AW-005/`](experiments/AW-005/) | Evidence Challenge EC-001 |
| [`experiments/AW-006/`](experiments/AW-006/) | AI-search citation rates (scrubbed) |
| [`analysis/`](analysis/) | Field notes & negative results |
| [`probes/`](probes/) | Public runners against live URLs |
| [`CITATION.cff`](CITATION.cff) | Cite this repository |

```bash
git clone https://github.com/FUYOH666/scanovich-agent-web-lab.git
cd scanovich-agent-web-lab
bash scripts/ci/validate.sh
bash probes/runners/fetch_aw004_surfaces.sh
```

---

### License & cite

| Material | License |
|----------|---------|
| Code (`probes/`, `scripts/`, CI) | [MIT](LICENSE) · [LICENSES/MIT.txt](LICENSES/MIT.txt) |
| Documentation & published datasets | [CC BY 4.0](LICENSES/CC-BY-4.0.txt) |

Use GitHub **Cite this repository** ([`CITATION.cff`](CITATION.cff)).

---

<p align="center">
  <a href="https://scanovich.ai/research/agent-web/"><strong>Machine decisions on the open web</strong></a><br/>
  <sub>AW-004 · AW-005 · AW-006 — methodology accumulating</sub>
</p>
