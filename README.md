# Agent Web Lab

[![Release](https://img.shields.io/github/v/release/FUYOH666/scanovich-agent-web-lab?style=flat-square)](https://github.com/FUYOH666/scanovich-agent-web-lab/releases)
[![Live lab](https://img.shields.io/badge/live-scanovich.ai-0f766e?style=flat-square)](https://scanovich.ai/research/agent-web/)
[![License: MIT](https://img.shields.io/badge/code-MIT-111827?style=flat-square)](LICENSES/MIT.txt)
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

### Start here

| | |
|---|---|
| **Try it** | [Bring Your Agent](https://scanovich.ai/research/agent-web/bring-your-agent/) — run the live probe with ChatGPT, Claude, Gemini, Perplexity, or your own agent |
| **Read the brief** | [AW-004](https://scanovich.ai/research/agent-web/aw-004/) — representations under test |
| **Lab hub** | [scanovich.ai/research/agent-web](https://scanovich.ai/research/agent-web/) |

---

### A real result (Day 1)

On four research surfaces, requesting Markdown (`Accept: text/markdown`) still returned HTML.

That is **Phase 0** — surface verification — not yet a full A/B/C/D agent comparison.  
Negative and unexpected results are published on purpose.

→ [`results/`](results/) · [`analysis/`](analysis/2026-08-08-probe-dry-run.md)

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
| [`METHODOLOGY.md`](METHODOLOGY.md) | Funnel, phases, Data Velocity, limitations |
| [`schemas/`](schemas/) | Fetch / run / observation / Decision Packet |
| [`experiments/AW-004/`](experiments/AW-004/) | Protocol shell and phase status |
| [`probes/`](probes/) | Public runners against live URLs |
| [`CITATION.cff`](CITATION.cff) | Cite this repository |

```bash
git clone https://github.com/FUYOH666/scanovich-agent-web-lab.git
cd scanovich-agent-web-lab
bash probes/runners/fetch_aw004_surfaces.sh
```

---

### License & cite

**Code** — [MIT](LICENSES/MIT.txt) · **Documentation & published datasets** — [CC BY 4.0](LICENSES/CC-BY-4.0.txt)

Use GitHub **Cite this repository** ([`CITATION.cff`](CITATION.cff)).

---

<p align="center">
  <a href="https://scanovich.ai/research/agent-web/bring-your-agent/"><strong>Can your AI correctly understand this website?</strong></a><br/>
  <sub>Bring Your Agent · Agent Web Experiment AW-004</sub>
</p>
