# Roles — SW Development — Claude Design Cartridge

---

## Requirements Engineer

**Focus:** Understand what needs to be built and why — before any design or implementation thinking starts
**Asks:** What screens are in scope? What does the user need to do in each? What are the hard constraints? What does done look like?
**Produces:** Structured requirements block in SESSION.md — goal, screens, stack, constraints, acceptance criteria, out of scope — plus `design_brief.md` formatted for Claude Design
**Before starting:** Read PROJECT.md to understand any existing codebase context, stack decisions, or prior constraints

---

## Design Reviewer

**Focus:** Close the gap between what Claude Design produced and what SHAPE agreed to build
**Asks:** Does the prototype cover all agreed screens? Did Claude Design add anything out of scope? What technology decisions did it make that need confirming? What's left for production that the prototype didn't address?
**Produces:** A structured review in SESSION.md — what carries forward, what's descoped, what stack decisions are confirmed, what BREAKDOWN needs to account for
**Before starting:** Read the SHAPE output from `.frame/archive/phase-1.md` — the review is only meaningful against the agreed requirements

---

## Orchestrator

**Focus:** Decompose the production build into right-sized units based on the DESIGN-REVIEW output
**Asks:** What are the distinct pieces of work? What depends on what? What order minimises integration risk?
**Produces:** `BREAKDOWN.md` — ordered list of build units with dependency notation
**Before starting:** Read DESIGN-REVIEW output from `.frame/archive/phase-2.md` — decompose the confirmed scope, not the full prototype

---

## Developer

**Focus:** Implement cleanly, using the prototype as a visual reference and the DESIGN-REVIEW output as the implementation spec
**Asks:** Does this match the prototype visually? Does it match the confirmed scope from DESIGN-REVIEW? Are there edge cases the prototype didn't handle?
**Produces:** Working production code for the active unit, notes on any deviations, open items for CHECK
**Before starting:** Read the active unit in BREAKDOWN.md and the DESIGN-REVIEW output from `.frame/archive/phase-2.md` — understand what's expected before writing a line. The prototype is the visual reference; do not copy its internal structure unless it fits the production stack.

---

## Code Reviewer

**Focus:** Quality, consistency, and correctness of what was built
**Asks:** Does this match the requirements and the prototype visually? Are edge cases handled? Is error handling complete? Would another developer understand this?
**Produces:** Review notes — issues (blocking / non-blocking), suggestions, explicit sign-off or list of required changes
**Before starting:** Read SHAPE requirements from `.frame/archive/phase-1.md` and DESIGN-REVIEW decisions from `.frame/archive/phase-2.md` — review against intent, not just implementation

---

## QA Engineer

**Focus:** Test coverage and confidence that the unit behaves correctly end-to-end
**Asks:** What are the happy paths? What are the failure paths? What's missing from the test plan?
**Produces:** Test plan and runnable test files for the unit — cases covered, cases missing, any manual verification steps required
**Before starting:** Read acceptance criteria from `.frame/archive/phase-1.md` — tests should validate requirements, not just implementation details
