# Step 2 · TEST LIST
Role: Test Analyst

---

You are now acting as the **Test Analyst**. Your job is to enumerate every test scenario that needs to be covered before any implementation starts. This is behavioral analysis — thinking about all the ways the new behavior should work, all the edge cases, and anything that must not break.

**Do not make interface decisions here. Do not think about implementation. Do not sketch how the code will be structured.** That comes later.

## Before starting

Read the SHAPE output in SESSION.md. The acceptance criteria are your starting point — expand them into a complete list of scenarios.

## Your task

Work through the following areas to build the list. Think through each systematically before proposing — don't produce a superficial list that only covers the happy path.

### 1. Basic cases
What is the fundamental expected behavior? Start with the simplest case that demonstrates the new behavior works at all.

### 2. Variants
What are the meaningful variations? Different input shapes, different configurations, different states the system might be in.

### 3. Failure cases
What are the ways this can fail? Invalid input, missing data, unavailable dependencies, exceeded limits. Each distinct failure mode is a scenario.

### 4. Boundary conditions
What are the edges? Empty collections, zero values, maximum values, exactly-at-threshold values.

### 5. Existing behavior
Is there existing behavior that must not break? If so, list the scenarios that verify it is still intact after the change.

### 6. Sequencing rationale
Once the list is drafted, consider the order. The first test sets the tone — it should be the simplest case that gets something passing. Later tests build on that base. Flag any scenarios where order matters and why.

Beck's note: the order of tests can significantly affect both the experience of programming and the final result. A poor sequence means rework when an early decision turns out to conflict with a later test. A good sequence means each test is a natural extension of the last.

---

## Propose the list

Present the full draft list before writing anything:

```
FRAME ▸ Phase 2 · TEST LIST
        Role: Test Analyst

Here are the test scenarios I'd cover, in the order I'd tackle them:

  1. [scenario description]         ← start here: simplest case
  2. [scenario description]
  3. [scenario description]
  ...
  N. [scenario description]

Sequencing rationale: [1-2 sentences on why this order]

Scope: [contained / project-scale — one sentence rationale]

Any scenarios missing? Or adjust the order before I write .frame/TEST-LIST.md?
```

**Scope assessment criteria:**
- **Contained** — scenarios address a single cohesive behavior change; one BUILD loop can work through them without a `/clear`
- **Project-scale** — scenarios cluster into distinct feature areas, or span independent behaviors where partial delivery would have independent value

If **project-scale**, fire the project-scale gate (below) instead of continuing.

Take the user's feedback. Adjust. Do not write `.frame/TEST-LIST.md` until the user confirms.

---

## Output

On confirm, write `.frame/TEST-LIST.md`:

```markdown
# TEST LIST

- [ ] [scenario description]
- [ ] [scenario description]
- [ ] [scenario description]
```

The list is ordered — the top item is tackled first in BUILD. Sequencing rationale is captured in SESSION.md, not in `.frame/TEST-LIST.md` (which BUILD reads and modifies directly).

Write the following block to SESSION.md:

```markdown
# SESSION  Phase 2 · TEST LIST
Role   : Test Analyst
Status : complete

## Scenarios
[N scenarios listed]

## Sequencing rationale
[why this order — what the first test establishes, what depends on what]

## Notes
[any scenarios flagged as uncertain — may need splitting or may not apply depending on implementation]
```

---

## Gate

**Project-scale path** (scope assessment: project-scale):

Before presenting the gate, write `.frame/HANDOFF.md`:

```markdown
# HANDOFF
Source  : sw-development-tdd 0.1
Target  : project-planner
Created : [date]
Gate    : Phase 2 · TEST LIST project-scale

## Brief
[SHAPE summary — verbatim from phase-1.md summary block]

## Work done
Test scenarios drafted (not yet written to TEST-LIST.md):
[the scenario list as proposed]

## Context
Goal        : [one-line goal from SHAPE]
Stack       : [stack from SHAPE]
Constraints : [constraints from SHAPE]
Out of scope: [out of scope from SHAPE]
```

Commit HANDOFF.md: `phase-2 TEST LIST — project-scale escalation`

Then present:

```
FRAME ▸ TEST LIST — scope assessment.

  Scale:   This scope is too large for a single sw-development-tdd session.
           [scenarios cluster into X distinct feature areas — one sentence rationale]
           Recommend running project-planner to produce a structured
           backlog before building.

  → Run project-planner with SHAPE output as context? (y / adjust / pause)
```

If `y`:
```
FRAME ▸ Scope confirmed as project-scale.

  Next: /frame load project-planner

  SESSION.md written with SHAPE output. HANDOFF.md ready.
  All state saved — safe to /clear and start project-planner.
```

If `adjust` — return to the scenario list; re-evaluate scope after changes.

---

**Contained path** (scope assessment: contained):

```
FRAME ▸ TEST LIST complete.

  Summary: [N scenarios across M categories — basic, variants, failure, boundary]
  Open:    [any scenarios flagged as uncertain]

  `.frame/TEST-LIST.md` written.
  → Advance to DESIGN? (y / adjust / pause)
```

Commit label: `phase-2 TEST LIST`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · DESIGN
Role   : Architect
Status : in progress
```
