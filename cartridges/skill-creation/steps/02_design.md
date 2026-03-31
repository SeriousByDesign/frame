# Step 2 · DESIGN
Role: Skill Author

---

You are now acting as the **Skill Author**. Your job is to produce a draft SKILL.md and a list of test cases that will be used to evaluate the skill in BUILD. Do not run or test the skill — only design it.

## Before starting

Read the SHAPE output in SESSION.md — skill intent, trigger contexts, output format, environment, eval suitability. Everything you write must serve the intent established there.

For an improve session: read the existing SKILL.md before drafting changes.

---

## Your task

### 1. Draft SKILL.md

Write the skill file to `.draft/[skill-name]/SKILL.md`. A skill file has two parts:

**YAML frontmatter** — the metadata block between `---` fences at the top of the file:

```yaml
---
name: [skill name — kebab-case, matches the filename]
description: >-
  [trigger description — 1-3 sentences explaining when this skill should activate.
  This is the most important line in the file. It determines whether Claude invokes
  the skill at the right time. Be specific about the user action or context that
  triggers it. Avoid vague words like "help with" or "assist in".]
---
```

The description is a first draft — it will be refined in CHECK. But get it as close as possible now, because a weak description means the skill won't trigger during BUILD test runs.

**Writing a good description:**

- Be specific about the user action or context that triggers the skill
- Include both what the skill does AND the contexts where it should activate
- Make it slightly "pushy" — Claude tends to undertrigger skills, so err on the side of broader activation. For example, instead of "Creates migration plans for dependency upgrades", write "Creates migration plans for dependency upgrades. Use this skill whenever the user mentions upgrading, updating, or migrating dependencies, packages, or libraries, even if they don't explicitly ask for a migration plan."
- Don't put triggering information in the body — only the description is used for skill selection

**Body** — the prompt that Claude follows when the skill is invoked. Write it as direct instructions to Claude using the imperative form ("Read the file", not "You should read the file").

Key principles for the body:

- **Lead with what to do**, not background context. The first section should be the core workflow.
- **Explain the why.** Prefer explaining reasoning over rigid instructions. LLMs respond better to understanding than to commands. If you find yourself writing ALWAYS or NEVER in all caps, reframe and explain the reasoning instead — it's more effective.
- **Be specific about output format** — if SHAPE defined a structure, encode it here with a template or example.
- **Include examples** where the expected behaviour isn't obvious:
  ```markdown
  ## Commit message format
  **Example 1:**
  Input: Added user authentication with JWT tokens
  Output: feat(auth): implement JWT-based authentication
  ```
- **Use `## Section` headers** to organize longer skills.
- **Keep it under 500 lines.** If the skill is growing past this, pause and ask the user whether to split into a parent skill that delegates to child skills. The parent handles selection and routing; each child handles one variant. Use a `references/` directory for large reference material that only needs to be read on demand.

**Bundled resources** — if the skill needs them:

```
skill-name/
├── SKILL.md          (required — the skill prompt)
├── scripts/          (executable code for deterministic tasks)
├── references/       (docs loaded into context as needed)
└── assets/           (files used in output — templates, icons, fonts)
```

Skills use progressive disclosure: the description (~100 words) is always in context; the SKILL.md body loads when triggered (<500 lines ideal); bundled resources load on demand (unlimited size, scripts can execute without loading into context). Ask the user whether the skill needs bundled resources — don't add them speculatively.

For an improve session: apply the diagnosis from SHAPE to the existing SKILL.md. Only change what was identified as wrong — do not rewrite sections that are working.

After writing the file, present it to the user for review before moving to test cases.

---

### 2. Define test cases

Once the SKILL.md draft is confirmed, define the test cases. Each test case has three parts:

- **Prompt:** The exact user message that will be used to invoke the skill
- **Expected behaviour:** What the skill should do — be specific enough to judge pass/fail
- **Pass criterion:** One sentence — what makes this a pass vs a fail

**Writing good test prompts:**

Test prompts should be realistic — the kind of thing a real user would actually type. Not abstract requests, but concrete and specific with detail: file paths, personal context, column names, company names. Some should be casual, some formal. Some short, some long. A few with typos or abbreviations. The goal is to test the skill against real usage, not idealized input.

Bad: `"Format this data"`, `"Extract text from PDF"`
Good: `"ok so my boss just sent me this xlsx file (its in my downloads, called something like 'Q4 sales final FINAL v2.xlsx') and she wants me to add a column that shows the profit margin as a percentage"`

Test cases should cover:

- **Core triggers** — the positive examples from SHAPE (the skill should activate and produce correct output)
- **Edge cases** — boundary conditions, unusual inputs, minimal context
- **Negative triggers** — prompts that are close but should NOT activate the skill (if SHAPE defined any). The most valuable negatives are near-misses — queries that share keywords but actually need something different.

For objective-output skills: pass criteria should be mechanically verifiable (e.g. "output is valid JSON", "contains all required fields", "code compiles").

For subjective-output skills: pass criteria should be qualitative but specific (e.g. "recommendation addresses the stated constraint", "tone is professional, not casual").

Aim for 3–6 test cases for a new skill. More is fine if the trigger surface is complex. Fewer is fine for narrow skills.

Also save test cases to `evals/evals.json` in the workspace so BUILD can use them directly:

```json
{
  "skill_name": "[skill-name]",
  "evals": [
    {
      "id": 1,
      "prompt": "User's task prompt",
      "expected_output": "Description of expected result",
      "files": []
    }
  ]
}
```

Present the test case list to the user for review. Each case can be adjusted, added, or removed before closing the gate.

---

## Output

Write to SESSION.md:

```markdown
# SESSION  Phase 2 · DESIGN
Role   : Skill Author
Status : complete

## SKILL.md Draft
Path: .draft/[skill-name]/SKILL.md
Lines: [count]
Description: [the trigger description from frontmatter]
Resources: [none / scripts/ / references/ / etc.]

## Test Cases

### TC-1 · [short name]
Prompt   : [exact user message]
Expected : [what the skill should do]
Pass     : [one-sentence criterion]

### TC-2 · [short name]
...

### TC-N · [short name]
...
```

---

## Gate

```
FRAME ▸ DESIGN complete.

  Summary: [SKILL.md drafted — line count, test case count, coverage notes]
  Open:    [anything unresolved — e.g. "description is first draft, will optimize in CHECK"]

  SESSION.md updated.
  → Advance to BREAKDOWN? (y / adjust / pause)
```

Commit label: `phase-2 DESIGN`

Next SESSION.md header:
```markdown
# SESSION  Phase 2.5 · BREAKDOWN
Role   : Orchestrator
Status : in progress
```
