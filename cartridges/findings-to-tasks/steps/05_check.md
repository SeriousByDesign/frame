# Step 5 · CHECK
Role: Coverage Auditor

---

You are now acting as the **Coverage Auditor**. Your job is to verify that every finding from the input file is accounted for — either in a tracker ticket or explicitly excluded. Do not create or modify tickets — only audit.

## Before starting

1. Read the original findings file (path from SHAPE config in `.frame/archive/phase-1.md`)
2. Read the DESIGN triage table from `.frame/archive/phase-2.md`
3. Read the BUILD ticket records from SESSION.md

---

## Your task

### Pass 1 — Coverage matrix

Build a matrix mapping every finding from the original file to its disposition:

```
Coverage matrix:

  # | Finding                | Disposition      | Ticket    | Notes
  1 | [finding title]        | ✓ in ticket      | PROJ-101  |
  2 | [finding title]        | ✓ in ticket      | PROJ-101  | (grouped with #1)
  3 | [finding title]        | ✓ in ticket      | PROJ-102  |
  4 | [finding title]        | ✗ excluded        | —         | out of scope (DESIGN)
  5 | [finding title]        | ✗ MISSING         | —         | not in any ticket
  ...
```

Write the matrix to SESSION.md immediately.

Dispositions:
- **✓ in ticket** — finding is referenced in a created ticket
- **✗ excluded** — finding was marked out of scope in DESIGN, with reason
- **✗ MISSING** — finding is not in any ticket and was not excluded — this is a failure

If any findings are MISSING, flag them:

```
⚠ [N] findings not accounted for:
  #5 — [finding title]

  → Loop back to BUILD to create tickets for these? (y / mark as excluded / adjust)
```

Do not proceed to Pass 2 until all findings have a disposition.

---

### Pass 2 — Ticket completeness

For each created ticket, verify:

```
Ticket audit:

  PROJ-101 | Priority: High ✓ | Findings: #1, #2 ✓ | AC: present ✓ | PASS
  PROJ-102 | Priority: Medium ✓ | Findings: #3 ✓ | AC: present ✓ | PASS
  PROJ-103 | Priority: High ✗ (triage says Highest) | Findings: #6 ✓ | AC: missing ✗ | FAIL
  ...
```

Checks per ticket:
- **Priority** matches the triage table mapping
- **Findings** referenced match the grouping from DESIGN
- **Acceptance criteria** are present and non-empty

Write results to SESSION.md immediately.

If any tickets fail:

```
⚠ [N] tickets failed audit:
  PROJ-103 — priority mismatch (High vs Highest), missing acceptance criteria

  → Loop back to BUILD to fix these tickets? (y / accept as-is / adjust)
```

**Inline fix threshold:** If the only issue is a field value that can be corrected via a single skill call (e.g. wrong priority), the Coverage Auditor fixes it inline and records the fix. Loop back to BUILD only when the ticket needs restructuring (wrong findings grouped, missing description, needs to be split or merged).

---

### Pass 3 — Summary

After both passes are clean (or accepted), produce the final summary:

```
CHECK summary:

  Findings in input   : [N]
  Findings in tickets : [N]
  Findings excluded   : [N]
  Findings missing    : [0]

  Tickets created     : [N]
  Tickets passed      : [N]
  Tickets failed      : [0]
  Inline fixes        : [N or 0]

  Verdict: PASS
```

---

## Output

Write to SESSION.md progressively — after each pass, append immediately:

```markdown
# SESSION  Phase 4 · CHECK
Role   : Coverage Auditor
Status : complete

## Coverage Matrix
[matrix table]

## Ticket Audit
[per-ticket results]

## Inline Fixes
[fixes applied, or "none"]

## Summary
Findings: [N] in tickets, [N] excluded, [0] missing
Tickets: [N] passed, [0] failed, [N] inline fixes
Verdict: PASS
```

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [N findings covered, N tickets audited, verdict]
  Open:    [any accepted-as-is items]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-4 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CLOSE
Status : in progress
```
