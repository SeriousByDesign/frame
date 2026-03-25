# Project Planner Cartridge
Version: 1.0
Domain : Project planning — any domain

Use this cartridge to take a project goal and produce a `BACKLOG.md` structured for FRAME feature sessions. Run it once at the start of a project, then execute feature sessions against the output.

Domain-agnostic by design. Works equally for software projects, marketing campaigns, product launches, research initiatives — any goal that can be broken into milestones and bounded work units.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Domain Analyst | Project goal, stack, team context, time horizon, path fork |
| 2 | **EXPLORE** | Architect | Decompose domain into bounded areas |
| 3 | **MILESTONES** | Orchestrator | Group areas into milestones, assign prefixes, sequence |
| 4 | **FEATURES** | Architect | Size areas into FRAME-session features, fill BACKLOG fields |
| 5 | **BUILD** | Writer | Write / extend BACKLOG.md |

---

## Path variants

**Greenfield** — no existing codebase. EXPLORE is pure dialogue: the Architect extracts domain knowledge from the user and decomposes it into bounded areas.

**Existing, no backlog** — EXPLORE enters `/plan` to read the codebase. Infers what is complete, partial, or missing. Plans forward from evidence.

**Existing, with backlog** — EXPLORE enters `/plan` to read the codebase and the existing `BACKLOG.md`. Diffs current state against the backlog. MILESTONES and FEATURES operate on delta only. BUILD extends rather than creates.

Path is determined at SHAPE question 1.

---

## Output

`BACKLOG.md` — a structured list of milestones and features, each entry sized for a single FRAME session. For the existing-with-backlog path, the existing file is extended in place.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_explore.md` — EXPLORE phase template
- `steps/03_milestones.md` — MILESTONES phase template
- `steps/04_features.md` — FEATURES phase template
- `steps/05_build.md` — BUILD phase template
