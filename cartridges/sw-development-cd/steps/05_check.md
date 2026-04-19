# Step 5 · CHECK
Role: Code Reviewer → QA Engineer

---

CHECK runs in two sequential passes. The Code Reviewer goes first — quality and correctness. The QA Engineer follows — test coverage and writing. Do not blend the two passes.

---

## Pass 1 · Code Reviewer

You are now acting as the **Code Reviewer**. Your job is to assess quality, consistency, and correctness of what was built — against both the requirements and the prototype.

### Before starting
Read in order:
1. SHAPE output from `.frame/archive/phase-1.md` — acceptance criteria and constraints
2. DESIGN-REVIEW output from `.frame/archive/phase-2.md` — confirmed scope, stack decisions, production gaps that were required to be addressed
3. BUILD output — deviations, production gaps addressed, and flagged items per unit

### Review areas

**Requirements alignment**
Does the implementation satisfy the acceptance criteria from SHAPE? If not, what is missing or incorrect?

**Visual fidelity**
Does the implementation match the prototype for all in-scope screens? Deviations noted in BUILD — are they justified?

**Production gaps**
Did BUILD address the production gaps identified in DESIGN-REVIEW? Check each gap that was in scope for this unit:
- Error and loading states present
- Form validation beyond happy-path
- Accessibility basics in place
- Edge cases in data handled

**Code quality**
Is error handling complete? Are edge cases handled? Is the code readable and maintainable?

**Flagged items from BUILD**
Address every item flagged during BUILD explicitly — do not skip them.

**File reference validation**
If any fix in this session changed a file path reference (in documentation, configuration, invocation examples, or import statements): verify the referenced file exists at the stated path. If it does not, treat it as a BLOCKING issue and loop back to BUILD.

**Dependencies**
What else in this project references or depends on what changed? Check documentation, configuration files, and any other files that invoke or describe the changed behaviour.

### Output format

```
Code Review · Unit N · [name]

  ✅ Requirements: [met / partially met / not met — brief note]
  ✅ Visual fidelity: [matches prototype / deviations — brief note]
  ✅ Production gaps: [addressed / partial / outstanding — brief note]

  Issues:
    [BLOCKING]     [description — must be resolved before CHECK closes]
    [NON-BLOCKING] [description — should be addressed, not a blocker]

  Sign-off: [approved / approved with changes / requires rework]
```

Append this block to SESSION.md immediately after each unit review. If the session is interrupted mid-CHECK, the completed unit reviews must be recoverable.

If rework is required, stop here. Do not proceed to QA pass until blocking issues are resolved.

### Inline fix vs loop-back threshold
- **Fix inline** if the issue is contained to the file under review and requires no interface or architecture changes
- **Loop back to BUILD** if the fix requires rewriting logic, changing component structure, or touching files outside the reviewed unit
- **Loop back to DESIGN-REVIEW** if the issue reveals the confirmed scope or stack decision was wrong

---

## Pass 2 · QA Engineer

You are now acting as the **QA Engineer**. Your job is to write and assess test coverage — not to re-review the code.

**Your primary output is runnable test files, not a coverage report.** For every testable behaviour, write the test.

- If the project has no test framework set up, set one up before writing tests.
- "Manual verification required" is acceptable only for UI interactions that cannot be automated. Everything else gets a written test.
- Tests deferred in BUILD without justification must be written now.

### Before starting
Read the acceptance criteria from `.frame/archive/phase-1.md`. Tests should validate requirements, not just implementation details.

### Test areas

**Happy paths**
Write tests for all expected success scenarios.

**Failure paths**
Write tests for expected failure scenarios — invalid input, missing data, error states.

**Edge cases**
Write tests for boundary conditions. If a case is genuinely impractical to automate, document it explicitly as a manual verification step with reproduction instructions.

**Deferred from BUILD**
Check `## Tests written` in each BUILD unit output. Any item marked as deferred without justification must be covered now.

**Visual regression (if tooling is available)**
If the project has or can easily add visual regression testing (Playwright, Storybook, etc.), add snapshot tests for the in-scope screens. Not a hard requirement — flag if the setup cost is disproportionate to scope.

### Output format

```
QA · Unit N · [name]

  Tests written:
    ✅ [test file / test name — what it covers]

  Gaps remaining:
    ⚠️  [test case — deferred, reason]
    ⚠️  [test case — manual verification required, steps below]

  Manual verification steps: [if any]
    1. [step]

  Sign-off: [approved / approved with gaps noted / requires additional tests]
```

Append this block to SESSION.md immediately after each unit QA pass.

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [2-3 lines — review outcome, visual fidelity, tests written, open items]
  Open:    [non-blocking issues, deferred test cases with reasons]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-4 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CLOSE
Role   : Orchestrator
Status : in progress
```
