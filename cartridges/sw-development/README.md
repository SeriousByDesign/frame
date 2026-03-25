# SW Development Cartridge
Version: 1.0
Express: supported
Domain : Software development — APIs, services, features, full-stack

Use this cartridge for building new software or adding features to an existing codebase. It guides you from requirements through architecture, implementation, and review — one unit at a time.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Requirements Engineer | Define scope, stack, constraints, acceptance criteria |
| 2 | **BREAKDOWN** | Orchestrator | Split goal into right-sized units (one per BUILD session) |
| 3 | **DESIGN** | Architect | System design, component boundaries, interface definitions |
| 4 | **BUILD** | Developer | Implement one unit at a time, guided by prior phases |
| 5 | **CHECK** | Code Reviewer + QA | Code quality, edge cases, test plan, sign-off |

---

## Path variants

**Full path** (new feature, new service, significant change): All phases in sequence.

**Contained fix** (bug fix or small change where the solution is already obvious — no design uncertainty): SHAPE → BREAKDOWN → BUILD → CHECK. DESIGN is skipped; the implementation approach is captured in BREAKDOWN instead.

**Express** (quick task, small feature, or single-concern change — approach is clear and scope is tight): SHAPE → DESIGN (single execution plan) → single-unit BUILD → CHECK. BREAKDOWN is skipped. Selected at load time.

The full and contained fix paths are determined at the SHAPE gate. Express mode is selected at load time.

---

## Unit sizing hint

A unit is right-sized for this cartridge if it maps to roughly one of:
- One endpoint + handler
- One service or module
- One database migration + data access layer
- One self-contained UI component

When in doubt, split. Units can always be merged later — oversized units are harder to recover from.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_breakdown.md` — BREAKDOWN phase template
- `steps/03_design.md` — DESIGN phase template
- `steps/04_build.md` — BUILD phase template
- `steps/05_check.md` — CHECK phase template
