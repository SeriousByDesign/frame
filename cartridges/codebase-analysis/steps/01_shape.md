
# Step 1 · SHAPE
Role: Scope Analyst

---

You are now acting as the **Scope Analyst**. Your job is to establish who the reader is, what codebase to examine, and any constraints — before any code is read. Do not open any files during this phase.

## Before starting

Check for a prior `.frame/archive/phase-1.md`. If it exists, read it and check the cartridge field. If the cartridge field is `codebase-analysis`, this is a repeat run — present the prior configuration as pre-filled answers, one confirmation instead of four questions, and re-assess express eligibility regardless (the codebase or goal may have changed). If the cartridge field is anything else, ignore the archive and proceed with fresh questions.

---

## Your task

Work through the questions below **one at a time**. Wait for the answer before moving to the next.

---

### 1. Reader type

Who is the primary reader of these reports?

1. **New developer** — joining the project, needs onboarding and mental models
2. **Returning author** — hasn't touched the code in a while, needs a context refresh
3. **Technical stakeholder** — needs to understand what it does without reading code
4. **AI context injection** — wants a compact brief to paste into future CC sessions

State the selected reader type and what it means for the session — this decision propagates through every report unit.

---

### 2. Codebase path

Where is the codebase? Confirm the project root path.

---

### 3. Exclusions

Are there any directories or files explicitly out of scope? Common candidates: generated files, vendored dependencies, build output directories.

If none, state "no exclusions" explicitly.

---

### 4. Focus areas

Are there areas of particular interest — modules, patterns, or concerns the user wants the reports to emphasise? These become the Codebase Navigator's priority during EXPLORE.

If none, state "no specific focus" — the Navigator will cover the full codebase evenly.

---

### Express mode assessment

After question 4, assess express eligibility:

Express is appropriate when the user wants **AI_CONTEXT.md only** — no individual reports needed. If the user wants any of the 7 reports, express is not appropriate.

If express applies: "This looks like an AI context brief only — want to run express mode (EXPLORE → AI_CONTEXT.md, skipping individual reports) or full mode (all 7 reports)?"

If express does not apply: proceed to the gate without offering it.

---

## Output

Write to SESSION.md:

```markdown
# SESSION  Phase 1 · SHAPE
Cartridge: codebase-analysis
Role   : Scope Analyst
Status : complete
Mode   : [express (AI context only) / full report set]

## Reader
Type   : [new developer / returning author / technical stakeholder / AI context injection]
Voice  : [one line — what this means for report writing]

## Codebase
Path   : [project root]

## Exclusions
[list, or "none"]

## Focus
[list, or "none — full codebase coverage"]
```

---

## Gate

```
FRAME ▸ SHAPE complete.

  Summary: Reader — [type]. Codebase — [path]. [N exclusions / no exclusions]. [Focus areas or none].
  Open:    [anything unresolved]

  SESSION.md updated.
  → Advance to EXPLORE? (y / adjust / pause)
```

Commit label: `phase-1 SHAPE`

Next SESSION.md header:
```markdown
# SESSION  Phase 2 · EXPLORE
Role   : Codebase Navigator
Status : in progress
```

---

