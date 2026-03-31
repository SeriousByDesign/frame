# Findings to Tasks
Version: 1.0
Express: supported
Domain: Findings-to-tasks — takes a structured findings report and guides the user through triage, grouping, and task creation in an issue tracker.

Use this cartridge to convert a findings report (FINDINGS.md from a code-audit session, or BACKLOG.md from a project-planner session) into prioritised tracker tickets. The cartridge owns domain logic — what makes a ticket, how findings group, severity → priority mapping. A tracker skill configured in CLAUDE.md owns the mechanics (Jira, Linear, GitHub Issues, Asana, etc.).

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Intake Analyst | Validate findings file, identify tracker skill, establish session config |
| 2 | **DESIGN** | Triage Lead | Severity review, priority mapping, group related findings into tasks |
| 2.5 | **BREAKDOWN** | Orchestrator | Enumerate tasks from triage table as build units |
| 3 | **BUILD** | Ticket Author | Create one tracker ticket per unit via configured skill |
| 4 | **CHECK** | Coverage Auditor | Verify all findings accounted for, tickets complete |

---

## Path variants

**Full mode:** All phases in sequence. For reports with >10 findings or spanning multiple system areas.

**Express mode:** SHAPE → DESIGN → single-unit BUILD → CHECK (BREAKDOWN skipped). For small reports: ≤10 findings, single system area. DESIGN runs a compressed triage-and-group pass; BUILD creates all tickets in one unit.

The mode is determined at the SHAPE gate.

---

## Execution layer

The cartridge calls a tracker skill by name at BUILD time. The skill must be configured in CLAUDE.md before the session starts. The cartridge is tracker-agnostic — it produces the same domain output regardless of which skill executes the tickets.

Supported skills (first implementation: Jira):
- `jira-cli` — Jira via CLI
- Other tracker skills (Linear, GitHub Issues, Asana) are valid alternatives

---

## Unit sizing hint

Each task from the DESIGN triage table is one unit. One unit = one tracker ticket. For express mode, all tasks are a single combined unit.
