# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the test cases from DESIGN as build units. The units fall directly from the test case list — this step is enumeration, not design.

## Before starting

Read the DESIGN output in SESSION.md — specifically the test case list. Each test case becomes one unit.

## Propose the breakdown

State the units immediately — no interrogation before proposing:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the test case list from DESIGN:

  Unit 1 · TC-1 [short name]       [small]
  Unit 2 · TC-2 [short name]       [small]   after: Unit 1
  Unit 3 · TC-3 [short name]       [small]   after: Unit 2
  ...

Does this look right? For each unit you can:
  → add    — if a trigger gap was missed in DESIGN
  → remove — if a test case is redundant
  → reorder — if the sequence should change (e.g. core cases before edge cases)

Or confirm to write BREAKDOWN.md.
```

Order recommendation: core trigger cases first, then edge cases, then negative triggers last. This lets the QA Engineer see the skill working correctly before testing boundaries.

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · TC-1 [short name]       [phase 3 · status: pending]
Prompt   : [from DESIGN]
Expected : [from DESIGN]
Pass     : [from DESIGN]

## Unit 2 · TC-2 [short name]       [phase 3 · status: pending · after: Unit 1]
Prompt   : [from DESIGN]
Expected : [from DESIGN]
Pass     : [from DESIGN]

[etc.]
```

Update SESSION.md:

```markdown
# SESSION  Phase 2.5 · BREAKDOWN
Role   : Orchestrator
Status : complete

## Units
[N] test cases enumerated as build units. Order: [brief sequence rationale].
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N test cases as units, sequence rationale]
  Open:    [anything ambiguous]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · BUILD
Role   : QA Engineer
Status : in progress
```
