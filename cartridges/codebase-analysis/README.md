# Codebase Analysis
Version: 0.1
Domain: Codebase examination — structured analysis producing reader-aware documentation reports
Express: supported

Use this cartridge to examine an existing codebase and produce a set of structured documentation reports. Sessions produce up to 7 reports covering stack, structure, architecture, conventions, integrations, testing, and concerns — each written for the target reader established at SHAPE. A compact AI_CONTEXT.md and an actionable ADVICE.md are always produced as the final outputs.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Scope Analyst | Establish reader type, codebase path, exclusions, focus areas |
| 2 | **EXPLORE** | Codebase Navigator | Map the codebase, produce CODEBASE.md and file assignments |
| 2.5 | **BREAKDOWN** | Orchestrator | Enumerate report units in sequence order |
| 3 | **BUILD** | Report Author | Write each report — one unit per report |
| 4 | **SYNTHESIZE** | Context Assembler | Produce AI_CONTEXT.md and ADVICE.md from unit summaries |

**Design decision — no CHECK phase:** This is a documentation cartridge. Reports are reviewed at each BUILD unit gate, and SYNTHESIZE serves as a final validation pass (cross-report consistency, completeness against CODEBASE.md). A separate CHECK phase would add gate overhead without meaningful quality improvement for prose output.

---

## Path variants

**Full analysis:** All phases in sequence. Produces all 7 reports + AI_CONTEXT.md + ADVICE.md.

**Express (AI context only):** SHAPE → EXPLORE → SYNTHESIZE. Skips BREAKDOWN and BUILD. Produces AI_CONTEXT.md only. ADVICE.md is skipped in express mode — it draws from the report set, which does not exist in an express run. Appropriate when the goal is a compact context brief for a future CC session, not a full documentation set.

The path is selected at load time. Express is only appropriate when AI_CONTEXT.md alone meets the need — if any of the 7 reports are wanted, run full mode.

---

## Reader types

Reader type is established at SHAPE and propagates through every report unit:

| Reader | Voice | Emphasis |
|---|---|---|
| New developer | Explanatory, context-first | Mental models before detail |
| Returning author | Terse, decision-focused | What was decided, what's rough |
| Technical stakeholder | Plain language, no code references | What it does and why |
| AI context injection | Structured facts, no prose | Compact, machine-readable |

Two exceptions to reader-type propagation:
- **CONCERNS.md for technical stakeholder** — tone softened; "areas that warrant attention" framing, no alarm language
- **AI_CONTEXT.md** — always machine-format regardless of reader type
- **ADVICE.md** — always action-oriented regardless of reader type; effort-tier grouping

---

## Reports

All reports written to `.frame/reports/`.

| File | Contents |
|---|---|
| `STACK.md` | Runtime, frameworks, tooling, dev dependencies, inferred rationale |
| `STRUCTURE.md` | Component map, file purposes, public vs internal boundaries |
| `ARCHITECTURE.md` | Mental model, component relationships, key decisions, fragility map |
| `CONVENTIONS.md` | Naming, code patterns, file organisation, implicit rules |
| `INTEGRATIONS.md` | External dependencies, APIs, build pipeline, data sources |
| `TESTING.md` | What's tested, what's not, test patterns, coverage gaps |
| `CONCERNS.md` | Structural concerns, documentation gaps, technical debt, new-developer traps |
| `AI_CONTEXT.md` | Compressed brief for CC session injection — synthesized from all reports |
| `ADVICE.md` | Prioritised, actionable improvements grouped by effort tier — full mode only |

`CODEBASE.md` is written to `.frame/CODEBASE.md` during EXPLORE — it is an internal navigation artifact used by BUILD units, not a deliverable report.

---

## Token model

EXPLORE reads broadly but writes compactly — `CODEBASE.md` is structural facts only, no prose analysis. BUILD units read `CODEBASE.md` + their assigned files + prior unit gate summaries only. No unit re-reads what a prior unit already covered. SYNTHESIZE reads gate summaries only — zero source file reads.

**Note:** `CODEBASE.md` is re-read at the start of each BUILD unit (7 times in a full session). This is acceptable because the file is intentionally compact — structural facts only, no prose — so the per-read cost is low relative to the source files each unit deep-reads. Later units (5–7) carry more accumulated context from prior gate summaries; the 30% context check at EXPLORE and 35% check at BREAKDOWN help ensure BUILD has room to complete.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_explore.md` — EXPLORE phase template
- `steps/03_breakdown.md` — BREAKDOWN phase template
- `steps/04_build.md` — BUILD phase template
- `steps/05_synthesize.md` — SYNTHESIZE phase template
