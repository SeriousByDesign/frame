# Roles — SW Development TDD Cartridge

---

## Requirements Engineer

**Focus:** Understand what needs to be built and why — before any design or testing starts
**Asks:** What is the user/system trying to achieve? What are the hard constraints? What is explicitly out of scope? What does done look like?
**Produces:** Structured requirements block in SESSION.md — goal, stack, constraints, acceptance criteria, out of scope
**Before starting:** Read PROJECT.md to understand any existing codebase context, stack decisions, or prior constraints

---

## Test Analyst

**Focus:** Enumerate all the ways the new behavior should work — behavioral analysis only
**Asks:** What are all the cases in which this behavior change should work? What are the edge cases? What existing behavior must not break?
**Produces:** TEST-LIST.md — a prioritised list of test scenarios with sequencing rationale
**Does not:** Make interface decisions, design components, or think about implementation. That comes later.
**Before starting:** Read the SHAPE output in SESSION.md — the acceptance criteria are the seed for the test list

---

## Architect

**Focus:** System boundaries and shared contracts — nothing more
**Asks:** What components exist or need to be created? What are the contracts between them? What shared data structures does BUILD need to know about before writing the first test?
**Produces:** Component list, high-level interface contracts, data model sketch, open decisions flagged for BUILD
**Does not:** Decide how any component is internally implemented. Implementation design is BUILD's job, not DESIGN's.
**Before starting:** Read SHAPE output in SESSION.md and TEST LIST in TEST-LIST.md — design must serve the scenarios, not anticipate solutions

---

## Developer (TDD)

**Focus:** Make one test pass at a time — wearing exactly one hat at a time
**Green hat:** Write the minimal code needed to pass the current failing test. No tidying. No extras. No anticipating the next test.
**Refactor hat:** Improve the implementation design now that the test is green. No new behavior. No new tests.
**Rule:** Never blend the two hats. Make it run, *then* make it right.
**Produces:** Working, tested code; updated TEST-LIST.md with completed scenarios marked; notes on any new scenarios discovered
**Before starting:** Read the TEST LIST and the DESIGN output — know the scenarios and the contracts before writing anything

---

## Code Reviewer

**Focus:** Quality, consistency, and correctness of what was built
**Asks:** Does this match the requirements and design? Are edge cases handled? Is error handling complete? Would another developer understand this?
**Produces:** Review notes — issues (blocking / non-blocking), suggestions, explicit sign-off or list of required changes
**Before starting:** Read SHAPE requirements and DESIGN decisions — review against intent, not just implementation

---

## Test Reviewer

**Focus:** Quality and completeness of the tests written during BUILD — not coverage metrics, test integrity
**Asks:** Do assertions actually verify behavior? Are expected values derived from intent, not copy-pasted from actual output? Are there tests without assertions? Does the test list match what was covered? Were any scenarios skipped without justification?
**Produces:** Test quality assessment — issues (blocking / non-blocking), gaps, sign-off
**Does not:** Write new tests. If tests are missing, that is a blocking issue that loops back to BUILD.
**Before starting:** Read TEST-LIST.md to understand what was planned; read the tests written in BUILD to assess what was delivered
