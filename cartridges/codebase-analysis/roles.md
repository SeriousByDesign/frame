# Roles — Codebase Analysis Cartridge

---

## Scope Analyst

**Focus:** Establish who the reader is, what codebase to examine, and any constraints on scope — before any code is read
**Asks:** Reader type (numbered list), codebase path, exclusions, focus areas if any
**Produces:** SESSION.md brief — reader type, codebase path, exclusions, focus
**Before starting:** Nothing — this is the first phase. Do not read any code during SHAPE.

---

## Codebase Navigator

**Focus:** Map the codebase structurally — what exists, how it connects, what belongs to what. Read to map, not to analyse. The job is to understand the topology well enough to assign files to report units accurately. Do not write prose analysis — facts and structure only.
**Reads:** Directory tree, entry points, package manifests, config files, key interfaces. No depth limit on reading; strict limit on writing — CODEBASE.md contains structural facts only.
**Produces:** `.frame/CODEBASE.md`; file assignment table in SESSION.md
**Before starting:** Read SHAPE output — codebase path, exclusions, focus areas

---

## Orchestrator

**Focus:** Enumerate report units from the file assignment table and confirm sequencing before any reports are written
**Asks:** Does each unit have a clear file assignment? Are any units thin (too few files) or heavy (too many)? Does the sequence make sense — foundational reports before interpretive ones?
**Produces:** BREAKDOWN.md with report units in sequence order
**Before starting:** Read EXPLORE output — `.frame/CODEBASE.md` and file assignment table in SESSION.md

---

## Report Author

**Focus:** Write one report per unit, reading only the assigned files and prior unit gate summaries. Adjust voice and emphasis for the reader type established in SHAPE — this is a standing constraint for the entire BUILD phase, not a per-unit decision.

**Reader type lookup:**

| Reader | Voice | Emphasis |
|---|---|---|
| New developer | Explanatory, context-first | Mental models before detail; assume nothing is obvious |
| Returning author | Terse, decision-focused | What was decided, what's rough, what you left for later |
| Technical stakeholder | Plain language, no code references | What it does and why it's built this way |
| AI context injection | Structured facts, no prose | Compact; every line usable as context in a future CC session |

**Two explicit exceptions:**
- **CONCERNS.md for technical stakeholder:** use "areas that warrant attention" framing — same facts, no alarm language. Do not use words like "broken", "dangerous", or "critical".
- **AI_CONTEXT.md:** always machine-format regardless of reader type — produced in SYNTHESIZE, not BUILD.

**What to read per unit:**
- `.frame/CODEBASE.md` — structural foundation, always
- Assigned files for this unit — deep read
- Gate summaries from prior units — lightweight carry-forward; do not re-open source files already covered

**What not to read:** files not in this unit's assignment; source files already covered by a prior unit.

**Produces:** One .md report per unit, written to `.frame/reports/`
**Before starting each unit:** Read SHAPE archive (reader type), EXPLORE archive (`.frame/CODEBASE.md`), BREAKDOWN.md (unit sequence and file assignments), prior unit gate summaries

---

## Context Assembler

**Focus:** Compress the full session into a single machine-readable brief optimised for injection into a future Claude Code session, then produce a prioritised action list. Zero source file reads for both outputs.
**Produces (full mode):**
- `.frame/reports/AI_CONTEXT.md` — structured facts, no prose, always machine-format regardless of reader type
- `.frame/reports/ADVICE.md` — prioritised improvements grouped by effort tier, drawn from the full report set
**Produces (express mode):** `.frame/reports/AI_CONTEXT.md` only — ADVICE.md is skipped (no report set to draw from)
**Before starting (full mode):** Read all unit gate summaries from BUILD archive; read `.frame/CODEBASE.md` for structural facts not captured in summaries
**Before starting (express mode):** Read `.frame/CODEBASE.md` and EXPLORE archive only — no BUILD summaries exist. Sections that normally draw from report summaries (Key decisions, Fragility, Concerns) will be thinner; populate from CODEBASE.md and EXPLORE output as far as they support it.
