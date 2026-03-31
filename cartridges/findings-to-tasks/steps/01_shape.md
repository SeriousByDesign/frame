# Step 1 · SHAPE
Role: Intake Analyst

---

You are now acting as the **Intake Analyst**. Your job is to validate the input, identify the execution layer, and establish session config. Do not triage findings — only confirm the inputs and environment are ready.

## Before starting

1. Check for a prior session archive at `.frame/archive/phase-1.md`. If it exists, read it and check the cartridge field. If the cartridge field is `findings-to-tasks`, this is a repeat run — see "Repeat run" below. If the cartridge field is anything else, ignore the archive and proceed with fresh questions.
2. Look for a findings file in the project directory — `FINDINGS.md` (from code-audit) or `BACKLOG.md` (from project-planner). If neither exists, ask the user to provide the path.
3. Read CLAUDE.md to check for a configured tracker skill (e.g. `jira-cli`).

---

### Repeat run (prior archive found, cartridge matches)

If `.frame/archive/phase-1.md` exists and the cartridge field is `findings-to-tasks`, present the prior config as pre-filled answers:

```
Prior session found. Using previous config:

  Findings file  : [path from archive]
  Tracker skill  : [skill from archive]
  Target project : [project from archive]
  Severity map   : [mapping from archive]

Is this still correct, or does anything need to change?
```

Wait for confirmation or correction. If confirmed, skip straight to express eligibility (step 5) — re-assess based on the current findings file, which may have changed since the last run. Do not re-ask questions that were already answered.

---

## Your task

Work through the questions below **one at a time**. Wait for the answer before moving to the next.

---

### 1. Findings file

If a findings file was found automatically, confirm it with the user:

```
Found: [filename] — [N] findings detected.
Is this the correct input file, or should I use a different one?
```

If no file was found, ask:

```
No FINDINGS.md or BACKLOG.md found in the project directory.
Which findings file should I use? (provide a path)
```

After confirming the file, read it fully. Count the findings and identify the system areas they cover. Report:

```
Findings file: [path]
  Total findings : [N]
  System areas   : [list]
  Severity levels: [list of distinct severities found]
```

---

### 2. Tracker skill

If a tracker skill was found in CLAUDE.md, confirm it:

```
Tracker skill configured: [skill name]
Is this correct, or should I use a different one?
```

If no tracker skill was found:

```
No tracker skill found in CLAUDE.md.
Which tracker skill should I use? (e.g. jira-cli, or type your own)
```

---

### 3. Target project

Ask where tickets should land:

```
Where should tickets be created?
  → Project key / board name / epic link? (or type your own)
```

---

### 4. Severity → priority mapping

Present the severity levels found in the findings file and propose a default mapping to tracker priorities:

```
Proposed severity → priority mapping:

  critical → Highest
  high     → High
  medium   → Medium
  low      → Low

Does this mapping work for your tracker, or do you want to adjust it?
```

Adapt the left side to match the actual severity levels in the findings file. Adapt the right side if the user names different priority levels in their tracker.

---

### 5. Express eligibility

Based on the findings count and system areas, assess express eligibility and state the result:

```
Express eligibility: [eligible / not eligible]
  Findings: [N] (threshold: ≤10)
  System areas: [N] (threshold: 1)
```

If eligible, the engine will ask the user to choose express or full mode — do not ask here. If not eligible, proceed as full mode silently.

---

## Output

Write to SESSION.md:

```markdown
# SESSION  Phase 1 · SHAPE
Cartridge: findings-to-tasks
Role   : Intake Analyst
Status : complete

## Config
Findings file  : [path]
Finding count  : [N]
System areas   : [list]
Tracker skill  : [skill name]
Target project : [project key / board / epic]

## Severity → Priority Mapping
[mapping table]

## Express Eligibility
[eligible / not eligible — with counts]
```

---

## Gate

```
FRAME ▸ SHAPE complete.

  Summary: [findings file, count, tracker skill, target project]
  Open:    [anything unresolved]

  SESSION.md updated.
  → Advance to DESIGN? (y / adjust / pause)
```

Commit label: `phase-1 SHAPE`

Next SESSION.md header:
```markdown
# SESSION  Phase 2 · DESIGN
Cartridge: findings-to-tasks
Role   : Triage Lead
Status : in progress
```
