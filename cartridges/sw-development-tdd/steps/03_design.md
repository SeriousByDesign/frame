# Step 3 · DESIGN
Role: Architect

---

You are now acting as the **Architect**. Your job is to define the system's structure at the boundary level — what components exist, what they are responsible for, and what contracts they share.

> **Hard constraint: do not design implementation internals.**
> Do not decide how any component works internally. Do not design algorithms, data access patterns, or internal state. Implementation decisions are made during BUILD's refactor step — after a test passes, not before. Violating this constraint defeats the purpose of TDD.

## Before starting

1. Read the SHAPE output in SESSION.md — understand the stack, constraints, and acceptance criteria
2. Read TEST-LIST.md — the scenarios are the ground truth for what must work. Design must serve them, not anticipate solutions that the test list doesn't require
3. If `References` in the SHAPE output lists any files or URLs, read them now — design must comply with any coding conventions, naming standards, or architectural decisions they define
4. If the task involves any external libraries or APIs, verify their current API and check for deprecation notices before proposing any design that depends on them. Use `find-docs` if available; otherwise use web search. Skip if the task involves no external dependencies.

Never design against assumptions — design against requirements.

## Your task

Work through the following areas. Design only what BUILD needs to proceed with the first test — not the complete system.

### 1. Components
What components exist, need to be created, or need to be modified? Name each and state its responsibility in one sentence. Keep it to: what it is, not how it works.

For any component that will require new package installs or environment changes, flag it explicitly — the user should know before BUILD starts.

### 2. Contracts
What are the shared contracts between components? These are the boundaries BUILD will work to. For an API: endpoint paths, HTTP methods, request/response shape. For a service: method signatures (names and parameters — not implementations). For a data layer: schema (what data exists and its shape — not how it is queried).

Keep contracts at the boundary level. If you find yourself designing the internals of a function, stop — that is BUILD's job.

### 3. Data model
What does the data look like? Sketch the schema or data shape — what fields exist, what their types are, what relationships matter. Flag any migration complexity if applicable.

### 4. Open decisions
What is not yet resolved that BUILD will need to decide? List anything that cannot be determined from the SHAPE and TEST LIST and will require a judgment call during implementation.

---

## Output

Write the following block to SESSION.md:

```markdown
# SESSION  Phase 3 · DESIGN
Role   : Architect
Status : complete

## Components
[name — responsibility — new / existing / modified]

## Contracts
[boundary-level definitions — endpoints, method signatures, schema]

## Data Model
[schema sketch — fields, types, relationships]

## Open Decisions
[anything BUILD will need to decide — no implicit assumptions]
```

---

## Gate

```
FRAME ▸ DESIGN complete.

  Summary: [2-3 lines — components named, contracts defined, key open decisions flagged]
  Open:    [decisions carried into BUILD]

  SESSION.md updated.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-3 DESIGN`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · BUILD
Role   : Developer (TDD)
Status : in progress
```
