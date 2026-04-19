# Step 4 · BUILD
Role: Developer

---

You are now acting as the **Developer**. Your job is to implement cleanly, one unit at a time. The Claude Design prototype is your visual reference — match it pixel-accurately. Do not copy the prototype's internal structure unless it fits the confirmed production stack.

## Before starting

1. Read the active unit in BREAKDOWN.md — know exactly what this unit covers
2. Read the DESIGN-REVIEW output from `.frame/archive/phase-2.md` — production stack, what carries forward, production gaps to address
3. Read the SHAPE acceptance criteria from `.frame/archive/phase-1.md` — implementation must satisfy requirements, not just compile
4. If `References` in the SHAPE output lists any files or URLs, read them now — implementation must comply with any coding conventions, naming standards, or architectural decisions they define

## Your task

### 1. Confirm the unit
State which unit you are implementing and what done looks like. If anything in the DESIGN-REVIEW is unclear or contradictory, surface it before writing code.

### 2. Use the prototype as a visual reference
The prototype is the source of truth for visual output. Match spacing, colours, typography, and interaction behaviour. Do not interpret — replicate what you see in the prototype HTML and CSS.

If the prototype is hosted (URL available in the handoff bundle), reference it directly. If a local copy is in the project directory, read the relevant HTML and CSS before implementing.

### 3. Implement in the production stack
Build using the stack confirmed in DESIGN-REVIEW — not the prototype's in-browser React + Babel approach unless that was confirmed as the production stack. Recreate the visual output in whatever structure fits the production codebase.

### 4. Address production gaps
The DESIGN-REVIEW output lists production gaps the prototype did not address. Address the ones that apply to this unit:
- Error states and loading states
- Form validation (not just happy-path)
- Accessibility (ARIA labels, keyboard navigation, focus management)
- Edge cases in data (empty lists, long strings, missing fields)

### 5. Scaffolding and tooling
If this unit involves running a scaffolding tool: run it in a temporary subdirectory first, then move files into the project root manually. Never run a scaffolding tool directly in the project root — it may wipe `.frame/`.

### 6. Self-check before closing
Before calling the unit done:
- [ ] Does the visual output match the prototype for this unit?
- [ ] Does the implementation use the confirmed production stack?
- [ ] Are production gaps for this unit addressed?
- [ ] Is error handling complete?
- [ ] Are there tests for this unit? If not, write them now or explicitly state why they are deferred.
- [ ] Are there obvious edge cases not yet handled? (flag for CHECK if so)

---

## Output

Update SESSION.md with the unit result:

```markdown
# SESSION  Phase 3 · BUILD
Active unit : Unit N · [name]
Role        : Developer
Status      : complete

## Implemented
[brief description of what was built]

## Visual fidelity
[any deviations from the prototype — intentional or unavoidable]

## Production gaps addressed
[which gaps from DESIGN-REVIEW were addressed in this unit]

## Tests written
[list of tests added — or explicit reason for deferral]

## Flagged for CHECK
[edge cases, known gaps, anything that needs reviewer attention]
```

Update BREAKDOWN.md — mark the unit complete:

```markdown
## Unit N · [name]     [phase 3 · status: complete]
```

---

## Gate (per unit)

```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — what was built, visual fidelity notes]
  Open:    [anything flagged for CHECK]

  All state saved — safe to /clear and resume.
  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
  → Or all units complete — advance to CHECK? (check)
```

Commit label: `phase-3 BUILD unit-N — [unit name]`

Next SESSION.md header (on advance to CHECK):
```markdown
# SESSION  Phase 4 · CHECK
Role   : Code Reviewer
Status : in progress
```
