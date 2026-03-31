# Skill Creation
Version: 1.0
Domain: Claude Code skill authoring — creating new skills and iteratively improving existing ones
Express: supported

Use this cartridge to create a new Claude Code skill from scratch, or to improve an existing one. It guides you from intent capture through SKILL.md drafting, test case execution, eval loops, description optimization, and packaging into an installable .skill file.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Requirements Engineer | Establish skill intent, triggers, output format, environment, eval suitability |
| 2 | **DESIGN** | Skill Author | Draft SKILL.md and define test case list |
| 2.5 | **BREAKDOWN** | Orchestrator | Enumerate test cases as build units |
| 3 | **BUILD** | QA Engineer | Run skill against test cases, review output, iterate on SKILL.md |
| 4 | **CHECK** | Skill Author | Description optimization, packaging |

---

## Path variants

**New skill:** All phases in sequence.

**Improve existing skill:** SHAPE determines what needs changing. If test cases exist, DESIGN may reuse them; BREAKDOWN scopes only the new or revised cases.

The path is determined at the SHAPE gate.

---

## Environment modes

Environment is detected in SHAPE and gates the eval pipeline for the entire session:

- **Claude Code** — full pipeline: quantitative eval via run_loop.py, description optimization, packaging via package_skill.py
- **Claude.ai** — qualitative eval only: manual skill invocation, no automated scoring
- **Cowork** — qualitative eval only: same as Claude.ai

Skills with subjective outputs skip quantitative evals even in Claude Code (full mode).

---

## Unit sizing hint

Each test case is one unit. A test case defines one user prompt, an expected behaviour or output pattern, and a pass/fail criterion. For an improve session, only the new or revised test cases are units.

---

## Express mode

BREAKDOWN skipped. BUILD is a single informal pass — run the skill against 1–2 ad-hoc prompts, iterate directly on SKILL.md. CHECK is qualitative only regardless of environment.

---

## Draft output

BUILD writes the skill to `.draft/[skill-name]/SKILL.md` at the project root. CHECK packages it to a .skill file in the same location.

---

## Constraints

- SKILL.md should stay under 500 lines. If approaching this limit, surface the hierarchy guidance from the skill-creator skill reference (parent + child skill pattern).
- Environment detection must happen in SHAPE — it cannot be changed mid-session.
