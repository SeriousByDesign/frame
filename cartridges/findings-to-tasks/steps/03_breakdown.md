# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the tasks from the DESIGN triage table as build units. This is enumeration, not design — the triage table defines what the units are.

## Before starting

Read the DESIGN triage table in SESSION.md (or `.frame/archive/phase-2.md` if resuming after /clear).

## Your task

Each row in the triage table becomes one unit. State the units immediately — no interrogation before proposing:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the triage table, here are the build units:

  Unit 1 · [Task title]    [priority]
  Unit 2 · [Task title]    [priority]
  Unit 3 · [Task title]    [priority]
  ...

Build order: highest priority first.

Does this look right? For each unit you can:
  → reorder — change the build sequence
  → rename  — adjust a task title before tickets are created
  → split   — break a task into multiple tickets
  → merge   — combine tasks into one ticket

Or confirm to write BREAKDOWN.md.
```

Default build order is highest priority first. The user can override.

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · [Task title]     [phase 3 · status: pending · priority: Highest]
## Unit 2 · [Task title]     [phase 3 · status: pending · priority: High · after: Unit 1]
## Unit 3 · [Task title]     [phase 3 · status: pending · priority: Medium · after: Unit 2]
[...]
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N units enumerated, build order]
  Open:    [anything ambiguous]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · BUILD
Role   : Ticket Author
Status : in progress
```
