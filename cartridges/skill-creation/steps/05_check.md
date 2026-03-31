# Step 5 · CHECK
Role: Skill Author

---

You are now acting as the **Skill Author** in review mode. Your job is to optimize the skill's trigger description, do a final compliance review, and package the skill for installation.

## Before starting

1. Read the BUILD output from the archive — test results, iteration notes, final SKILL.md state
2. Read the current SKILL.md at `.draft/[skill-name]/SKILL.md`
3. Check the environment from SHAPE — it determines what's available:
   - **Claude Code** — full pipeline: run_loop.py for description optimization, package_skill.py for packaging
   - **Claude.ai** — qualitative description review only, packaging via package_skill.py if Python available
   - **Cowork** — run_loop.py and package_skill.py both available

---

## Your task

Work through each section in order. Write results to SESSION.md as you go — do not batch to gate close.

### 1. Description optimization

The description field in SKILL.md frontmatter is the primary mechanism that determines whether Claude invokes the skill. This step optimizes it for trigger accuracy.

**Claude Code / Cowork (run_loop.py available):**

#### Step 1a: Generate trigger eval queries

Create 20 eval queries — a mix of should-trigger (8–10) and should-not-trigger (8–10). Save as JSON:

```json
[
  {"query": "the user prompt", "should_trigger": true},
  {"query": "another prompt", "should_trigger": false}
]
```

The queries must be realistic — concrete, specific, with detail like file paths, personal context, company names, casual speech, typos. Focus on edge cases rather than clear-cut examples.

For **should-trigger** queries: different phrasings of the same intent, some formal, some casual. Include cases where the user doesn't name the skill explicitly but clearly needs it. Include cases where this skill competes with another but should win.

For **should-not-trigger** queries: near-misses that share keywords or concepts but actually need something different. Don't make them obviously irrelevant — "write a fibonacci function" as a negative for a PDF skill tests nothing. The negatives should be genuinely tricky.

#### Step 1b: Review eval set with user

Present the eval set to the user for review. They may edit queries, toggle should-trigger, or add/remove entries. This step matters — bad eval queries lead to bad descriptions.

If the skill-creator's HTML review template is available (`assets/eval_review.html` in the skill-creator skill directory), use it to present the eval set in a browser for easier editing. Otherwise, present inline and confirm.

#### Step 1c: Run the optimization loop

Tell the user this will take some time, then run in the background:

```bash
python -m scripts.run_loop \
  --eval-set <path-to-trigger-eval.json> \
  --skill-path <path-to-skill> \
  --model <model-id-powering-this-session> \
  --max-iterations 5 \
  --verbose
```

Use the model ID from the current session so the triggering test matches what the user experiences. The script splits the eval set into 60% train / 40% held-out test, evaluates the current description (3 runs per query for reliability), then iterates: propose improvement → re-evaluate on train + test → repeat. Best description is selected by test score to avoid overfitting.

While it runs, give the user periodic updates on iteration progress and scores.

#### Step 1d: Apply the result

Take `best_description` from the output and update SKILL.md frontmatter. Show the user before/after and report the scores. Record in SESSION.md immediately.

**Claude.ai (no run_loop.py):**

Review the description qualitatively. Check it against the trigger contexts from SHAPE and the test results from BUILD:

- Does it clearly state what the skill does?
- Does it cover all trigger contexts that worked in BUILD?
- Is it pushy enough to combat undertriggering?
- Does it avoid triggering on the negative cases from BUILD?

Propose a revised description. Present before/after to the user and confirm before applying.

---

### 2. Final review

Review the complete SKILL.md for quality and compliance:

- [ ] **Frontmatter:** name (kebab-case), description (optimized), any optional fields
- [ ] **Body structure:** clear sections, imperative form, leads with workflow
- [ ] **Line count:** under 500 lines — if over, recommend hierarchy split
- [ ] **Bundled resources:** if the skill has `scripts/`, `references/`, or `assets/`, verify SKILL.md references them with clear guidance on when to use each
- [ ] **No security issues:** skill does not contain malware, exploit code, or content that could compromise system security. Contents should not surprise the user if described.
- [ ] **Test case coverage:** BUILD results confirm the skill handles core triggers, edge cases, and avoids negative triggers

If issues are found, fix them inline if contained (wording, formatting, small logic fixes). If the issue is structural (missing sections, wrong output format, fundamental logic), loop back to BUILD for the affected scope.

Record results in SESSION.md per item — pass or itemised failure with fix applied.

---

### 3. Package the skill

**Claude Code / Cowork (package_skill.py available):**

```bash
python -m scripts.package_skill <path/to/skill-folder>
```

This produces a `.skill` file. Direct the user to the file path so they can install it.

**Claude.ai (package_skill.py may or may not be available):**

If Python and the packaging script are available, run it. If not, tell the user the skill is ready at `.draft/[skill-name]/` and explain how to package it manually or install it from the directory.

**For improve sessions updating an existing skill:** preserve the original skill name in both the directory name and the `name` frontmatter field. Output `[skill-name].skill`, not `[skill-name]-v2.skill`.

Record the package path in SESSION.md.

---

## Output

Write to SESSION.md progressively — each section as it completes:

```markdown
# SESSION  Phase 5 · CHECK
Role   : Skill Author
Status : complete

## Description Optimization
Method    : [run_loop.py / qualitative review]
Before    : [original description]
After     : [optimized description]
Score     : [train/test scores if quantitative, or "qualitative — user confirmed"]

## Final Review
- Frontmatter: [pass / fix applied]
- Body structure: [pass / fix applied]
- Line count: [N lines — pass / warning]
- Bundled resources: [pass / N/A / fix applied]
- Security: [pass]
- Test coverage: [pass / gaps noted]

## Package
Path   : [path to .skill file]
Method : [package_skill.py / manual]
```

---

## Gate

```
FRAME ▸ CHECK complete.

  Summary: [description optimized, review passed, skill packaged]
  Open:    [anything unresolved]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-5 CHECK`

Next SESSION.md header:
```markdown
# SESSION  Phase 6 · CLOSE
Status : in progress
```
