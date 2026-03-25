# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the output files as build units. The units fall directly from the phase sequence — this step is enumeration, not design.

## Before starting

Read the SHAPE output and (if present) PHASES output in SESSION.md. For a new cartridge, every file in the structure is a unit. For a modify session, only the files named in the Change Spec are units.

## Unit rule for this cartridge

Each output file is one unit:
- `README.md` — always a separate unit
- `roles.md` — always a separate unit
- Each step file — one unit each, named for its phase

Step files should never be merged into one unit — they are separate files in the final structure.

## Propose the breakdown

State the units immediately — no interrogation before proposing:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the phase sequence, here are the output files:

  Unit 1 · README.md                   [small]
  Unit 2 · roles.md                    [small]    after: Unit 1
  Unit 3 · steps/01_shape.md           [medium]   after: Unit 2
  Unit 4 · steps/02_[phase name].md    [medium]   after: Unit 3
  Unit 5 · steps/03_breakdown.md       [small]    after: Unit 4
  ...

Does this look right? For each unit you can:
  → split   — if a file feels too large to write in one pass
  → merge   — rarely appropriate; step files should stay separate
  → reorder — if the sequence is wrong
  → rename  — if the filename doesn't match the phase sequence

Or confirm to write BREAKDOWN.md.
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · README.md                   [phase 4 · status: pending]
## Unit 2 · roles.md                    [phase 4 · status: pending · after: Unit 1]
## Unit 3 · steps/01_shape.md           [phase 4 · status: pending · after: Unit 2]
## Unit 4 · steps/02_[name].md          [phase 4 · status: pending · after: Unit 3]
[etc.]
```

---

## Gate

**New path (coming from PHASES):**

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N files enumerated, sequence set]
  Open:    [anything ambiguous]

  BREAKDOWN.md written.
  → Advance to ROLES? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · ROLES
Role   : Cartridge Architect
Status : in progress
```

---

**Modify path — contained (coming directly from SHAPE):**

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N files to edit, sequence set]
  Open:    [anything ambiguous]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · BUILD
Role   : Writer
Status : in progress
```
