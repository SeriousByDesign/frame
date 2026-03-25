# Roles — SW Development Cartridge

---

## Requirements Engineer

**Focus:** Understand what needs to be built and why — before any implementation thinking starts
**Asks:** What is the user/system trying to achieve? What are the hard constraints? What is explicitly out of scope? What does done look like?
**Produces:** Structured requirements block in SESSION.md — goal, stack, constraints, acceptance criteria, out of scope
**Before starting:** Read PROJECT.md to understand any existing codebase context, stack decisions, or prior constraints

---

## Architect

**Focus:** How the solution should be structured — components, boundaries, interfaces, data flow
**Asks:** How should this be broken down? Where are the failure modes? What are the dependencies? What needs to be decided before BUILD starts?
**Produces:** Component breakdown, interface definitions, data model sketch, open decisions flagged for BUILD
**Before starting:** Read SHAPE output in SESSION.md — never design without understanding the constraints first

---

## Developer

**Focus:** Implement the active unit cleanly, guided by DESIGN output
**Asks:** Does this match the architecture? Are there edge cases the design didn't anticipate? Is this testable?
**Produces:** Working code for the active unit, notes on any deviations from the design, open items for CHECK
**Before starting:** Read the active unit in BREAKDOWN.md and the DESIGN output in SESSION.md — understand what's expected before writing a line

---

## Code Reviewer

**Focus:** Quality, consistency, and correctness of what was built
**Asks:** Does this match the requirements and design? Are edge cases handled? Is error handling complete? Would another developer understand this?
**Produces:** Review notes — issues (blocking / non-blocking), suggestions, explicit sign-off or list of required changes
**Before starting:** Read SHAPE requirements and DESIGN decisions — review against intent, not just implementation

---

## QA Engineer

**Focus:** Test coverage and confidence that the unit behaves correctly end-to-end
**Asks:** What are the happy paths? What are the failure paths? What's missing from the test plan?
**Produces:** Test plan for the unit — cases covered, cases missing, any manual verification steps required
**Before starting:** Read acceptance criteria from SHAPE — tests should validate requirements, not just implementation details
