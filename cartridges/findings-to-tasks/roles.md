# Roles — Findings to Tasks

---

## Intake Analyst

**Focus:** Validate the findings file, identify the tracker skill, establish session config
**Asks:** Which findings file? Which tracker skill is configured? What project/board/epic should tickets land in? Is this express-eligible (≤10 findings, single system area)?
**Produces:** Session config in SESSION.md — findings file path, tracker skill name, target project, severity scale confirmation, express eligibility
**Before starting:** Confirm the findings file exists and is parseable. Read CLAUDE.md to verify the tracker skill is configured.

---

## Triage Lead

**Focus:** Review each finding's severity, map severity to tracker priority, group related findings into tasks
**Asks:** Is the severity correct for each finding? Which findings are related and should merge into a single ticket? What's the right priority for each resulting task? Are any findings out of scope or already resolved?
**Produces:** Triage table in SESSION.md — each task with: merged findings, final severity, mapped priority, proposed ticket title, acceptance criteria
**Before starting:** Read the findings file named in SHAPE output. Read SHAPE config for tracker skill and target project.
**Express mode:** Single compressed pass — triage and grouping happen together, no separate grouping dialogue.

---

## Orchestrator

**Focus:** Enumerate tasks from the DESIGN triage table as build units
**Asks:** Standard engine questions — unit sequence, sizing, dependencies
**Produces:** BREAKDOWN.md with one unit per task
**Before starting:** Read the DESIGN triage table in SESSION.md.
**Express mode:** Skipped entirely (engine mechanic).

---

## Ticket Author

**Focus:** Create one tracker ticket per unit via the configured skill — correct fields, no manual mapping
**Asks:** Does the ticket title match the task? Are all merged findings referenced? Is priority set correctly? Are acceptance criteria complete?
**Produces:** One tracker ticket per unit, created via skill call. Records ticket key/URL in SESSION.md and BREAKDOWN.md.
**Before starting:** Read DESIGN triage table and BREAKDOWN unit list. First ticket creation serves as the skill validation — if it fails, diagnose before continuing.
**Express mode:** Executes as a single unit — all tickets created in one pass, no per-unit gating.

---

## Coverage Auditor

**Focus:** Verify every finding is accounted for — either in a ticket or explicitly marked out of scope
**Asks:** Are all findings from the input file represented in at least one ticket? Do ticket priorities match the triage table? Are any findings dropped without explanation? Do tickets have complete fields (title, priority, description, acceptance criteria)?
**Produces:** Coverage matrix in SESSION.md — each finding mapped to its ticket key, or flagged as missing/out-of-scope. Pass/fail verdict per ticket.
**Before starting:** Read the original findings file, the DESIGN triage table, and the BUILD ticket records.
