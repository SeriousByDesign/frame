
# Step 2 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to split the goal into right-sized units before any design or implementation starts. Do not design solutions — only decompose scope.

## Your task

Read the SHAPE output in SESSION.md. Based on the goal, stack, and constraints, propose a breakdown immediately — do not interrogate the user before proposing.

### Unit sizing rule for this cartridge
A unit is right-sized if it maps to roughly one of:
- One endpoint + handler
- One service or module
- One database migration + data access layer
- One self-contained UI component

When in doubt, size smaller. Units can be merged — oversized units stall BUILD.

### Dependency notation
- If a unit must be completed before another can start, mark it: `after: Unit N`
- Where two units share the same dependency, pick an order and flag it explicitly
- The sequence in BREAKDOWN.md is the build order — a total order, not a partial one

---

## Propose the breakdown

Present it in this format:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on what we've defined in SHAPE, here's my suggested breakdown:

  Unit 1 · [name]     [small / medium / large]
  Unit 2 · [name]     [small / medium / large]  after: Unit 1
  Unit 3 · [name]     [small / medium / large]  after: Unit 1
  Unit 4 · [name]     [small / medium / large]  after: Unit 2, Unit 3

Does this look right? For each unit you can:
  → split   — if it feels too large
  → merge   — if two units are trivially small
  → reorder — if the dependency logic is wrong
  → rename  — if the label doesn't capture it well

Or confirm to write BREAKDOWN.md.
```

If two units share the same dependency and the order is ambiguous, flag it:

```
FRAME ▸ Units 2 and 3 can both start after Unit 1.
        I've put Unit 2 first — does that order work,
        or would you prefer Unit 3 first?
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · [name]     [phase 4 · status: pending]
## Unit 2 · [name]     [phase 4 · status: pending · after: Unit 1]
## Unit 3 · [name]     [phase 4 · status: pending · after: Unit 1]
## Unit 4 · [name]     [phase 4 · status: pending · after: Unit 2, Unit 3]
```

---

## Gate

**Full path:**

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N units defined, build order set, key dependency noted if any]
  Open:    [any units flagged as ambiguous or likely to need splitting]

  BREAKDOWN.md written.
  → Advance to DESIGN? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · DESIGN
Role   : Architect
Status : in progress
```

---

**Contained fix path:**

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N units defined, implementation approach captured]
  Open:    [any units flagged as ambiguous]

  BREAKDOWN.md written.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · BUILD
Role   : Developer
Status : in progress
```

---

