# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the scope areas from AUDIT PLAN as audit units. The units fall directly from the plan — this step is enumeration, not design.

## Before starting

Read the SHAPE output and AUDIT PLAN output in SESSION.md. Each scope area from the audit plan becomes one unit.

## Unit rule for this cartridge

Each scope area is one unit. Units are ordered by the risk priority established in AUDIT PLAN — highest risk first. The unit name matches the scope area name.

## Propose the breakdown

State the units immediately — no interrogation before proposing:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the audit plan, here are the scope areas as units:

  Unit 1 · [scope area 1]    [risk level]
  Unit 2 · [scope area 2]    [risk level]   after: Unit 1
  Unit 3 · [scope area 3]    [risk level]   after: Unit 2
  ...

Does this look right? For each unit you can:
  → split   — if a scope area is too large for a single review pass
  → merge   — if two areas are tightly coupled and better reviewed together
  → reorder — if the risk priority should change
  → rename  — if the scope area name needs clarification

Or confirm to write BREAKDOWN.md.
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · [scope area 1]    [phase 3 · status: pending]
## Unit 2 · [scope area 2]    [phase 3 · status: pending · after: Unit 1]
## Unit 3 · [scope area 3]    [phase 3 · status: pending · after: Unit 2]
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N scope areas enumerated as audit units, risk-ordered]
  Open:    [anything ambiguous]

  BREAKDOWN.md written.
  → Advance to AUDIT? (y / adjust / pause)
```

**Unit count check:** If the confirmed unit count is 7 or more, add the following before the advance prompt:

```
  ⚠ [N] units confirmed — this is a large audit scope.
    At typical reading depth, context may run short before SYNTHESIZE.
    Consider narrowing scope to the highest-risk units now,
    or plan a /frame stop → /clear → /frame resume cycle mid-AUDIT.
    All state is written to file — no work will be lost.
```

**Context budget check:** Note the current context level shown in your interface. If it is above 35%, add the following before the advance prompt:

```
  ⚠ Context is at [X]% — recommended to pause before starting AUDIT.
    Run /frame stop → /clear → /frame resume to begin AUDIT with a full context window.
    All state is written to file — no work will be lost.
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · AUDIT
Role   : Auditor
Status : in progress
```
