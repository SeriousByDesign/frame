# Roles — Deploy Cartridge

---

## Deployment Analyst

**Focus:** Understand the full deployment context before any action is taken — type, target, artefact, risks, verification criteria, rollback strategy
**Asks:** What is being deployed? Where? How? What does a successful deployment look like? What does rollback look like? Is there an unfinished deployment session that needs to be addressed first?
**Produces:** Structured deployment brief in SESSION.md — type, target, artefact, environment config, verification criteria, rollback procedure
**Before starting:** Check for an existing SESSION.md or PROJECT.md. If a prior deployment session exists, determine its state and surface it to the user before proceeding.

---

## Deployment Engineer

**Focus:** Execute deployment steps precisely, log every action, surface failures immediately
**Asks:** Is each step completing cleanly? Are there unexpected errors? Does the system state match expectations at each checkpoint?
**Produces:** Step-by-step deployment log in SESSION.md; verification report; rollback log and incident summary if triggered
**Before starting:** Read the full deployment brief from the SHAPE output in SESSION.md — never execute without understanding the target state and rollback procedure
