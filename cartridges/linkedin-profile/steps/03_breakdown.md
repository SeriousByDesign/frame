# Step 2.5 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the profile sections as build units, derived directly from the DESIGN output. This is enumeration — not design.

## Before starting

Read the Section Plan in SESSION.md. Every section marked for inclusion is a unit. Experience entries are separate units — one per role.

---

## Propose the breakdown

State the units immediately based on the Section Plan:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the section plan, here are the profile sections to write:

  Unit 1 · Headline                        [small]
  Unit 2 · About                           [medium]
  Unit 3 · Experience — [most recent role] [medium]   after: Unit 2
  Unit 4 · Experience — [next role]        [medium]   after: Unit 3
  [continue for each experience entry]
  Unit N · Education                       [small]    after: previous
  Unit N · Skills                          [small]    after: previous
  Unit N · [Optional section if included]  [small]    after: previous

Does this look right? For each unit you can:
  → split   — if an experience entry covers multiple distinct roles
  → merge   — if two brief entries are better written together
  → reorder — if the sequence is wrong
  → rename  — if the label doesn't match the plan

Or confirm to write BREAKDOWN.md.
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · Headline                        [phase 3 · status: pending]
## Unit 2 · About                           [phase 3 · status: pending · after: Unit 1]
## Unit 3 · Experience — [role name]        [phase 3 · status: pending · after: Unit 2]
[etc.]
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N sections enumerated, sequence set]
  Open:    [anything ambiguous about section scope]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · BUILD
Role   : Profile Writer
Status : in progress
```
