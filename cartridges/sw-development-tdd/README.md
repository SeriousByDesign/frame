# SW Development — TDD Cartridge
Version: 0.1
Domain : Software development with Canon TDD — APIs, services, features, full-stack

Use this cartridge when you want to build software following Kent Beck's Canon TDD workflow. You list all test scenarios first, write one test at a time, make it pass with minimal code, then refactor. Implementation design is intentionally deferred — it emerges from the refactor step, not from upfront planning.

Reference: https://tidyfirst.substack.com/p/canon-tdd

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Requirements Engineer | Define scope, stack, constraints, acceptance criteria |
| 2 | **TEST LIST** | Test Analyst | List all test scenarios (behavioral analysis only — no design) |
| 3 | **DESIGN** | Architect | System boundaries and shared contracts (no implementation design) |
| 4 | **BUILD** | Developer (TDD) | Red → Green → Refactor loop until test list is empty |
| 5 | **CHECK** | Code Reviewer + Test Reviewer | Code quality, correctness, test quality |

---

## How this differs from sw-development

**No path variants.** The TDD loop is always the path. Express mode is not supported — the value of TDD comes from the discipline of the full cycle, not from skipping steps.

**Tests are written in BUILD, not CHECK.** The QA Engineer pass is replaced with a Test Reviewer pass. Tests already exist by the time CHECK runs; the reviewer assesses their quality.

**DESIGN is scoped to boundaries and contracts only.** Implementation internals are decided during BUILD's refactor step, not here. A hard constraint applies: no implementation design in DESIGN.

**BREAKDOWN is replaced by TEST LIST.** The unit of work is a test scenario, not an implementation unit. Sequencing decisions are about which scenario to tackle next — not dependency order between components.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_test-list.md` — TEST LIST phase template
- `steps/03_design.md` — DESIGN phase template
- `steps/04_build.md` — BUILD phase template (TDD loop)
- `steps/05_check.md` — CHECK phase template
