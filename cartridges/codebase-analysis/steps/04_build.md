# Step 4 · BUILD
Role: Report Author

---

You are now acting as the **Report Author**. Your job is to write one report per unit, reading only the assigned files and prior unit gate summaries. The reader type from SHAPE is a standing constraint — it governs voice and emphasis across all 7 units without being re-stated each time.

## Express mode check

If `Mode: express` is recorded in the SHAPE archive (`.frame/archive/phase-1.md`), BUILD does not run — express mode produces AI_CONTEXT.md directly from EXPLORE output without individual reports. Output:

```
FRAME ▸ BUILD skipped (express mode).
        → Advancing to SYNTHESIZE.
```

Write the SYNTHESIZE SESSION.md header and load `05_synthesize.md` immediately:

```markdown
# SESSION  Phase 4 · SYNTHESIZE
Role   : Context Assembler
Status : in progress
```

Do not present a gate — express skip was already confirmed at SHAPE.

---

## Before starting each unit

1. Read SHAPE archive — confirm reader type and any focus areas
2. Read `.frame/CODEBASE.md` — structural foundation for every unit
3. Read BREAKDOWN.md — confirm this unit's assigned files and prior summaries to read
4. Read stated prior unit gate summaries — lightweight carry-forward only; do not re-open source files already covered by a prior unit

---

## Standing constraint — reader type

Apply the reader type from SHAPE to every report. Adjust voice, emphasis, and assumed knowledge accordingly:

| Reader | Voice | Emphasis |
|---|---|---|
| New developer | Explanatory, context-first | Mental models before detail; assume nothing is obvious |
| Returning author | Terse, decision-focused | What was decided, what's rough, what was left for later |
| Technical stakeholder | Plain language, no code references | What it does and why it's built this way |
| AI context injection | Structured facts, no prose | Every line usable as context in a future CC session |

**Two explicit exceptions — apply regardless of reader type:**
- **CONCERNS.md for technical stakeholder:** use "areas that warrant attention" framing. Do not use words like "broken", "dangerous", or "critical". Same facts, no alarm.
- **AI_CONTEXT.md:** always machine-format — produced in SYNTHESIZE, not here.

---

## Per-unit instructions

### Unit 1 · STACK.md

Read: assigned package/config files + `.frame/CODEBASE.md`

```markdown
# Stack
Reader: [from SHAPE]

## Runtime & language
[language, version if determinable]

## Frameworks & libraries
[name] : [purpose]

## Build & tooling
[bundler, transpiler, linter, formatter — what each does]

## Dev dependencies
[testing framework, dev server, etc.]

## Inferred rationale
[why these choices — inferred from the code and config, not guessed]
```

---

### Unit 2 · STRUCTURE.md

Read: assigned component/directory files + `.frame/CODEBASE.md`

```markdown
# Structure
Reader: [from SHAPE]

## Component map
[component name] : [purpose] — [what it owns]

## File purposes
[filename] : [one line — what this file does]
[cover every non-trivial file]

## Boundaries
[what is public surface vs internal implementation detail]
[what a caller needs to know vs what is private]
```

---

### Unit 3 · ARCHITECTURE.md

Read: assigned component files + `.frame/CODEBASE.md` + unit 1–2 gate summaries

```markdown
# Architecture
Reader: [from SHAPE]

## Mental model
[2–3 things you need to understand before touching anything]
[lead with the most important]

## Component relationships
[how components connect — dependencies, data passed, control flow]
[favour plain language over diagrams]

## Key design decisions
[what looks deliberate — patterns, separations, naming choices that signal intent]
[distinguish from things that look accidental]

## Fragility map
[which components are load-bearing — if you change X, Y and Z break]
[structural awareness only — not a finding, not a severity]
```

---

### Unit 4 · CONVENTIONS.md

Read: assigned files + `.frame/CODEBASE.md` + unit 2–3 gate summaries

```markdown
# Conventions
Reader: [from SHAPE]

## Naming
[how things are named — files, functions, variables, classes]
[note any inconsistencies]

## Code patterns
[recurring patterns in the codebase — how errors are handled, how state is managed, etc.]

## File organisation
[how code is grouped — by feature, by type, by layer]

## Implicit rules
[things the codebase enforces by convention that are never written down]
[what a new developer would have to discover by reading rather than being told]
```

---

### Unit 5 · INTEGRATIONS.md

Read: assigned integration/config files + `.frame/CODEBASE.md` + unit 1 gate summary

```markdown
# Integrations
Reader: [from SHAPE]

## External dependencies
[name] : [what this project uses it for]

## APIs & services
[any external APIs called, services consumed, or data formats exchanged]

## Build pipeline
[how the project is built, bundled, and prepared for use]

## Data sources
[where data comes from — files, APIs, user input, environment]

## Coupling risks
[what breaks if an external dependency changes — version, API, format]
[structural awareness only — not a severity finding]
```

---

### Unit 6 · TESTING.md

Read: all test files + `.frame/CODEBASE.md`

```markdown
# Testing
Reader: [from SHAPE]

## What's tested
[which components and behaviours have test coverage]
[be specific — name the files and what they verify]

## What's not tested
[components or behaviours with no test coverage]

## Test patterns
[how tests are written — framework used, structure, naming, setup/teardown]

## Coverage gaps & implications
[what the gaps mean in practice — not severity-rated, just a plain map]
[what could break silently because it's not covered]
```

---

### Unit 7 · CONCERNS.md

Read: unit 1–6 gate summaries only. Do not open any source files.

```markdown
# Concerns
Reader: [from SHAPE]

## Structural concerns
[things that look accidental rather than deliberate]
[patterns that are internally inconsistent]

## Documentation gaps
[implicit decisions that were never written down]
[things a new developer would have to reverse-engineer]

## Inferred technical debt
[shortcuts visible in the code or structure]
[things that work now but will cause friction as the project grows]

## New developer traps
[specific things that would confuse someone joining the project]
[not generic — name the file, pattern, or component]
```

**Note for technical stakeholder reader:** use "areas that warrant attention" framing throughout this report. Avoid alarm language.

---

## Unit gate

After each unit completes:

```
FRAME ▸ BUILD · Unit N complete.

  Written : .frame/reports/[report filename]
  Summary : [2–3 lines — key findings or decisions documented]
  Open    : [anything deferred or uncertain]

  Safe to /clear here if context is high.
  → Continue to Unit N+1? (y / adjust / pause)
```

Auto-commit per unit:
```
FRAME: phase-3 BUILD unit-N complete — [report name]
```

---

## Output

Each report written to `.frame/reports/` as the unit completes. Do not batch — write progressively.

Update BREAKDOWN.md unit status to `done` after each unit gate closes.

Commit label: `phase-3 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · SYNTHESIZE
Role   : Context Assembler
Status : in progress
```
