
# Code Audit
Version: 1.2
Domain: Code audit — systematic quality/architecture review and security audit of existing codebases

Use this cartridge to conduct a structured code audit of an existing codebase. Sessions can run in three modes: quality-only (architecture, patterns, maintainability), security-only (OWASP top 10, auth, data handling, injection surfaces), or combined (both lenses in a single pass). A completed session produces a prioritised findings report as a standalone markdown file.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Scope Analyst | Establish audit scope: codebase, mode, focus areas, constraints |
| 2 | **AUDIT PLAN** | Audit Strategist | Plan what to examine, in what order, against which standards |
| 2.5 | **BREAKDOWN** | Orchestrator | Enumerate scope areas as audit units |
| 3 | **AUDIT** | Auditor | Execute the audit per scope area — find and document issues |
| 4 | **SYNTHESIZE** | Synthesizer | Validate findings quality, identify cross-unit patterns, assemble final report |

---

## Path variants

**Full audit (quality, security, or combined):** All phases in sequence.

No abbreviated path — every audit benefits from explicit scoping and planning regardless of size. For small codebases, AUDIT PLAN and BREAKDOWN will be brief but still run.

---

## Unit sizing hint

Each scope area from AUDIT PLAN becomes one audit unit. The Audit Strategist determines scope areas based on the codebase's structure and the selected mode. Typical units map to: architectural layers, feature modules, or concern areas (e.g. "authentication flow", "data access layer", "API input validation").

For large codebases with many scope areas, expect to run multiple AUDIT sessions with `/frame stop` → `/clear` → `/frame resume` between units. The BREAKDOWN gate will flag when context is high enough to warrant a pause before AUDIT starts.

---

## Draft output

AUDIT writes findings progressively to SESSION.md. SYNTHESIZE assembles the final report as `[project-name]-audit-report.md` at the project root.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_audit_plan.md` — AUDIT PLAN phase template
- `steps/03_breakdown.md` — BREAKDOWN phase template
- `steps/04_audit.md` — AUDIT phase template
- `steps/05_synthesize.md` — SYNTHESIZE phase template

---

---
