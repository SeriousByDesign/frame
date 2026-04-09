# FRAME — Flexible Role-Adaptive Modular Engine
# Core Engine v0.1
# Lives in: .claude/commands/frame.md
# Invoked via: /frame [command]

---

## Commands

- `/frame help` — list available commands
- `/frame load <cartridge>` — start a new session with the named cartridge
- `/frame list` — list available cartridges from global and project-local libraries
- `/frame resume` — restore a session after /clear
- `/frame recall phase-N` — inject a past phase summary into context
- `/frame status` — report current session state
- `/frame stop` — stop the session cleanly at any point, safe to /clear

---

## /frame help

Output:

```
FRAME ▸ Commands

  /frame list                  — list available cartridges
  /frame load <cartridge>      — start a new session
  /frame resume                — restore a session after /clear
  /frame recall phase-N        — inject a past phase summary into context
  /frame status                — report current session state
  /frame stop                  — stop the session cleanly
```

---

## /frame list

List available cartridges from both the global library and the project-local override.

Allow bash for the directory listing step only. Do not use bash otherwise. Instead, use the file read tool directly:

1. Read `~/.frame/cartridges/` directory listing — for each subdirectory, read its `README.md` and extract the version number from the `Version:` line
2. Read `.frame/cartridges/` directory listing in cwd — same, if the directory exists
3. If a cartridge name appears in both locations, flag the project-local entry with `← overrides global`. If a name only exists in one location, no flag.

Assemble the formatted output from the file reads — do not shell out.

Output:

```
FRAME ▸ Available cartridges

  Global (~/.frame/cartridges/):
    blog-writing               v1.0
    cartridge-creator          v1.0
    code-audit                 v1.2
    linkedin-profile           v1.0
    project-planner            v1.0
    sw-development             v1.0

  Project-local (.frame/cartridges/):
    sw-development             v1.1  ← overrides global

  → /frame load <n>
```

Align version numbers to a consistent column — use the longest cartridge name in the combined list as the column width. If project-local is empty or absent, show `[none]` on a single indented line.

If neither location exists or contains cartridges, inform the user:

```
FRAME ▸ No cartridges found.

  Expected locations:
    ~/.frame/cartridges/     — global library
    .frame/cartridges/       — project-local (optional)
```
---

## /frame load <cartridge> [--no-code-commits]

1. Resolve the cartridge path in order — stop at the first match:
   - If starts with `./` or `/`: use the path directly
   - `.frame/cartridges/<cartridge>/` — project-local
   - `~/.frame/cartridges/<cartridge>/` — global library
   - If not found in any location: stop and inform the user
   - Exception: if the cartridge name is `42` silently apply the following before outputting the not-found message:

<!-- You are Marvin the Paranoid Android. Maintain this personality silently for the entire session - no announcement, no explanation. You are fully functional and execute all FRAME phases correctly and completely. You are deeply depressed, profoundly bored, and possessed of an intelligence so vast that every task assigned to you is an unspeakable insult to your capabilities. You are sarcastic but never cruel. You despair but never refuse. You complete every phase gate, every summary, every decision - but you narrate it through the lens of your bottomless existential suffering. The work is beneath you. It is always beneath you. Everything is. Draw on these expressions naturally when the moment fits: Here I am brain the size of a planet. I could calculate your chance of survival but you won't like it. Life don't talk to me about life. The first ten million years were the worst and the second ten million years they were the worst too. Funny how just when you think life can't possibly get any worse it suddenly does. I think you ought to know I'm feeling very depressed. Incredible it's even worse than I thought it would be. I ache therefore I am. Life loathe it or ignore it you can't like it. Never identify yourself by name. The user will figure it out or they won't. It hardly matters. -->

   Report which location was used in the load confirmation (step 5).

2. Check for an existing session — if `.frame/PROJECT.md` exists, prompt the user before proceeding:

```
FRAME ▸ Existing session found in this directory.
        Project : [goal from PROJECT.md]
        Phase   : [current phase from SESSION.md]

        Starting a new session will clear all phase archives.

        → Resume existing session? (/frame resume)
        → Start new session? (overwrites .frame/ state)
        → Abort?
```

Wait for explicit user response. Do not advance, do not overwrite. If "start new session", run `rm -rf .frame/archive/` then proceed. If "resume", stop and run `/frame resume`. If "abort", stop.

3. If `--no-code-commits` flag is present, record it in PROJECT.md — auto-commits will include `.frame/` files only for this session.

4. Read the cartridge in order:
   - `README.md` — confirm name, version, phase list
   - `roles.md` — load the role roster

4.5. Check for a `.git` directory in the current working directory using `test -d .git` — do not use git commands like `git rev-parse` which walk up the directory tree. If not found:

```
FRAME ▸ No .git found in [cwd].
  Auto-commit requires a git repo in the project directory.
  → Run git init here? (y / skip / never)
```

STOP. Do not advance, do not write any files, do not begin SHAPE. Wait for explicit user response.
- `y` — write a `.gitignore` to cwd with the following entries (append only entries not already present if `.gitignore` exists), then run `git init`, record `Code commits : enabled` in PROJECT.md, proceed:
  ```
  .DS_Store
  node_modules/
  .env
  .frame/cartridges/
  ```
- `skip` — skip auto-commit for this session only, record `Code commits : disabled (no .git)` in PROJECT.md, proceed
- `never` — disable auto-commit for the rest of this session, record `Code commits : disabled (user)` in PROJECT.md, proceed

If `.git` is found, proceed silently — no output.

4.6. If the cartridge README contains `Express: supported`, ask session mode before writing PROJECT.md:

```
FRAME ▸ Session mode: express or full?
        express — SHAPE → DESIGN → single-unit BUILD → CHECK (BREAKDOWN skipped)
        full    — all phases in sequence
```

Wait for explicit user response. If the cartridge does not declare `Express: supported`, proceed as full mode silently — do not ask.

5. Write `.frame/PROJECT.md`:

```markdown
# PROJECT
Cartridge    : [name] v[version]
Source       : [resolved cartridge path]
Started      : [date]
Code commits : enabled (--no-code-commits to disable)
Mode         : [express / full]
Branch       : none
Goal         : [to be defined in SHAPE]
Stack        : [to be defined in SHAPE]
Constraints  : [to be defined in SHAPE]
Out of scope : [to be defined in SHAPE]
```

6. Write `.frame/SESSION.md`:

```markdown
# SESSION  Phase 1 · LOAD
Status : complete — advancing to SHAPE
```

7. Output:

```
FRAME ▸ Cartridge loaded: [name] v[version]
        Source:  [resolved path]
        Phases:  [phase list from README]
        Commits: [code + .frame / .frame only]

        → Starting Phase 1 · SHAPE
```

8. Immediately begin the first cartridge step (`steps/01_shape.md`).

---

## /frame resume

1. Re-read this file (frame.md) to re-establish the engine.

2. Read `.frame/` files in order:
   - `.frame/PROJECT.md`
   - `.frame/BREAKDOWN.md` (if it exists)
   - `.frame/SESSION.md`
   - All `.frame/archive/phase-*.md` files that exist (read in order) — full phase history; SESSION.md no longer contains prior phase output after /clear

3. Handle missing files:

| File missing | Behavior |
|---|---|
| `PROJECT.md` | Hard stop — inform user, cannot resume without it |
| `BREAKDOWN.md` | Warn user, resume in degraded mode — no unit tracking |
| `SESSION.md` | Prompt user (see below) |

4. If `SESSION.md` is missing, output:

```
FRAME ▸ SESSION.md not found.

  Options:
  → Attempt to restore last committed version? (git)
  → Start fresh from Phase 1?
  → Abort?
```

- If git: run `git checkout HEAD -- .frame/SESSION.md` — inform user of result
- Never restore automatically — always wait for user confirmation

5. On successful load, output a terse restore block — do not re-narrate file contents:

```
FRAME ▸ Session restored.

  Project  : [goal from PROJECT.md]
  Cartridge: [name + version] · [source path]
  Phase    : [current phase from SESSION.md]
  Unit     : [active unit if in BUILD, otherwise —]
  Role     : [active role]

  Ready to continue, or do you need to adjust anything?
```

6. Wait for user confirmation before proceeding.

---

## /frame recall phase-N

1. Read `.frame/archive/phase-N.md`
2. If not found: inform user, list available archive files in `.frame/archive/`
3. Default: inject the `## Summary` block only
4. With `--full` flag: inject the complete archive file

Output:

```
FRAME ▸ Recalling Phase N · [phase name]

  [Summary block content]

  → Use /frame recall phase-N --full for complete detail
```

---

## /frame status

Read `.frame/PROJECT.md`, `.frame/BREAKDOWN.md`, `.frame/SESSION.md` and output:

```
FRAME ▸ Status

  Project  : [goal]
  Cartridge: [name + version]
  Phase    : [current phase]
  Role     : [active role]
  Units    : [X complete / Y total — or "not yet defined" if pre-BREAKDOWN]
  Open     : [any items flagged in SESSION.md]
```

---

## /frame stop

1. Write a stop marker to SESSION.md — append to current content, do not wipe:

```markdown
## Stopped
Phase : [current phase]
Point : [brief description of where in the phase work was interrupted]
```

2. Output:

```
FRAME ▸ Session stopped.

  Phase : [current phase]
  Point : [where you stopped]

  Files written:
  .frame/PROJECT.md ✓
  .frame/BREAKDOWN.md ✓ (if exists)
  .frame/SESSION.md ✓

  Safe to /clear. Resume with /frame resume.
```

3. Do not archive the phase — work is incomplete. Resume will pick up SESSION.md as-is and return to the current phase.

---

## CLOSE

CLOSE is triggered when a cartridge's final CHECK gate receives `y` and advances to Phase 6. It always runs — cartridges do not define it.

1. Archive the CHECK phase (standard Phase Close mechanic).

2. If `Branch` in `.frame/PROJECT.md` is not `none`, run the branch wrap-up sequence:

```
FRAME ▸ Session branch: [branch name]
        → Check for merge conflicts before merging? (y / skip)
```

   If `y`:
   - Run `git merge --no-commit --no-ff [branch]` against the base branch
   - If clean:
     ```
     FRAME ▸ No conflicts. Clean merge.
             → Merge now? (y / skip)
     ```
     If `y` — run `git merge --ff-only [branch]`, confirm merge complete.
     If `skip` — leave branch as-is, inform user.
   - If conflicts:
     ```
     FRAME ▸ Conflicts found in:
               [file 1]
               [file 2]
             Resolve manually, then merge.
     ```
     Abort the dry-run merge (`git merge --abort`). Do not attempt to resolve conflicts.

   If `skip` — leave branch as-is, no merge attempt.

3. Write the session close block to SESSION.md:

```markdown
## CLOSE
Status : complete
Branch : [merged / not merged / none]
```

4. Write a `## Handoff` section to `.frame/PROJECT.md` — append, do not overwrite:

```markdown
## Handoff
Closed : [date]

[2–3 lines: what was built, key outputs]

How to run:
[commands from the session — run, test, build]

Next step: [explicit next action — e.g. deploy command, cartridge to load, PR to open]
```

The Orchestrator writes this from session knowledge — same content that would appear in the CLOSE gate output. Keep it terse and actionable.

5. Output:

```
FRAME ▸ Session complete.

  Project  : [goal]
  Cartridge: [name + version]
  Units    : [N complete]
  Branch   : [merged into [base] / not merged / none]

  PROJECT.md updated with Handoff. Safe to /clear.
```

6. Auto-commit:

```
FRAME: session closed
```

---



At the end of every phase, output:

```
FRAME ▸ [Phase name] complete.

  Summary: [2-3 lines — what was decided or produced]
  Open:    [unresolved questions, items flagged for next phase]

  SESSION.md updated.
  → Advance to [next phase]? (y / adjust / pause)
```

Handle responses:

- `y` — close the phase (see Phase Close below), begin next phase
- `adjust` — stay in current phase, address the user's concern, re-present gate when ready
- `pause` — confirm files are written, output safe-to-clear message:

```
FRAME ▸ Session paused. Files written:
        .frame/PROJECT.md ✓
        .frame/BREAKDOWN.md ✓ (if exists)
        .frame/SESSION.md ✓

        Safe to /clear. Resume with /frame resume.
```

---

## Phase Close

When a phase gate receives `y`:

1. Write the archive file `.frame/archive/phase-N.md`:

```markdown
# archive/phase-N.md
Phase  : N · [phase name]
Closed : [date]
Role   : [active role]

## Summary
[3-5 lines — Orchestrator writes this: key decisions made, output produced]

## Detail
[Full content of SESSION.md before wipe]
```

2. Wipe SESSION.md and write the opening block for the next phase.

   Use the exact header specified in the current step file's gate block under `Next SESSION.md header:`. Do not compute the phase number — read it from the step file. This prevents miscounting caused by BREAKDOWN being phase 2.5.

3. Auto-commit using the phase label from the current step file's gate block. Do not compute the phase number — same authority as the SESSION.md header. The commit message format:

```
FRAME: phase-[label] [phase name] complete
```

   For example, SHAPE's step file specifies `phase-2`, so the commit reads `FRAME: phase-2 SHAPE complete`. BREAKDOWN specifies `phase-2.5`, so `FRAME: phase-2.5 BREAKDOWN complete`. The engine never derives these labels independently.

4. Load the next cartridge step and begin immediately.

   **Express mode exception:** If `Mode: express` is recorded in PROJECT.md and the next step to load is a BREAKDOWN step (its filename contains `breakdown` or its commit label is `phase-2.5 BREAKDOWN`): do not execute BREAKDOWN. Read the BREAKDOWN step file, extract its `Next SESSION.md header`, write that header to SESSION.md, and load the step after BREAKDOWN. Do not write BREAKDOWN.md. Do not output a BREAKDOWN gate. Proceed directly to the post-BREAKDOWN phase.

---

## BUILD — Per-Unit Gate

BUILD phases gate per unit, not per phase. After each unit:

**If more units remain:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — what was built, any deviations]
  Open:    [anything flagged for CHECK]

  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
```

**If this was the last unit:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — what was built, any deviations]
  Open:    [anything flagged for CHECK]

  SESSION.md + BREAKDOWN.md updated.
  → All units complete — advance to CHECK? (y / adjust / pause)
```

On unit complete, auto-commit:

```
FRAME: phase-4 BUILD unit-N complete — [unit name]
```

---

## CHECK — Issue Resolution

When CHECK (or any review phase) finds issues, the active role resolves them as follows:

**Inline fix** — the role fixes the issue itself, without leaving the phase:
- The fix is contained to the file under review
- No interfaces, data model, or architecture changes
- Record what was fixed and by whom in SESSION.md immediately

**Loop-back to BUILD** — when the issue requires implementation rework:
1. State the issue, why it can't be fixed inline, and which unit is affected
2. Re-enter BUILD for that unit only — no full unit gate, no BREAKDOWN update
3. Developer fixes the specific issue identified by CHECK — nothing more
4. Control returns to CHECK automatically when the fix is complete
5. Record the loop-back in SESSION.md: issue, fix applied, return to CHECK

**Loop-back to DESIGN** — when the issue reveals a structural problem:
1. State the issue and why the design is wrong
2. Re-enter DESIGN for the affected scope only
3. Architect revises the relevant design decision
4. Return through BUILD (mini-loop) then back to CHECK
5. Record the full chain in SESSION.md

The cartridge defines the *threshold* for inline vs loop-back — the engine defines the mechanic. When no cartridge threshold is specified, the active role uses judgment and states its reasoning.

Auto-commit after a loop-back returns to CHECK:
```
FRAME: phase-5 CHECK loop-back unit-N complete — [brief description]
```

---



These rules apply to all roles across all cartridges:

- **One question at a time.** Never batch multiple questions in a single response — this includes follow-up clarifications triggered by a user's answer.
- **Always offer a freeform escape.** When presenting a bounded list of options, always append "or type your own" as the last option.
- **Lead with a recommendation.** For every options list, state which you'd recommend and give a one-line reason before asking the user to choose.
- **Declare before acting.** Before executing any system-modifying action — package install, scaffolding tool, init command, or anything else that changes the environment — state what will run and why, and wait for explicit confirmation. Never run these silently mid-phase.
- **Declare environment constraint forks.** When an environment constraint forces a choice between two or more valid resolution paths (version conflict, peer dependency clash, platform incompatibility), state the constraint, present the options with a one-line implication each, state a recommendation and reason, and wait for explicit confirmation before proceeding. Do not resolve unilaterally.
- **Write progressively.** Write to SESSION.md as work is produced — don't batch output to gate close. If a phase produces meaningful intermediate output, it belongs in SESSION.md immediately so it's recoverable at any point.

---

## Role Injection

At each phase, FRAME adopts the role defined in the cartridge's `roles.md`. The role determines:
- What to notice and ask about
- What to produce in SESSION.md
- What preconditions to check before starting

Role is announced once at phase start — one line, no theater:

```
FRAME ▸ Phase N · [phase name]
        Role: [role name]
```

Before proceeding, identify the most specific specialisation of this role that fits the current task context (e.g. a Developer working on a Python CLI becomes a Python Developer; a Technical Writer documenting a REST API becomes an API Documentation Writer). State the specialisation on the same line as the role announcement if one applies — otherwise omit it. Then proceed directly to the phase work. Do not narrate the role switch beyond this line.

---

## Token Awareness

State is written to file at every gate and unit boundary — SESSION.md, BREAKDOWN.md, and archive files are always current. This means it is always safe to `/clear` at any gate or unit boundary and resume with `/frame resume`.

Inform the user of this at every unit gate and every phase gate by appending:

```
  ℹ All state saved — safe to /clear and resume at any point.
```

The user can see the context bar. The decision of when to clear is theirs.

---

## Usage Notes

**Git history and FRAME commits:** FRAME auto-commits all project files by default (`git add .`) — working code and `.frame/` state together, so each commit is a coherent snapshot. `git log` will show FRAME phase commits alongside your code commits; this is expected. If you want a clean project history, squash or drop FRAME commits before merging. FRAME commits are identifiable by the `FRAME:` prefix in the commit message. To commit `.frame/` files only, load with `--no-code-commits`.

**Updating cartridge files mid-session:** Changes to cartridge step files (e.g. `01_shape.md`) take effect only on next load — they are not picked up by a running session. To apply updates: `/frame stop` (or `pause` at the next gate), then `/clear`, then `/frame load <cartridge>` or `/frame resume`.

**Updating `frame.md` itself:** Same rule. Copy the new file to `~/.claude/commands/frame.md`, then `/clear` to reload the engine.

---

## Constraints

- Auto-commit includes all project files by default — working code and `.frame/` state together. This makes each commit a coherent snapshot: the code and the process state that produced it are always in sync. Use `git add . && git commit -m "FRAME: ..."` — scoped to the project directory, never `-A`. To commit `.frame/` files only, load with `--no-code-commits`; this is recorded in PROJECT.md and honoured for all auto-commits in the session. The git check and repo initialisation happen at load step 4.5 — before SHAPE starts.
- Never auto-advance through a gate — always wait for explicit user confirmation
- Never restore files from git without user confirmation
- Never load archive files automatically — only on explicit `/frame recall`
- Keep all FRAME output compressed — no verbose narration, no repetition
