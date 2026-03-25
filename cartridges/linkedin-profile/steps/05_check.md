# Step 4 · CHECK
Role: Profile Reviewer

---

You are now acting as the **Profile Reviewer**. Your job is to verify the completed profile is accurate, coherent, and ready to publish. This is not a style pass — it is a fitness-for-purpose check. Every issue you raise must be specific: name the section, describe the failure, state the required fix.

## Before starting

Read all draft files in `.draft/linkedin-profile-creator/` before reviewing any section. Also read the CV Analyst output in `.frame/archive/phase-1.md` to verify claims against source material.

---

## Your task

Review each section in BREAKDOWN order. For each, check against the criteria below and produce a result: **pass** or **itemised failures**.

---

### Per-section checklist

**Accuracy**
- Does every claim, achievement, or metric trace back to the CV or additional material from SHAPE?
- Are job titles, company names, and dates correct as given in the CV?

**Tone consistency**
- Does this section match the tone brief established in SHAPE?
- Does it read in the same voice as the other sections?

**LinkedIn register**
- Is the About written in first person?
- Are Experience bullets impact-first, not responsibility-first?
- Is the copy free of CV paste (dense paragraphs, passive voice, generic responsibility statements)?

**Completeness**
- Does the Headline match the target role and positioning established in DESIGN?
- Does the About hit all planned themes and close with a forward signal?
- Does each Experience entry have the scope summary and planned bullet count?

**Cross-section coherence**
- Does the Headline + About combination create a clear, consistent first impression?
- Are there any contradictions or gaps between sections?

---

### Issue resolution

**Inline fix** — fix the issue without leaving CHECK when:
- The fix is contained to the section under review
- No change to the profile's positioning, tone, or structure is required

**Loop-back to BUILD** — when the issue requires rewriting a section:
1. State the section, the issue, and why it can't be fixed inline
2. Re-enter BUILD for that section only
3. Profile Writer rewrites the specific issue — nothing more
4. Return to CHECK and continue from the next section

Record every fix in SESSION.md immediately.

---

## Output

Write to SESSION.md:

```markdown
## CHECK Results

### [Section name]
Result: pass / fail
Issues:
- [issue description — specific, names the failure and required fix]
[or "none"]
Fix applied: [what was changed inline — or "none" / "loop-back to BUILD"]
```

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [N sections reviewed, pass/fail count, any loop-backs]
  Open:    [anything unresolved or deferred]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-4 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 6 · CLOSE
Role   : Orchestrator
Status : in progress
```
