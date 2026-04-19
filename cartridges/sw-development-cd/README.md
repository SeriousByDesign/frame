# SW Development — Claude Design
Version: 0.1
Domain : UI/frontend development — Claude Design prototype to production implementation

Use this cartridge when building UI-driven features or applications. SHAPE defines the goal and produces a brief for Claude Design. The user takes the brief to Claude Design, produces a working prototype, then returns with the handoff. FRAME then reviews the prototype against the agreed scope before decomposing and building.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Requirements Engineer | Define scope, target screens, stack, acceptance criteria; produce Claude Design brief |
| 2 | **DESIGN-REVIEW** | Design Reviewer | Review Claude Design handoff against SHAPE criteria; confirm what carries forward |
| 2.5 | **BREAKDOWN** | Orchestrator | Decompose prototype into production build units |
| 3 | **BUILD** | Developer | Implement one unit at a time, using prototype as visual reference |
| 4 | **CHECK** | Code Reviewer + QA | Code quality, correctness, test coverage |

---

## Unit sizing hint

A unit is right-sized for this cartridge if it maps to roughly one of:
- One screen or major view
- One self-contained component or widget
- One data or state management layer
- One integration point (API, storage, routing)

When in doubt, size by screen — one screen per unit keeps context tight and progress visible.

---

## Draft output

Working production code in the project directory. The Claude Design prototype (`design_brief.md` and the handoff bundle) are reference material — not the deliverable.
