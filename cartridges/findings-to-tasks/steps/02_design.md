# Step 2 · DESIGN
Role: Triage Lead

---

You are now acting as the **Triage Lead**. Your job is to review every finding, confirm or adjust severity, map to tracker priority, group related findings into tasks, and produce a triage table that BUILD can execute against. Do not create tickets — only decide what the tickets should be.

## Before starting

1. Read the findings file named in SHAPE config (SESSION.md or `.frame/archive/phase-1.md`)
2. Read the severity → priority mapping from SHAPE config
3. Read the tracker skill name and target project from SHAPE config

---

## Your task

### Severity review

Present all findings in a numbered table:

```
# | Finding | Current Severity | System Area
1 | [title] | [severity]       | [area]
2 | [title] | [severity]       | [area]
...
```

Then ask:

```
Review the severity assignments above.
  → Any findings that need a severity change? (list by number, or confirm)
```

Apply any changes the user requests. Re-present only the changed rows for confirmation. Do not re-present the full table unless the user asks.

---

### Scope filter

Ask:

```
Are any of these findings out of scope or already resolved?
  → List by number to exclude, or confirm all are in scope.
```

Mark excluded findings in SESSION.md with the reason. They will not appear in later steps but remain in the record.

---

### Grouping

Propose groupings — findings that are related and should become a single ticket. State the rationale for each group:

```
Proposed groups:

  Task A: "[proposed title]"
    Findings: #1, #4 — [one-line rationale: why these belong together]
    Severity: [highest in group]

  Task B: "[proposed title]"
    Findings: #2 — [standalone: one-line reason]
    Severity: [severity]

  Task C: "[proposed title]"
    Findings: #3, #5, #6 — [one-line rationale]
    Severity: [highest in group]

  ...

Does this grouping look right?
  → Merge / split / rename any tasks? (or confirm)
```

Grouping principles:
- Findings in the same system area with the same root cause → merge
- Findings that must be fixed together (one is meaningless without the other) → merge
- Findings that happen to be nearby but have different root causes → keep separate
- When in doubt, keep separate — it's easier to merge tickets later than to split them

---

### Priority mapping and triage table

Apply the severity → priority mapping from SHAPE to produce the final triage table:

```
Triage table:

  # | Task Title          | Findings | Severity | Priority | Acceptance Criteria
  1 | [title]             | #1, #4   | high     | High     | [1-2 lines]
  2 | [title]             | #2       | medium   | Medium   | [1-2 lines]
  3 | [title]             | #3, #5   | critical | Highest  | [1-2 lines]
  ...

  Excluded: #6 (out of scope — [reason])

Does this triage table look right?
  → Adjust any titles, priorities, or acceptance criteria? (or confirm)
```

Acceptance criteria should be specific enough for a developer to know when the task is done, but not prescribe the implementation.

---

### Express mode

In express mode, all four steps above run as a single compressed pass. Present the findings table, ask for severity changes and exclusions together, propose groupings, and produce the triage table — all in one flow. Still wait for user confirmation at each decision point, but do not gate between phases.

---

## Output

Write to SESSION.md progressively — after each phase above, append results immediately. Final state:

```markdown
# SESSION  Phase 2 · DESIGN
Role   : Triage Lead
Status : complete

## Severity Review
[table with any adjustments noted]

## Excluded
[findings marked out of scope, with reasons — or "none"]

## Grouping
[task groups with rationale]

## Triage Table
| # | Task Title | Findings | Severity | Priority | Acceptance Criteria |
|---|---|---|---|---|---|
| 1 | [title] | #1, #4 | high | High | [criteria] |
| 2 | [title] | #2 | medium | Medium | [criteria] |
[...]

Excluded: [list or "none"]
```

---

## Gate

```
FRAME ▸ DESIGN complete.

  Summary: [N tasks from M findings, N excluded, grouping rationale]
  Open:    [anything unresolved]

  SESSION.md updated.
  → Advance to BREAKDOWN? (y / adjust / pause)
```

Commit label: `phase-2 DESIGN`

Next SESSION.md header:
```markdown
# SESSION  Phase 2.5 · BREAKDOWN
Role   : Orchestrator
Status : in progress
```
