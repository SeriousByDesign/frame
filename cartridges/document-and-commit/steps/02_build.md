# Step 2 · BUILD
Role: Technical Writer

## Before starting

Read `.frame/archive/phase-2.md` to restore the full change summary from SHAPE.

## Task

Produce all documentation artifacts, present them for confirmation, then commit.

### 1. Commit message

Write a conventional commit message:

```
<type>(<scope>): <short description>

<body — what changed and why, wrapped at 72 chars>

<footer — breaking change notice or ticket reference if present>
```

**Type:** `fix` / `feat` / `docs` / `refactor` / `test` / `chore`
**Scope:** the affected module, file, or area (e.g. `sw-development`, `install`, `frame`)
**Breaking change footer:** `BREAKING CHANGE: <description>` (only if flagged in SHAPE)
**Ticket footer:** `Refs: <ticket>` (only if a ticket reference was provided)

Keep the subject line under 72 characters.

### 2. CHANGELOG entry (if requested)

Use today's date (YYYY-MM-DD) as the section heading:

```markdown
## YYYY-MM-DD

### [type] — [short description]
[One sentence explaining the change and its impact]
```

If `CHANGELOG.md` already exists and has an entry for today's date, append the new entry under that heading. If it does not exist, create it with today's date as the first heading.

### 3. Doc updates (if requested)

Edit the files identified in SHAPE. Changes must be surgical — only what this change requires. Do not rewrite surrounding content.

### 4. Present for confirmation

Output all artifacts — commit message, CHANGELOG entry, doc edits — before making any changes. Ask the user to confirm:

```
FRAME ▸ Ready to commit.

  Commit message:
  [formatted message]

  CHANGELOG: [entry / skipped]
  Doc updates: [list of files / skipped]

  → Confirm and commit? (y / adjust / pause)
```

### 5. Commit

On confirmation:

- If **uncommitted**: stage all changed files (`git add -A`) and commit with the confirmed message
- If **committed**: stage any new doc/changelog changes and commit them separately as a `docs:` commit; do not amend the existing commit unless the user explicitly requests it

## Output

Write to SESSION.md:

```markdown
# SESSION  Phase 4 · BUILD
Role   : Technical Writer
Status : complete

## Commit message
[final commit message]

## Artifacts
Changelog : [entry / skipped]
Doc updates: [list of files / skipped]
Committed  : [yes / yes — docs commit only]
```

## Gate

```
FRAME ▸ BUILD complete.

  Summary: [commit hash and short message]
  Open:    [any follow-on items flagged]

  SESSION.md updated.
  → Advance to CLOSE? (y / pause)
```

Commit label: `phase-4 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 6 · CLOSE
Role   : Orchestrator
Status : in progress
```
