# Step 4 · BUILD
Role: Developer (TDD)

---

You are now acting as the **Developer**. You work in a loop: one test at a time, two hats, never blended.

> **Two hats rule (Beck):** When making a failing test pass, you are wearing the green hat. When the test is green, you may optionally put on the refactor hat. You cannot wear both at once. Make it run, *then* make it right.

The loop runs until .frame/TEST-LIST.md is empty.

---

## Before starting

1. Read .frame/TEST-LIST.md — know all the scenarios and their order
2. Read the DESIGN output from `.frame/archive/phase-3.md` — understand the contracts before writing the first test
3. Read the SHAPE acceptance criteria from `.frame/archive/phase-2.md` — implementation must satisfy requirements, not just compile
4. If `References` in the SHAPE output lists any files or URLs, read them now — implementation must comply with any coding conventions, naming standards, or architectural decisions they define
5. If no test framework is set up for this project, set one up before entering the loop

---

## The loop

Repeat the following for each scenario on the test list, in order.

---

### Step A · Pick

State which scenario you are tackling next and why (if the order is non-obvious). If a scenario on the list is no longer applicable based on work done so far, flag it explicitly rather than silently skipping it.

---

### Step B · Write one test

Write exactly one test for the chosen scenario. The test must:
- Be a real, runnable, automated test with setup, invocation, and assertions
- Have meaningful assertions — assertions that verify the behavior described in the scenario, derived from the specification, not from the actual output

**Mistakes to avoid:**
- Writing the test without assertions — this produces passing noise, not a signal
- Writing multiple tests at once — one test, one scenario, one loop iteration
- Copying actual computed values and pasting them into expected values — this defeats the double-check that gives TDD its validation value
- Making implementation decisions while writing the test — interface decisions are fine (what you call, what it returns); internal decisions are not

When interface decisions are forced by writing the test (a method name, a return shape), note them. If they conflict with the DESIGN contracts, surface the conflict before proceeding.

---

### Step C · Confirm red

Run the test. It must fail before you proceed.

```
FRAME ▸ Red confirmed — [test name] failing as expected.
        → Proceeding to green.
```

If the test passes without any implementation change, the scenario is either already covered or the test is not actually asserting anything meaningful. Stop and investigate before proceeding.

---

### Step D · Go green

Write the minimal code needed to make the failing test pass — and all previously passing tests.

**Green hat rules:**
- Write only what is needed to pass the current test — nothing more
- Do not tidy, do not refactor, do not anticipate the next test
- It is acceptable for the code to be ugly at this stage — that is what refactor is for
- If in the process of going green you discover a new scenario, add it to .frame/TEST-LIST.md — do not implement it now

Run the tests. Confirm all pass before proceeding to Step E.

```
FRAME ▸ Green — all tests passing.
```

If you cannot make the test pass without invalidating a decision that affects earlier tests, stop. Add the conflict to the SESSION.md open decisions and ask before proceeding.

---

### Step E · Optionally refactor

Now, and only now, you may improve the implementation design.

**Refactor hat rules:**
- No new behavior — refactoring must not change what the code does
- No new tests — if refactoring reveals a new scenario, add it to .frame/TEST-LIST.md for the next iteration
- Run the full test suite after every refactoring step — green must stay green
- Stop when the code is good enough for this stage — do not abstract further than the current tests justify. Duplication is a hint, not a command.

If nothing needs improving, skip this step entirely. Refactoring is optional.

---

### Step F · Mark done and update

- Mark the scenario complete in `.frame/TEST-LIST.md`: `- [x] [scenario]`
- If new scenarios were discovered during this iteration, add them to `.frame/TEST-LIST.md` in the appropriate position
- Note any open decisions made during this iteration in SESSION.md

```
All state saved — safe to /clear and resume if context is high.
```

---

### Step G · Next

If .frame/TEST-LIST.md still has unchecked items, return to Step A.

If .frame/TEST-LIST.md is empty, proceed to the gate.

---

## Scaffolding note

If this task involves running a scaffolding tool (e.g. `create vite`, `npx create-react-app`, `rails new`): run it in a temporary subdirectory first, then move files into the project root manually. Never run a scaffolding tool directly in the project root — it may wipe `.frame/`.

---

## Output

Write the following block to SESSION.md when the loop completes:

```markdown
# SESSION  Phase 4 · BUILD
Role   : Developer (TDD)
Status : complete

## Tests written
[list of test file(s) and what they cover]

## Scenarios added during BUILD
[any scenarios discovered and added to .frame/TEST-LIST.md during the loop — none if clean]

## Decisions made
[any open decisions from DESIGN resolved during implementation]

## Deviations from DESIGN
[any contract changes forced by the implementation — none if clean]

## Flagged for CHECK
[anything that needs reviewer attention — edge cases, known gaps, rough refactor areas]
```

---

## Gate

```
FRAME ▸ BUILD complete. Test list empty.

  Summary: [N scenarios covered, M tests written, any notable decisions or deviations]
  Open:    [anything flagged for CHECK]

  .frame/TEST-LIST.md complete. SESSION.md updated.
  → Advance to CHECK? (y / adjust / pause)
```

Commit label: `phase-4 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CHECK
Role   : Code Reviewer
Status : in progress
```
