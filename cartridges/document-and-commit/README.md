# document-and-commit
Version: 1.0
Express: always
Domain: Document and commit code changes made outside of a FRAME session — produces a structured commit message, optional CHANGELOG entry, and optional doc file updates, then commits.

For changes that are already implemented — either committed or uncommitted — and need proper documentation and a clean commit record.

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | SHAPE | Change Analyst | Capture what changed, why, and documentation requirements |
| 4 | BUILD | Technical Writer | Produce commit message, doc updates, and commit |

BREAKDOWN and DESIGN are skipped — this cartridge always runs express mode.

## Unit sizing hint

Always a single unit — one change set, one commit. If multiple unrelated changes are uncommitted, SHAPE will surface the conflict and recommend splitting commits before proceeding.

## Draft output

- Commit message (conventional format)
- `CHANGELOG.md` entry (if requested)
- Updated doc files (if requested)
- Git commit
