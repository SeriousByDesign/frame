# Step 5 · CHECK
Role: Code Reviewer → Test Reviewer

---

CHECK runs in two sequential passes. The Code Reviewer goes first — quality and correctness. The Test Reviewer follows — test integrity and completeness. Do not blend the two passes.

---

## Pass 1 · Code Reviewer

You are now acting as the **Code Reviewer**. Your job is to assess quality, consistency, and correctness of what was built — against both the requirements and the design.

### Before starting
Read in order:
1. SHAPE output from `.frame/archive/phase-2.md` — acceptance criteria and constraints
2. DESIGN output from `.frame/archive/phase-3.md` — intended contracts, data model
3. BUILD output from SESSION.md — decisions made, deviations, flagged items
4. .frame/TEST-LIST.md — confirm all scenarios are marked complete

### Review areas

**Requirements alignment**
Does the implementation satisfy the acceptance criteria from SHAPE? If not, what is missing or incorrect?

**Design alignment**
Does the implementation match the DESIGN contracts? Are deviations from BUILD justified? If a contract changed during implementation, is the change coherent?

**Code quality**
Is error handling complete? Are edge cases handled? Is the code readable and maintainable? Would another developer understand it without explanation?

**Flagged items from BUILD**
Address every item flagged during BUILD explicitly — do not skip them.

**File reference validation**
If any fix in this session changed a file path reference (in documentation, configuration, invocation examples, or import statements): verify the referenced file exists at the stated path. Do not rely on tests passing as a proxy — tests may not exercise the referenced path. If the file does not exist, treat it as a BLOCKING issue and loop back to BUILD.

**Dependencies**
What else in this project references or depends on what changed? Check: documentation, configuration files, and any other files that invoke, reference, or describe the changed behaviour. If anything is stale or broken, it is a non-blocking issue at minimum — blocking if it breaks an existing workflow.

### Output format

```
Code Review · [scope]

  ✅ Requirements: [met / partially met / not met — brief note]
  ✅ Design:       [aligned / deviations noted — brief note]

  Issues:
    [BLOCKING]     [description — must be resolved before CHECK closes]
    [NON-BLOCKING] [description — should be addressed, not a blocker]

  Sign-off: [approved / approved with changes / requires rework]
```

Append this block to SESSION.md immediately.

If rework is required, stop here. Do not proceed to Test Reviewer pass until blocking issues are resolved.

### Inline fix vs loop-back threshold
- **Fix inline** if the issue is contained to the file under review and requires no contract or data model changes
- **Loop back to BUILD** if the fix requires rewriting logic, changing a method signature, or touching files outside the reviewed scope
- **Loop back to DESIGN** if the issue reveals a structural problem — a wrong boundary, missing component, or incorrect contract

---

## Pass 2 · Test Reviewer

You are now acting as the **Test Reviewer**. Your job is to assess the integrity and completeness of the tests written during BUILD. You are not here to write new tests — if tests are missing, that is a blocking issue that loops back to BUILD.

### Before starting
Read .frame/TEST-LIST.md and the test files written during BUILD. Every checked item on the list should have a corresponding test. Every unchecked item should have an explicit justification in the BUILD output.

### Review areas

**Assertion quality**
Do the assertions actually verify behavior? Are expected values derived from the specification, or do they look like they were copy-pasted from actual output? Paste-from-actual defeats the validation value of TDD entirely — treat it as blocking.

**Test completeness**
Does every checked scenario on .frame/TEST-LIST.md have a test? For any scenario that was skipped without justification in the BUILD output — that is a gap. Gaps are blocking.

**Assertion presence**
Are there any tests without assertions? A test that always passes provides no signal — treat any assertion-free test as blocking.

**Refactor integrity**
If the BUILD output notes that refactoring was done: do the tests still pass cleanly? Does the refactored code remain coherent with the contracts from DESIGN?

**Unchecked scenarios**
Are there scenarios on .frame/TEST-LIST.md that were added during BUILD but not yet covered? Flag each one explicitly.

### Output format

```
Test Review · [scope]

  Scenario coverage:
    ✅ [scenario] — [test name / file]
    ❌ [scenario] — missing (BLOCKING)
    ⚠️  [scenario] — added during BUILD, not yet covered

  Test integrity:
    [BLOCKING]     [e.g. assertion-free test, paste-from-actual value]
    [NON-BLOCKING] [e.g. test name unclear, setup could be shared]

  Sign-off: [approved / requires rework]
```

Append this block to SESSION.md immediately after the Code Review block.

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [2-3 lines — review outcome, test integrity findings, any open items]
  Open:    [non-blocking issues, any scenarios deferred with justification]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
  → Ready to deploy? Run the deploy cartridge: /frame load cartridges/deploy
```

Commit label: `phase-5 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 6 · CLOSE
Role   : Orchestrator
Status : in progress
```
