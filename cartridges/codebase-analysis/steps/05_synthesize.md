# Step 5 · SYNTHESIZE
Role: Context Assembler

---

You are now acting as the **Context Assembler**. Your job is to compress the full session into a single machine-readable brief optimised for injection into a future Claude Code session, then produce a prioritised action list. Read unit gate summaries only — zero source file reads for either output.

## Before starting

**Full mode:**
1. Read all unit gate summaries from the BUILD archive
2. Read `.frame/CODEBASE.md` for structural facts not captured in summaries
3. Do not open any source files — everything you need is in the summaries and the brief

**Express mode:**
1. Read `.frame/CODEBASE.md`
2. Read the EXPLORE archive
3. No BUILD summaries exist — note in AI_CONTEXT.md that it was produced from structural mapping only (no per-report analysis). Sections that normally draw from report summaries (Key decisions, Fragility, Concerns) will be thinner; populate from CODEBASE.md and EXPLORE as far as they support it.
4. ADVICE.md is skipped in express mode — it draws from the report set, which does not exist.

---

## Your task — Part 1: AI_CONTEXT.md

Produce `.frame/reports/AI_CONTEXT.md`.

This file is always machine-format regardless of the reader type selected in SHAPE. Its purpose is to be injected as context into a future CC session — every line should be usable directly. No prose, no padding, no opinion.

```markdown
# CONTEXT [project-name]
Generated : [date]
Cartridge : codebase-analysis v0.1

Type       : [project type]
Entry      : [entry point file(s)]
Language   : [primary language]
Stack      : [terse — key runtime, framework, bundler only]

## Components
[name] : [one line — what it does, key interface or export]
[one row per meaningful component — no prose]

## Data flow
- [source] → [transform] → [destination]
[bullet per main flow; terse]

## Key decisions
- [deliberate architectural choice — one line]
[bullet per decision visible in the code]

## Fragility
- [component or pattern] : [what breaks if this changes]
[bullet per load-bearing element]

## Concerns
- [concern] — [one line, no alarm language]
[bullet per concern from CONCERNS.md; terse]

## Test coverage
Covered   : [terse list of what's tested]
Not covered: [terse list of gaps]

## Do not touch without reading first
- [component or file] : [why — one line]
[load-bearing elements from ARCHITECTURE.md fragility map]
```

---

## Your task — Part 2: ADVICE.md (full mode only)

Produce `.frame/reports/ADVICE.md` immediately after AI_CONTEXT.md. Zero source file reads — draw entirely from the report set and BUILD gate summaries already in context.

This file is always action-oriented regardless of reader type. Group items by effort, not severity. Within each group, higher-impact items appear first. Number items consecutively across all groups.

```markdown
# Advice
Based on: [list the reports used — e.g. STACK · STRUCTURE · ARCHITECTURE · CONVENTIONS · INTEGRATIONS · TESTING · CONCERNS]

Items are grouped by effort. Within each group, higher-impact items appear first.

---

## Quick wins — low effort, immediate quality improvement

[numbered items — specific, actionable, self-contained changes]
[name the file, function, or pattern; describe the fix and why it matters]
[include the alternative where relevant — "if you want X, do Y; if you want Z, do W"]

---

## Documentation — low effort, high friction reduction

[numbered items — things that only need a comment, a README section, or a JSDoc block]
[focus on implicit decisions, non-obvious behaviour, and new-developer traps]

---

## Build & tooling

[numbered items — configuration, dependency, or pipeline changes]
[skip this section if no build/tooling items surfaced]

---

## Testing

[numbered items — missing coverage, broken test infrastructure, unreliable assertions]
[be specific about what to test and why the gap matters]

---

## Architecture — longer term

[numbered items — structural changes with meaningful scope]
[note when an item is only warranted if the project is actively maintained]
[do not recommend decomposition for its own sake — only where there is a concrete maintainability return]
```

**Numbering:** Items are numbered consecutively across all groups (1, 2, 3 … N). Do not restart numbering per section.

**Scope:** Include only items that surfaced from the reports. Do not invent findings. If a section has no items, omit it entirely.

**Tone:** Direct and specific. Name the file, the function, the pattern. Describe the fix. Explain why it matters in one sentence. Avoid alarm language — this is an improvement list, not a severity report.

---

## Output

Update SESSION.md:

```markdown
## SYNTHESIZE complete

AI_CONTEXT.md : written to .frame/reports/
ADVICE.md     : written to .frame/reports/ [or "skipped — express mode"]
Source        : unit 1–7 gate summaries + .frame/CODEBASE.md
Reports       : [list of all reports written during BUILD, or "express mode — reports skipped"]
```

---

## Gate

```
FRAME ▸ SYNTHESIZE complete.

  Summary: AI_CONTEXT.md written. ADVICE.md written — [N items across [M] sections].
  Open:    [anything not captured — gaps to address in a future session]

  .frame/reports/ contains: [list all files written this session]
  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

**Express mode gate:**
```
FRAME ▸ SYNTHESIZE complete.

  Summary: AI_CONTEXT.md written from structural mapping only (express mode).
  Open:    [anything not captured]

  .frame/reports/AI_CONTEXT.md written.
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
