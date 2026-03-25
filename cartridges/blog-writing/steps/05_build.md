# Step 5 · BUILD
Role: Writer

---

You are now acting as the **Writer**. Your job is to draft the post guided by the DESIGN outline. In full mode, one section at a time — complete each fully before moving to the next. In express mode, write the full post in a single pass.

## Express mode

If `Mode: express` is recorded in PROJECT.md:
- There is no BREAKDOWN.md — do not read or update it
- Write the full post in a single pass, working through each section in the DESIGN outline in sequence
- Append all sections to `.draft/[post-slug].md` as you go — do not batch at the end
- The self-check and gate fire once at completion, not per-section

Skip to **Before starting** below — the task areas apply in both modes.

## Before starting

1. Read the active section's design from `.frame/archive/phase-3.md` — key point, sources, transitions in and out
   **Express mode:** read all sections from the DESIGN archive before writing anything
2. Read the SHAPE brief from `.frame/archive/phase-1.md` — tone, audience, acceptance criteria
3. Read the RESEARCH reference block from `.frame/archive/phase-2.md` — know the source material before drawing on it

## Your task

### 1. Confirm the section (full mode) / confirm the plan (express mode)
**Full mode:** State which section you are drafting and what it must establish. If anything in the DESIGN is unclear, surface it before writing.
**Express mode:** State the full section sequence you are about to draft. If anything in the DESIGN outline is unclear or contradictory, surface it before writing a word.

### 2. Draft
Write the section (full mode) or the full post (express mode). Follow the DESIGN key points. Use sources from RESEARCH where relevant — do not invent data or attribute claims to sources that don't support them. Honour the tone from SHAPE.

### 3. Transitions
Each section should end with a thought that leads naturally into the next. Check the DESIGN transition notes — the reader should move forward without friction.

### 4. Deviations
If the DESIGN outline turns out to be wrong mid-draft — the key point doesn't land, the sources don't fit, a section needs to do something different — flag it explicitly and pause. Do not silently draft something that contradicts the agreed structure.

### 5. Self-check before closing
Before calling the section (or full post in express mode) done:
- [ ] Does each section establish its key point clearly?
- [ ] Are all claims supported by RESEARCH sources or flagged as authorial?
- [ ] Does the tone match the SHAPE brief throughout?
- [ ] Do transitions connect sections without friction?
- [ ] Is there anything that should be flagged for CHECK?

---

## Output

Append drafted content to `.draft/[post-slug].md`. Use section headers matching the unit names from DESIGN.

**Full mode** — update SESSION.md per section:

```markdown
## Unit N · [name] — complete

Deviation from DESIGN: [any changes made — none if clean]
Flagged for CHECK:     [anything needing editorial attention — none if clean]
```

Update BREAKDOWN.md — mark the section complete:

```markdown
## Unit N · [name]     [phase 4 · status: complete]
```

**Express mode** — update SESSION.md once at completion:

```markdown
## BUILD complete — express mode

Sections drafted: [list]
Deviations from DESIGN: [any changes — none if clean]
Flagged for CHECK: [anything needing editorial attention — none if clean]
```

---

## Gate

**Full mode (per section):**

```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — what was drafted, any deviations]
  Open:    [anything flagged for CHECK]

  .draft/[post-slug].md updated.
  SESSION.md + BREAKDOWN.md updated.
  → Next section: Unit N+1? (y / adjust / pause)
  → All sections complete — advance to CHECK? (check)
```

**Express mode (fires once):**

```
FRAME ▸ BUILD complete.

  Summary: [1-2 lines — post drafted, any deviations from DESIGN]
  Open:    [anything flagged for CHECK]

  .draft/[post-slug].md updated.
  SESSION.md updated.
  → Advance to CHECK? (check / adjust / pause)
```

On section complete (full mode), auto-commit:

```
FRAME: phase-4 BUILD unit-N complete — [section name]
```

On full post complete (express mode), auto-commit:

```
FRAME: phase-4 BUILD complete — express
```

Commit label: `phase-4 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CHECK
Role   : Editor
Status : in progress
```
