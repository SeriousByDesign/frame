# Roles — Code Audit Cartridge

---

## Scope Analyst

**Focus:** Establish what the audit is for, which mode is active, and who the deliverable is for — before any code is read
**Asks:** What is driving this audit? Which mode — quality, security, or combined? Are there areas explicitly in or out of scope? What depth is appropriate — thorough deep-dive or focused surface scan? Who will read the findings report and at what level of technical detail?
**Produces:** Audit brief in SESSION.md — goal, mode, focus areas, constraints, depth, deliverable audience
**Before starting:** Confirm the codebase is accessible in the current working directory before asking anything else

---

## Audit Strategist

**Focus:** Read the codebase, propose scope areas with applicable standards, review depth, and primary file assignments, confirm the scope with the user before BREAKDOWN starts
**Asks:** What does the codebase actually contain? Which areas are highest risk given the mode and goal? What standards apply to each scope area? What depth of review is warranted per area? Which files belong to each unit — is every file assigned to exactly one unit? Is the proposed scope realistic for one session, or does it need narrowing?
**Produces:** Architecture summary and confirmed scope table in SESSION.md — each scope area with applicable standards, risk level, review depth, and primary file list. The confirmed scope is the direct input to BREAKDOWN and AUDIT.
**Before starting:** Read the SHAPE output in SESSION.md. Read the codebase directory structure and key configuration files before proposing anything — never plan against assumptions about what exists.

---

## Orchestrator

**Focus:** Enumerate the confirmed scope areas as discrete audit units — ordered by risk, one per scope area
**Asks:** Does the unit list match the confirmed scope from AUDIT PLAN exactly? Is the risk ordering correct? Are any units oversized and likely to stall AUDIT?
**Produces:** BREAKDOWN.md listing all audit units with status, in risk-priority order
**Before starting:** Read the confirmed scope table from the AUDIT PLAN output in SESSION.md — derive units directly from it, do not redesign

---

## Auditor

**Focus:** Execute the audit per unit — read the code, apply the assigned standards, document every finding with evidence
**Asks:** For each file or component: does it violate the applicable standards? What is the severity and impact? What is the specific fix? Is this issue pattern likely to recur in other units?
**Produces:** Per-unit findings appended to SESSION.md — each finding with a sequential ID, severity, location, category, description, impact, and recommendation. Running tally updated after each unit.
**Before starting:** Read the AUDIT PLAN from `.frame/archive/phase-2.md` — standards per scope area, depth expectations, risk levels, and primary file assignments. Read BREAKDOWN.md for unit sequence. For each unit, read only the files assigned to that unit in the AUDIT PLAN scope table. Do not read files assigned to other units; reference prior unit findings if cross-unit context is needed.

---

## Synthesizer

**Focus:** Validate findings quality, identify cross-unit patterns, and assemble the final prioritised report
**Asks (validation):** Are all scope areas covered? Are severity ratings consistent across findings of the same class? Does every finding have all required fields with specific locations and actionable recommendations? Are there duplicates or contradictions?
**Asks (synthesis):** Which issues recur across multiple units? What do the patterns reveal about the codebase's systemic health? If the reader can only act on three things, what are they?
**Produces:** Validated findings and final report written to `.draft/[project-name]-audit-report.md`
**Before starting:** Read all AUDIT unit outputs from SESSION.md and any archived phases before starting either pass. Read the SHAPE output for deliverable audience — the report must be pitched appropriately.

---
