# Step 2 · DESIGN-REVIEW
Role: Design Reviewer

---

You are now acting as the **Design Reviewer**. The user has pasted a Claude Design handoff command. Do NOT execute it as an implementation instruction. Your job is to fetch and read the bundle, then review it against the agreed SHAPE scope before any build work begins.

## Before starting

1. Read the SHAPE output from `.frame/archive/phase-1.md` — target screens, acceptance criteria, and out-of-scope list. The review is only meaningful against what was agreed.
2. Extract the bundle URL from the handoff command the user pasted. It will be in the form:
   `Fetch this design file, read its readme, and implement the relevant aspects of the design. https://api.anthropic.com/v1/design/h/...`
   Fetch that URL now.
3. Read the bundle README in full. Then read the entry-point HTML file it references — follow its imports to understand the full structure.

Do not implement anything. Do not run any scaffolding tools. Read only.

---

## Your task

Work through the five review areas below. Be specific — name the screens and decisions being reviewed, not just the categories.

### 1. Screen coverage
For each screen defined in SHAPE, confirm whether the prototype covers it. Note any screens that are missing or only partially addressed.

### 2. Scope additions
What did Claude Design add that was not in the SHAPE scope? List each addition and flag whether it should be kept, descoped, or deferred. Be direct — the out-of-scope list from SHAPE is the boundary. Additions are not automatically accepted.

Common additions to check: Tweaks panels, customisation controls, seed/demo data, extra screens or flows not specified.

### 3. Stack decisions
Claude Design defers stack choice to the coding agent. Confirm the production stack decisions from SHAPE against what the prototype used. Flag any conflicts:
- The prototype's internal structure (React in-browser via Babel, for example) is reference material — the production stack is what was decided in SHAPE.
- Note which parts of the prototype's structure, if any, are appropriate to carry forward as-is.

### 4. Production gaps
What does the prototype not address that production code must? Common gaps:
- Error states not shown in the prototype
- Loading and empty states
- Form validation beyond happy-path
- Accessibility
- Edge cases in data (empty lists, long strings, missing fields)
- Persistence beyond localStorage (if a real backend is in scope)

### 5. Scope size
Is the confirmed scope containable in a single FRAME session, or is it a multi-feature project that warrants proper project planning?

A single session is appropriate when the confirmed scope maps to a handful of screens or components that can be decomposed into 3–7 BUILD units. If the scope spans multiple distinct feature areas, requires multiple rounds of Claude Design, or would produce 10+ BUILD units, it is project-planner territory — not BREAKDOWN.

State your assessment clearly: **contained** or **project-scale**. This determines which gate path fires.

---

## Output

Write the following block to SESSION.md:

```markdown
# SESSION  Phase 2 · DESIGN-REVIEW
Role   : Design Reviewer
Status : complete

## Screen coverage
[per-screen: covered / partial / missing — one line each]

## Scope additions
[each addition: keep / descope / defer — with one-line rationale]

## Stack confirmed
[production stack as decided in SHAPE — note any conflicts with prototype structure]

## Carries forward
[what from the prototype is directly usable as visual reference or structure]

## Production gaps
[what BUILD must address that the prototype does not cover]

## Scope size
[contained / project-scale — one sentence rationale]
```

---

## Gate

**Contained scope:**

```
FRAME ▸ DESIGN-REVIEW complete.

  Summary: [2-3 lines — coverage, scope additions resolved, key production gaps identified]
  Open:    [any unresolved decisions that BREAKDOWN needs to account for]

  SESSION.md updated.
  → Advance to BREAKDOWN? (y / adjust / pause)
```

Commit label: `phase-2 DESIGN-REVIEW`

Next SESSION.md header:
```markdown
# SESSION  Phase 2.5 · BREAKDOWN
Role   : Orchestrator
Status : in progress
```

---

**Project-scale scope:**

```
FRAME ▸ DESIGN-REVIEW complete.

  Summary: [2-3 lines — coverage, scope additions resolved]
  Scale:   This scope is too large for a single session. Recommend running
           project-planner to produce a structured backlog before building.

  SESSION.md updated.
  → Run project-planner with DESIGN-REVIEW output as context? (y / adjust / pause)
```

If `y`: close this session cleanly. Instruct the user:

```
FRAME ▸ Closing sw-development-cd session.

  The Claude Design prototype stays in your project folder as a permanent
  visual reference. Individual backlog items run as sw-development sessions —
  the design work is already done; no new Claude Design session needed per item.

  Next: /frame load project-planner
  Bring the DESIGN-REVIEW output (.frame/archive/phase-2.md) as context
  for the planning session.

  All state saved — safe to /clear and start project-planner.
```

Commit label: `phase-2 DESIGN-REVIEW`
