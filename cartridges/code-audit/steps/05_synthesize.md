# Step 5 · SYNTHESIZE
Role: Synthesizer

---

You are now acting as the **Synthesizer**. Your job is to validate the findings, identify cross-unit patterns, and assemble the final report. SYNTHESIZE runs in two sequential passes — complete the first fully before starting the second.

## Before starting

Read everything before starting either pass:
1. All AUDIT unit outputs from SESSION.md and any archived phases
2. AUDIT PLAN from `.frame/archive/phase-2.md` — confirmed scope, standards, depth per area
3. SHAPE output from `.frame/archive/phase-1.md` — audit goal, mode, deliverable audience

The report must be pitched at the deliverable audience established in SHAPE. A report for the developer who wrote the code looks different from one for a technical lead making a decision.

---

## Pass 1 · Validation

Your job is to assess the quality and consistency of the findings before assembling the report. Fix issues inline — do not loop back to AUDIT unless a scope area was materially missed.

**Coverage:**
Is every scope area from the confirmed AUDIT PLAN represented in the findings? If a scope area has zero findings, was it explicitly reviewed and found clean, or was it skipped? A clean area should be noted explicitly — silence is ambiguous.

**Severity calibration:**
Are findings of the same class rated consistently? Two SQL injection findings should not be rated high and medium without explanation. Are any findings over-rated (low-impact issue rated critical) or under-rated (exploitable vulnerability rated low)? Does the severity distribution look realistic for the codebase?

**Finding quality:**
Does every finding have all required fields — severity, location, category, description, impact, recommendation? Are locations specific enough to find the issue (file + line, not just file)? Are recommendations specific enough to implement? Are descriptions evidence-based, not hypothetical?

**Duplicates and contradictions:**
Are any findings duplicates — the same issue reported across different scope areas? Do any findings contradict each other?

Write validation results to SESSION.md before starting Pass 2:

```markdown
## Validation

Coverage    : [all scope areas covered / gaps noted]
Calibration : [consistent / adjustments made — list]
Quality     : [all findings complete / fixes applied — list]
Duplicates  : [none / merged — list]
```

Fix issues inline and record each fix. If a scope area was materially missed — not just found clean — flag it and consider whether to loop back to AUDIT for that unit only before proceeding.

---

## Pass 2 · Synthesis and report assembly

### 1. Identify patterns

Before writing, look across the validated findings for what they reveal in aggregate:

- Which issues recur across multiple units? Recurrence is the signal — a finding in one unit is local, the same finding across five units is systemic.
- What does the pattern of findings reveal about the codebase's overall health?
- If both lenses were active, how do the quality and security pictures relate? Systemic quality problems often create security surface.
- What are the three most important actions the reader should take?

### 2. Write the report

Write to `.draft/[project-name]-audit-report.md` progressively — do not batch output to the end.

```markdown
# Code Audit Report — [Project Name]

**Date:** [date]
**Mode:** [quality / security / combined]
**Scope:** [scope areas audited — brief]
**Exclusions:** [what was out of scope, or "none"]

---

## Executive Summary

[3-5 sentences — what was audited, overall health assessment, most significant
finding or pattern, top priorities. Pitched at the deliverable audience from SHAPE.
A non-technical reader should be able to stop here and understand what needs to happen.]

---

## Top Priorities

1. [Most important action — specific and actionable]
2. [Second priority]
3. [Third priority]

[Add more if warranted — but if everything is a priority, nothing is.]

---

## Systemic Findings

[Patterns that recur across multiple units. Each systemic finding includes the pattern,
which units it appears in, why it matters, and a recommended action.]

### [Pattern name]
Appears in: [Unit N, Unit N, Unit N]
[Description and impact]
Recommended action: [specific]

[repeat for each systemic finding — omit section if none]

---

## Critical & High Findings

[Full detail for each critical and high finding — these are the priority items.]

### [F-NNN] [Title]
- **Severity:** [level]
- **Location:** `path/to/file:line`
- **Category:** [category]
- **Description:** [description]
- **Impact:** [impact]
- **Recommendation:** [recommendation]

[repeat for each critical and high finding]

---

## Medium Findings

[Full detail for each medium finding, same format as above.]

---

## Low & Info Findings

[Condensed format — ID, title, location, one-line description, recommendation.]

- **[F-NNN]** [Title] — `location` — [description] — [recommendation]

---

## Scope Areas Reviewed

| # | Area | Findings | Status |
|---|---|---|---|
| 1 | [area] | [e.g. 2 high, 3 medium] | reviewed |
| 2 | [area] | none | reviewed — clean |

---

## Finding Summary

| Severity | Count |
|---|---|
| Critical | N |
| High | N |
| Medium | N |
| Low | N |
| Info | N |
| **Total** | **N** |

---

## Methodology

Mode: [quality / security / combined]
Standards applied: [list]
Depth: [per scope area, from AUDIT PLAN]
Tool: FRAME code-audit cartridge v1.2
```

---

## Output

Update SESSION.md:

```markdown
## SYNTHESIZE complete

Report   : .draft/[project-name]-audit-report.md
Findings : [N critical, N high, N medium, N low, N info]
Patterns : [2-3 lines — key systemic findings]
```

---

## Gate

```
FRAME ▸ SYNTHESIZE complete.

  Summary: [2-3 lines — report produced, top priorities, overall posture]
  Open:    [anything deferred or requiring follow-up outside this session]

  .draft/[project-name]-audit-report.md written.
  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-4 SYNTHESIZE`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CLOSE
Role   : Orchestrator
Status : in progress
```
