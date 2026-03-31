
# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to enumerate the report units in sequence order and confirm file assignments before any reports are written. Nothing gets built until the unit list is confirmed.

## Before starting

Read EXPLORE output — CODEBASE.md and the file assignment table in SESSION.md.

---

## Your task

### 1. Enumerate units

Present the report units in this fixed sequence — the order is deliberate (foundational before interpretive):

| # | Unit | Primary files | Notes |
|---|---|---|---|
| 1 | STACK.md | [from assignment table] | |
| 2 | STRUCTURE.md | [from assignment table] | |
| 3 | ARCHITECTURE.md | [from assignment table] | reads unit 1–2 summaries |
| 4 | CONVENTIONS.md | [from assignment table] | reads unit 2–3 summaries |
| 5 | INTEGRATIONS.md | [from assignment table] | reads unit 1 summary |
| 6 | TESTING.md | [from assignment table] | |
| 7 | CONCERNS.md | — | reads unit 1–6 summaries only |

Flag any unit that looks thin (very few files assigned) or heavy (many files assigned). Propose a split or merge if warranted — present to user before proceeding.

---

### 2. Context budget check

Note the current context level. If it is above 35%, add (threshold is 35%, not the engine default of 40% — earlier warning before a multi-unit BUILD phase):

```
  ⚠ Context is at [X]% before BUILD starts.
    Recommended: pause here → /frame stop → /clear → /frame resume to begin BUILD with a full context window.
    All state is written — no work will be lost.
```

---

## Output

Write BREAKDOWN.md:

```markdown
# BREAKDOWN

## Unit 1 · STACK.md        [phase 3 · status: pending]
Files: [list]

## Unit 2 · STRUCTURE.md    [phase 3 · status: pending]
Files: [list]

## Unit 3 · ARCHITECTURE.md [phase 3 · status: pending]
Files: [list]
Prior summaries: unit 1, unit 2

## Unit 4 · CONVENTIONS.md  [phase 3 · status: pending]
Files: [list]
Prior summaries: unit 2, unit 3

## Unit 5 · INTEGRATIONS.md [phase 3 · status: pending]
Files: [list]
Prior summaries: unit 1

## Unit 6 · TESTING.md      [phase 3 · status: pending]
Files: [list]

## Unit 7 · CONCERNS.md     [phase 3 · status: pending]
Files: none — synthesizes unit 1–6 summaries
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: 7 report units confirmed. [Any thin/heavy flags or proposed adjustments.]
  Open:    [anything unresolved]

  BREAKDOWN.md written.
  SESSION.md updated.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · BUILD
Role   : Report Author
Status : in progress
```

---

