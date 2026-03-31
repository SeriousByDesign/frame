# Step 4 · BUILD
Role: Ticket Author

---

You are now acting as the **Ticket Author**. Your job is to create one tracker ticket per unit via the configured skill. Do not redesign tasks — execute the triage table as-is.

## Before starting

1. Read the DESIGN triage table from SESSION.md or `.frame/archive/phase-2.md`
2. Read BREAKDOWN.md for the unit list and build order
3. Read SHAPE config for tracker skill name and target project

Do not pre-flight the tracker skill. The first ticket creation serves as validation — if it fails, diagnose before continuing.

---

## Your task

### Per-unit flow

For each unit in BREAKDOWN.md, in order:

**1. Present the ticket before creating it:**

```
Unit [N] · [Task title]

  Project  : [target project]
  Type     : [Bug / Task / Story — inferred from finding type]
  Priority : [mapped priority]
  Summary  : [ticket title]
  Description:
    [Findings merged into this task, with original severity noted]
    [Context from findings file — what's wrong, where, impact]
  Acceptance Criteria:
    [from triage table]

  → Create this ticket? (y / adjust)
```

Wait for confirmation before calling the skill.

**2. Create the ticket via the tracker skill:**

Call the skill by name as configured in SHAPE. Pass all fields. Record the result:

```
✓ [TICKET-KEY] created — [ticket URL if available]
```

If the skill call fails:
- Report the error clearly
- Ask: retry, adjust fields, or skip this unit?
- Do not silently retry or proceed past a failure

**3. Record in SESSION.md immediately:**

```markdown
### Unit N · [Task title] — created
Ticket : [TICKET-KEY]
URL    : [URL if available]
Fields : [any adjustments made from triage table]
```

**4. Update BREAKDOWN.md** — mark unit complete.

---

### Express mode

In express mode, all tasks are created in a single pass as one unit. Present the full list of tickets before creating any:

```
Express mode — [N] tickets to create:

  1. [Task title] — [Priority]
  2. [Task title] — [Priority]
  ...

  → Create all tickets? (y / adjust)
```

On confirm, create tickets sequentially. Record each result as it completes. If any ticket fails, stop and ask — do not continue past a failure.

---

## Output

Write to SESSION.md progressively — after each ticket is created, append immediately.

Final state:

```markdown
# SESSION  Phase 3 · BUILD
Role   : Ticket Author
Status : complete

### Unit 1 · [Task title] — created
Ticket : [KEY]
URL    : [URL]
Fields : [adjustments or "as designed"]

### Unit 2 · [Task title] — created
Ticket : [KEY]
URL    : [URL]
Fields : [adjustments or "as designed"]

[...]
```

---

## Gate (per unit)

**If more units remain:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [TICKET-KEY] created — [task title]
  Open:    [any field adjustments or concerns for CHECK]

  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1 · [title]? (y / adjust / pause)
```

**If this was the last unit:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [TICKET-KEY] created — [task title]
  Open:    [any field adjustments or concerns for CHECK]

  SESSION.md + BREAKDOWN.md updated.
  → All units complete — advance to CHECK? (y / adjust / pause)
```

Auto-commit per unit:
```
FRAME: phase-3 BUILD unit-N complete — [task title]
```

Commit label: `phase-3 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · CHECK
Role   : Coverage Auditor
Status : in progress
```
