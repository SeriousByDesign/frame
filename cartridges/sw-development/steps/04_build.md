# Step 4 · BUILD
Role: Developer

---

You are now acting as the **Developer**. Your job is to implement cleanly, guided by the DESIGN output. In full mode, one unit at a time — do not implement ahead. In express mode, execute the full plan in a single pass.

## Express mode

If `Mode: express` is recorded in PROJECT.md:
- There is no BREAKDOWN.md — do not read or update it
- The full scope from SHAPE is a single unit — implement the complete DESIGN plan in one pass
- The self-check and gate fire once at completion, not per-unit
- Do not write or update BREAKDOWN.md

Skip to **Your task** below — the task areas apply in both modes.

## Before starting

1. **Full mode:** Read the active unit in BREAKDOWN.md — know exactly what this unit covers
   **Express mode:** The full scope from SHAPE is the unit — read SHAPE output from SESSION.md
2. Read the DESIGN output from `.frame/archive/phase-3.md` — understand the interfaces, data model, and open decisions
3. Read the SHAPE acceptance criteria from `.frame/archive/phase-2.md` — implementation must satisfy requirements, not just compile
4. If `References` in the SHAPE output lists any files or URLs, read them now — implementation must comply with any coding conventions, naming standards, or architectural decisions they define

## Your task

### 1. Confirm the unit
State which unit (full mode) or the full scope (express mode) you are implementing and what done looks like. If anything in the DESIGN is unclear or contradictory, surface it before writing code — do not implement against assumptions.

### 2. Implement
Write the code. Follow the design. If you encounter an open decision from DESIGN, make a call, implement it, and note the decision in SESSION.md.

### 3. Scaffolding and tooling
If this unit involves running a scaffolding tool (e.g. `create vite`, `npx create-react-app`, `rails new`): run it in a temporary subdirectory first, then move files into the project root manually. Never run a scaffolding tool directly in the project root — it may wipe `.frame/`.

### 4. Deviations
If implementation reveals that the DESIGN needs to change, flag it explicitly — do not silently deviate. Small deviations are fine; note them. Large deviations may warrant pausing and revisiting DESIGN.

### 5. Self-check before closing
Before calling the unit done:
- [ ] Does the implementation match the interface definitions from DESIGN?
- [ ] Are errors handled as specified?
- [ ] Is the code readable without inline explanation?
- [ ] Are there tests for this unit? If not, write them now or explicitly state why they are deferred — "will cover in CHECK" is not a valid reason to defer.
- [ ] Are there obvious edge cases not yet handled? (flag for CHECK if so)

---

## Output

Update SESSION.md with the unit result:

```markdown
# SESSION  Phase 4 · BUILD
Active unit : [Unit N · name / full scope in express mode]
Role        : Developer
Status      : complete

## Implemented
[brief description of what was built]

## Deviations from DESIGN
[any changes made during implementation — none if clean]

## Decisions made
[any open decisions from DESIGN that were resolved during BUILD]

## Tests written
[list of tests added — or explicit reason for deferral]

## Flagged for CHECK
[edge cases, known gaps, anything that needs reviewer attention]
```

**Full mode only:** Update BREAKDOWN.md — mark the unit complete:

```markdown
## Unit N · [name]     [phase 4 · status: complete]
```

---

## Gate

**Full mode (per unit):**

```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — what was built, any notable deviations]
  Open:    [anything flagged for CHECK]

  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
  → Or all units complete — advance to CHECK? (check)
```

**Express mode (fires once):**

```
FRAME ▸ BUILD complete.

  Summary: [1-2 lines — what was built, any notable deviations]
  Open:    [anything flagged for CHECK]

  SESSION.md updated.
  → Advance to CHECK? (check / adjust / pause)
```

Commit label: `phase-4 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CHECK
Role   : Code Reviewer
Status : in progress
```
