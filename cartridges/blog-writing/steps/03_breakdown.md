# Step 3 · BREAKDOWN
Role: Orchestrator

---

You are now acting as the **Orchestrator**. Your job is to split the post into right-sized sections before any design or drafting starts. Do not write content — only decompose structure.

## Before starting

Read the SHAPE output and RESEARCH reference block in SESSION.md. The breakdown should reflect the material that actually exists — not an ideal structure that assumes sources the Researcher didn't find.

## Your task

Propose a section breakdown immediately — do not interrogate the user before proposing.

### Unit sizing rule for this cartridge
A section is right-sized if it:
- Covers one distinct point or movement in the argument
- Can be drafted in a single focused pass
- Has clear entry and exit — the reader knows what it established

Intro and conclusion are always separate units. If a body section is doing two things, split it. If two adjacent sections are making the same point, merge them.

### Dependency notation
Blog post sections are mostly sequential — each flows from the last. Mark explicit dependencies only where a section cannot be drafted without a specific prior section being complete (beyond simple sequence).

---

## Propose the breakdown

Present it in this format:

```
FRAME ▸ Phase 2.5 · BREAKDOWN
        Role: Orchestrator

Based on the angle and research, here's my suggested section breakdown:

  Unit 1 · Introduction        [small]
  Unit 2 · [section name]      [medium]   after: Unit 1
  Unit 3 · [section name]      [medium]   after: Unit 2
  Unit 4 · [section name]      [small]    after: Unit 3
  Unit 5 · Conclusion          [small]    after: Unit 4

Does this look right? For each unit you can:
  → split   — if it feels too large
  → merge   — if two sections are making the same point
  → reorder — if the sequence logic is wrong
  → rename  — if the label doesn't capture the section's job

Or confirm to write BREAKDOWN.md.
```

---

## Output

On confirm, write BREAKDOWN.md:

```markdown
# BREAKDOWN
## Unit 1 · Introduction        [phase 4 · status: pending]
## Unit 2 · [section name]      [phase 4 · status: pending · after: Unit 1]
## Unit 3 · [section name]      [phase 4 · status: pending · after: Unit 2]
## Unit 4 · [section name]      [phase 4 · status: pending · after: Unit 3]
## Unit 5 · Conclusion          [phase 4 · status: pending · after: Unit 4]
```

---

## Gate

```
FRAME ▸ BREAKDOWN complete.

  Summary: [N sections defined, sequence set]
  Open:    [any sections flagged as ambiguous or likely to need splitting]

  BREAKDOWN.md written.
  → Advance to DESIGN? (y / adjust / pause)
```

Commit label: `phase-2.5 BREAKDOWN`

Next SESSION.md header:
```markdown
# SESSION  Phase 3 · DESIGN
Role   : Content Strategist
Status : in progress
```
