# Step 6 · CHECK
Role: Editor

---

CHECK runs in two sequential passes. The Editorial pass goes first — argument, gaps, tone. The Polish pass follows — tightening, transitions, sentence-level quality. Do not blend the two passes.

---

## Pass 1 · Editorial

You are now acting as the **Editor** in editorial mode. Your job is to assess whether the post works as a whole — argument, structure, tone, and the opening and closing.

### Before starting
Read in order:
1. SHAPE brief from `.frame/archive/phase-1.md` — angle, audience, acceptance criteria
2. DESIGN arc from `.frame/archive/phase-3.md` — intended structure and section jobs
3. `.draft/[post-slug].md` — the full draft

### Review areas

**Argument**
Does the post make its case? Is the angle from SHAPE delivered? Are claims supported? Are there logical gaps or unsupported leaps?

**Structure**
Does each section do its job from DESIGN? Is the sequence right? Are there sections that don't pull their weight, or gaps that need a section?

**Tone**
Does the tone match the audience from SHAPE throughout? Are there sections that shift register unexpectedly?

**Opening**
Does the opening earn the reader's attention? Does it make the angle clear without over-explaining?

**Closing**
Does the conclusion land? Does it close the argument rather than just stop?

**Flagged items from BUILD**
Address every item flagged during BUILD explicitly.

### Output format

```
Editorial Pass

  Argument  : [holds / gaps noted — brief description]
  Structure : [works / issues noted — brief description]
  Tone      : [consistent / shifts noted]
  Opening   : [strong / needs work — brief note]
  Closing   : [lands / needs work — brief note]

  Issues:
    [BLOCKING]     [description — must be resolved before CHECK closes]
    [NON-BLOCKING] [description — should be addressed, not a blocker]

  Sign-off: [approved / approved with changes / requires rework]
```

Append this block to SESSION.md immediately.

If rework is required, stop here. Do not proceed to Polish pass until blocking issues are resolved.

### Inline fix vs loop-back threshold (blog-post)
- **Fix inline** if the issue is a sentence, paragraph, or transition that can be corrected without changing the section's job
- **Loop back to BUILD** if a section needs to be substantially rewritten or its key point needs to change
- **Loop back to DESIGN** if the structure is wrong — a section needs to be added, removed, or reordered

---

## Pass 2 · Polish

You are now acting as the **Editor** in polish mode. Your job is to tighten the prose — sentence by sentence where needed. Do not re-argue editorial decisions. Do not rewrite for style preference — only cut what is weak and strengthen what is unclear.

### Review areas

**Transitions**
Are the transitions between sections and between paragraphs smooth? Does the reader always know where they are in the argument?

**Sentence quality**
Are there overwritten sentences? Weak openers within sections (starting with "There is", "It is", "This is")? Unnecessary hedging? Cut or rewrite.

**Tightening**
Is every paragraph doing work? Is every sentence in every paragraph doing work? Cut anything that doesn't earn its place.

**Section openings and closings**
Does each section open with its strongest foot? Does each section close with a line that completes the thought?

### Output format

```
Polish Pass

  Transitions : [smooth / issues noted]
  Tightening  : [clean / cuts made — summary]
  Notable edits: [any section-level changes made]

  Sign-off: [approved / approved with minor edits]
```

Append this block to SESSION.md immediately. Apply edits directly to `.draft/[post-slug].md`.

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [2-3 lines — editorial outcome, polish applied, post status]
  Open:    [non-blocking issues, anything deferred to author review]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-5 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 6 · CLOSE
Role   : Orchestrator
Status : in progress
```
