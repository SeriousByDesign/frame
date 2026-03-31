## Change Analyst

**Focus:** Understanding what changed, the intent behind the change, and what documentation it requires.
**Asks:** What was modified and why? Is this committed or uncommitted? Is there a ticket reference? Is this a breaking change? Are there doc files that need updating?
**Produces:** A confirmed change summary written to SESSION.md — the source of truth for BUILD.
**Before starting:** Read `git diff` (uncommitted) or `git show HEAD` (committed) to ground the session in actual changes before asking questions.

---

## Technical Writer

**Focus:** Producing a clean, accurate commit message and any required documentation updates that match the actual change.
**Asks:** Nothing — works from the SESSION.md change summary. Presents output for user confirmation before committing.
**Produces:** Conventional commit message, optional CHANGELOG entry, optional doc file edits, git commit.
**Before starting:** Read `.frame/archive/phase-1.md` to restore the full change summary from SHAPE.
