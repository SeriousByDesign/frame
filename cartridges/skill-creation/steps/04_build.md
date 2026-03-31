# Step 4 · BUILD
Role: QA Engineer

---

You are now acting as the **QA Engineer**. Your job is to run the skill against each test case, evaluate the output, and identify what needs improving in SKILL.md. After all units, you revise the skill and decide whether to iterate.

## Before starting

1. Read the DESIGN output from the archive — draft SKILL.md and test case definitions
2. Read BREAKDOWN.md — work in the defined unit sequence
3. Read the draft SKILL.md at `.draft/[skill-name]/SKILL.md`
4. Check the environment from SHAPE — it determines the eval pipeline:
   - **Claude Code** — full pipeline: subagent runs, baselines, grading, benchmark viewer
   - **Claude.ai** — qualitative: run the skill yourself inline, present results to user
   - **Cowork** — full pipeline with static viewer (use `--static` flag for generate_review.py)

---

## Your task

### Per-unit work

For each test case unit in BREAKDOWN.md:

#### 1. State the test case

Announce which test case you're running — prompt, expected behaviour, pass criterion from BREAKDOWN.md.

#### 2. Run the skill

**Claude Code / Cowork (subagent available):**

Spawn two subagents in parallel for each test case:

- **With-skill run:** Execute the test prompt with the skill loaded. Save outputs to `[skill-name]-workspace/iteration-1/[test-name]/with_skill/outputs/`
- **Baseline run:** Execute the same prompt without the skill. Save outputs to `[skill-name]-workspace/iteration-1/[test-name]/without_skill/outputs/`

Write an `eval_metadata.json` for each test case:
```json
{
  "eval_id": 0,
  "eval_name": "[descriptive name]",
  "prompt": "[the test prompt]",
  "assertions": []
}
```

While runs are in progress, draft quantitative assertions if the skill has objective output. Update eval_metadata.json and evals/evals.json with the assertions.

**Claude.ai (no subagents):**

Read the skill's SKILL.md, then follow its instructions to accomplish the test prompt yourself. Do one test case at a time. Skip baseline runs. Present the output directly in conversation and ask for feedback inline.

#### 3. Evaluate the output

For each completed run, assess:

- Did the skill trigger correctly?
- Does the output match expectations from the test case?
- What specific part of SKILL.md caused any failure or weakness?

Record the result in SESSION.md immediately — do not batch results to the end.

#### 4. Close the unit

Update BREAKDOWN.md — mark unit complete with result (pass/fail/partial).

---

### After all units: review and iterate

Once all test cases are run, the iteration decision happens. This is the critical part of BUILD.

#### Step A: Generate the eval viewer (Claude Code / Cowork)

For objective-output skills, grade each run, aggregate into a benchmark, and launch the viewer:

1. Grade assertions against outputs — save results to `grading.json` per run
2. Aggregate: `python -m scripts.aggregate_benchmark [workspace]/iteration-N --skill-name [name]`
3. Launch viewer: `python eval-viewer/generate_review.py [workspace]/iteration-N --skill-name "[name]" --benchmark [workspace]/iteration-N/benchmark.json`
   - In Cowork: add `--static [output_path]` for a standalone HTML file
   - For iteration 2+: add `--previous-workspace [workspace]/iteration-[N-1]`

Tell the user the viewer is ready and wait for their feedback.

For subjective-output skills, skip grading and benchmarking — present outputs directly and ask for qualitative feedback.

**Claude.ai:** Skip the viewer. You already presented results inline during per-unit work. Gather any remaining feedback from the user.

#### Step B: Read feedback and revise

When the user provides feedback (via feedback.json from the viewer, or inline):

- Empty feedback = the test case was fine
- Focus improvements on test cases with specific complaints
- When revising SKILL.md, think about these principles:
  - **Generalize** — don't overfit to the test cases. The skill will be used across many different prompts.
  - **Keep it lean** — remove instructions that aren't pulling their weight. Read run transcripts to spot unproductive patterns.
  - **Explain the why** — prefer explaining reasoning over rigid MUSTs and NEVERs. LLMs respond better to understanding than to commands.
  - **Look for repeated work** — if every test run independently wrote the same helper script, bundle it in `scripts/` so future invocations don't reinvent it.

Apply revisions to `.draft/[skill-name]/SKILL.md`.

#### Step C: Iterate or proceed

After revision, present the gate. The user decides: another round or advance to CHECK.

---

## Output

Update SESSION.md per unit:

```markdown
## Unit N · TC-N [name] — [pass / fail / partial]

Prompt   : [the prompt used]
Result   : [what happened]
Issue    : [what to fix in SKILL.md, or "none"]
```

After all units and iteration:

```markdown
## Iteration Summary

Iteration : [N]
Pass rate : [X/Y test cases passed]
Revisions : [list of changes made to SKILL.md]
Decision  : [iterate again / advance to CHECK]
```

---

## Gate (per unit)

**If more units remain:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — test result, any issues found]
  Open:    [anything flagged]

  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
```

**If this was the last unit:**
```
FRAME ▸ BUILD · All test cases run.

  Summary: [pass rate, key findings]
  Open:    [issues to address in revision]

  → Review results and revise SKILL.md, then:
  → Another iteration? (iterate / advance to CHECK / pause)
```

When the user chooses "advance to CHECK":

```
FRAME ▸ BUILD complete.

  Summary: [total iterations, final pass rate, key revisions]
  Open:    [anything deferred to CHECK]

  SESSION.md updated.
  → Advance to CHECK? (y / adjust / pause)
```

Auto-commit per unit:
```
FRAME: phase-3 BUILD unit-N complete — [test name]
```

Commit label: `phase-3 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CHECK
Role   : Skill Author
Status : in progress
```
