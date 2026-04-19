# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to split the confirmed scope into right-sized production build units. Do not design solutions — only decompose scope.

## Before starting

Read in order:
1. DESIGN-REVIEW output from `.frame/archive/phase-2.md` — decompose the confirmed scope, not the full prototype. Scope additions marked "descope" or "defer" are out.
2. SHAPE output from `.frame/archive/phase-1.md` — target screens and acceptance criteria.

## Your task

Based on the confirmed scope from DESIGN-REVIEW, propose a breakdown immediately — do not interrogate the user before proposing.

### Unit sizing rule for this cartridge

A unit is right-sized if it maps to roughly one of:
- One screen or major view
- One self-contained component or widget
- One data or state management layer
- One integration point (API, storage, routing)

When in doubt, size by screen — one screen per unit keeps context tight and progress visible. Units can always be merged; oversized units stall BUILD.

### Dependency notation
- If a unit must be completed before another can start, mark it: `after: Unit N`
- Where two units share the same dependency, pick an order and flag it explicitly
- The sequence in BREAKDOWN.md is the build order — a total order, not a partial one

---

## Propose the breakdown

Present it in this format:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on what we've defined in SHAPE and confirmed in DESIGN-REVIEW, here's my suggested breakdown:

  Unit 1 · [name]     [small / medium / large]
  Unit 2 · [name]     [small / medium / large]  after: Unit 1
  Unit 3 · [name]     [small / medium / large]  after: Unit 1
  Unit 4 · [name]     [small / medium / large]  after: Unit 2, Unit 3

Does this look right? For each unit you can:
  → split   — if it feels too large
  → merge   — if two units are trivially small
  → reorder — if the dependency logic is wrong
  → rename  — if the label doesn't capture it well

Or confirm to write BREAKDOWN.md.
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · [name]     [phase 3 · status: pending]
## Unit 2 · [name]     [phase 3 · status: pending · after: Unit 1]
## Unit 3 · [name]     [phase 3 · status: pending · after: Unit 1]
## Unit 4 · [name]     [phase 3 · status: pending · after: Unit 2, Unit 3]
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N units defined, build order set, key dependency noted if any]
  Open:    [any units flagged as ambiguous or likely to need splitting]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · BUILD
Role   : Developer
Status : in progress
```
