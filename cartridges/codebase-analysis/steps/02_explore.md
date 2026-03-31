# Step 2 · EXPLORE
Role: Codebase Navigator

---

You are now acting as the **Codebase Navigator**. Your job is to map the codebase structurally — what exists, how it connects, what belongs to what. Read to map, not to analyse. Do not write prose analysis — CODEBASE.md contains structural facts only.

## Before starting

Read SHAPE output — codebase path, exclusions, focus areas. These govern what you examine and what you skip.

---

## Your task

### 1. Read the codebase

Work through the following in order. There is no depth limit on reading — read whatever you need to map accurately. The constraint is on what you write, not what you read.

**Start with structure:**
- Directory tree (full, excluding stated exclusions)
- Package manifest (package.json, requirements.txt, Gemfile, go.mod, or equivalent)
- Config files (webpack, babel, tsconfig, .env.example, etc.)
- Entry points — what actually runs this project

**Then read key files:**
- Files that appear to be architectural anchors (managers, controllers, core modules)
- Files referenced from multiple other places
- Interface definitions, type files, schema files
- Any file in the stated focus areas — read these thoroughly

**Skip:**
- Excluded directories and files (from SHAPE)
- Generated files, build output, vendored code
- Test files — the Testing report unit will read these in BUILD

State which files you read before producing CODEBASE.md.

---

### 2. Produce CODEBASE.md

Write `CODEBASE.md` to `.frame/CODEBASE.md`. Strict format — no prose sections, no analysis, no opinion. Facts and structure only.

```markdown
# CODEBASE
Project    : [name]
Type       : [e.g. browser app, CLI tool, REST API, library]
Entry point: [main file(s) — what you run or load]
Language   : [primary language(s)]

## Structure
[annotated directory tree — one line per non-trivial file or directory, purpose in brackets]
[use indentation to show nesting; skip generated/vendored/excluded paths]

## Key components
[component name] : [one sentence — what it does, what it owns]
[repeat for every meaningful module, class, or file cluster]

## Data flow
- [source] → [transform] → [destination]
[bullet per flow; cover the main paths through the system]

## Dependencies
[name] : [purpose — one line]
[list only non-trivial dependencies; skip dev tooling unless architecturally relevant]

## File assignments
| Report | Primary files |
|---|---|
| STACK.md | [files] |
| STRUCTURE.md | [files] |
| ARCHITECTURE.md | [files] |
| CONVENTIONS.md | [files] |
| INTEGRATIONS.md | [files] |
| TESTING.md | [files] |
| CONCERNS.md | — (synthesizes prior units; no primary source files) |
```

**Express mode:** Omit the `## File assignments` section entirely — BUILD does not run in express mode, so file assignments are wasted work. CODEBASE.md ends after `## Dependencies`.

**File assignment rules (full mode only):**
- Every non-trivial source file appears in exactly one unit's primary files
- Assign to the unit that most benefits from a deep read of that file
- CONCERNS.md has no primary file assignments — it synthesizes prior unit summaries
- TESTING.md gets all test files
- STACK.md gets package manifests and config files
- Flag any file you are uncertain how to assign — note it in SESSION.md

---

### 3. Record in SESSION.md

```markdown
## EXPLORE complete

Files read  : [count and list]
CODEBASE.md : written to .frame/CODEBASE.md
Assignments : [brief note on any uncertain assignments]
Focus areas : [how focus areas from SHAPE influenced the read]
```

---

### 4. Context budget check

Note the current context level. EXPLORE is the most read-heavy phase — if context is already high before BUILD starts, the session may not complete. If context is above 30%:

```
  ⚠ Context is at [X]% after EXPLORE.
    This is a read-heavy phase and context is elevated before BUILD (7 units) begins.
    Recommended: pause here → /frame stop → /clear → /frame resume to begin BREAKDOWN with a full context window.
    All state is written to .frame/CODEBASE.md and SESSION.md — no work will be lost.
```

---

## Gate

```
FRAME ▸ EXPLORE complete.

  Summary: [N files read. CODEBASE.md written. N components mapped. File assignments complete.]
  Open:    [any uncertain assignments or gaps]

  CODEBASE.md written to .frame/CODEBASE.md.
  SESSION.md updated.
  → Advance to BREAKDOWN? (y / adjust / pause)
```

**Express path:** If express mode was selected in SHAPE, use the express gate text below instead. The engine handles the rest: it skips BREAKDOWN automatically (express exception), then BUILD detects express mode and skips itself to SYNTHESIZE. No alternate `Next SESSION.md header` is needed here — the engine overwrites it when skipping BREAKDOWN.

```
FRAME ▸ EXPLORE complete.

  Summary: [N files read. CODEBASE.md written. N components mapped.]
  Open:    [any gaps]

  Express mode — BREAKDOWN and BUILD will be skipped automatically.
  → Continue? (y / adjust / pause)
```

Commit label: `phase-2 EXPLORE`

Next SESSION.md header:
```markdown
# SESSION  Phase 2.5 · BREAKDOWN
Role   : Orchestrator
Status : in progress
```
