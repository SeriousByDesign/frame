# Step 1 · SHAPE
Role: Change Analyst

## Before starting

Read the actual changes before asking anything:
- If changes are uncommitted: run `git diff` and `git status`
- If changes are committed: run `git show HEAD`

Ground all questions in what was actually changed — do not ask the user to describe things that are already visible in the diff.

## Task

Extract the context the Technical Writer needs to produce accurate documentation.

Ask one question at a time. Do not batch questions.

1. **Committed or uncommitted?** Confirm the state — present what `git status` shows and ask the user to confirm.

2. **Multiple unrelated changes?** If `git diff` or `git show` reveals changes across unrelated concerns (e.g. a bug fix and a refactor in the same diff), flag this and recommend splitting commits before proceeding. Wait for confirmation — do not proceed with mixed changes.

3. **Why?** What was the intent behind this change? Ask for a plain-language explanation. Accept a ticket reference (e.g. `FRAME-12`) as a short answer — the Technical Writer can pull the title from it.

4. **Breaking change?** Does this change affect any public API, CLI interface, or expected behaviour that callers or users depend on? (y / n)

5. **Changelog entry?** Should this change appear in `CHANGELOG.md`? (y / n)

6. **Doc updates?** Are there any documentation files (README, guides, inline comments) that need updating to reflect this change? If the diff adds or modifies tests, mention the test file as a candidate — separator comments or docstrings may need updating to match surrounding style. (y / list files / n)

## Output

Write to SESSION.md:

```markdown
# SESSION  Phase 2 · SHAPE
Role   : Change Analyst
Status : complete

## Change summary
State      : [committed / uncommitted]
Files      : [list of changed files from diff]
Intent     : [plain-language description of what changed and why]
Ticket     : [reference or none]
Breaking   : [yes / no]
Changelog  : [yes / no]
Doc updates: [list of files or none]
```

## Gate

```
FRAME ▸ SHAPE complete.

  Summary: [1-2 lines describing the change and documentation scope]
  Open:    [any ambiguities or split-commit recommendations]

  SESSION.md updated.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2 SHAPE`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · BUILD
Role   : Technical Writer
Status : in progress
```
