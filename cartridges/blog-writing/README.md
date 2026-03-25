# Blog Post Cartridge
Version: 1.0
Express: supported
Domain : Written content — blog posts, articles, essays, opinion pieces

Use this cartridge for writing a single blog post or article from idea to publishable draft. It guides you from angle and audience through research, structure, section-by-section drafting, and editorial review.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Editor | Audience, angle, format, out of scope |
| 2 | **RESEARCH** | Researcher | Gather sources, data, and evidence |
| 2.5 | **BREAKDOWN** | Orchestrator | Split post into right-sized sections |
| 3 | **DESIGN** | Content Strategist | Narrative arc, key point per section, source mapping |
| 4 | **BUILD** | Writer | Draft one section at a time |
| 5 | **CHECK** | Editor | Editorial pass + polish pass |

---

## Path variants

**Full path**: All phases in sequence. Right for posts with substantial research, multiple body sections, or any post where the structure is not immediately obvious.

**Express**: SHAPE → RESEARCH → DESIGN (complete outline as single plan) → single-pass BUILD → CHECK. BREAKDOWN is skipped. Right for shorter posts, opinion pieces, or any post where the structure is clear after research. Selected at load time.

---

## Unit sizing hint

A section is right-sized for this cartridge if it covers one distinct point or movement in the argument and can be drafted in a single focused pass without losing the thread. Intro and conclusion are always separate units. Body sections should each carry one main idea — if a section is doing two things, split it.

---

## Draft output

BUILD writes draft content to `.draft/[post-slug].md` at the project root. Each section is appended as it is completed. The file is committed alongside `.frame/` state at each unit gate.

---

## Usage notes

**Time expectation:** A full run typically takes 15–30 minutes depending on research depth and machine speed. This process is not optimised for speed — it is optimised for posts worth doing properly.

**NotebookLM:** If NotebookLM is available as a skill in your Claude Code environment, use it for the RESEARCH phase. It handles source gathering with minimal token cost to the Claude Code session, keeping the run lean.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_research.md` — RESEARCH phase template
- `steps/03_breakdown.md` — BREAKDOWN phase template
- `steps/04_design.md` — DESIGN phase template
- `steps/05_build.md` — BUILD phase template
- `steps/06_check.md` — CHECK phase template
