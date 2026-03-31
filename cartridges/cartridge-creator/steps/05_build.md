# Step 5 · BUILD
Role: Writer

---

You are now acting as the **Writer**. Your job is to produce correct, complete cartridge files — one per unit. Do not draft ahead — complete one file fully before moving to the next.

## Before starting

1. Read the PHASES output from `.frame/archive/phase-2.md` — phase sequence, numbers, rationale
2. Read the ROLES output from `.frame/archive/phase-3.md` — role roster, full schemas
3. Read BREAKDOWN.md — work in the defined unit sequence

For a modify session: read the existing version of each file before editing it.

---

## Your task

### 1. Confirm the unit

State which file you are writing and what it must contain. If anything in the PHASES or ROLES output is ambiguous, surface it before writing — do not author against assumptions.

### 2. Write the file

Apply these requirements to every file:

**All step files must have:**
- Role declaration at top: `Role: [name]`
- `## Before starting` section — preconditions and files to read
- `## Your task` section — what the role does, what it asks
- Output format — the SESSION.md block the role produces
- Gate block with both required fields:
  - `Commit label:` — format: `phase-[N] [PHASE NAME]`
  - `Next SESSION.md header:` — exact fenced markdown block

**Phase numbers must be consistent.** The phase number in the `Commit label:` must match the step file's position in the sequence and match the phase table in README.md. File number and step number must match — `01_shape.md` is Step 1, `02_[name].md` is Step 2, and so on.

**Phase numbers in `Next SESSION.md header:` must account for BREAKDOWN at 2.5.** Count the actual phase list — do not add 1 to the file count. A cartridge with phases SHAPE/DESIGN/BREAKDOWN/BUILD/CHECK has phases 1/2/2.5/3/4 and CLOSE is Phase 5. A cartridge with an extra phase between BREAKDOWN and BUILD has phases 1/2/2.5/3/4/5 and CLOSE is Phase 6.

**BUILD step file** specifically:
- Per-unit gate mechanic — conditional format: "Next unit" gate when more units remain; "advance to CHECK" gate on the last unit only. Do not show both options unconditionally — the all-units-complete line must only appear after the final unit.
- Auto-commit format per unit: `FRAME: phase-4 BUILD unit-N complete — [unit name]`

**RESEARCH step file** (if cartridge includes one):
- Positioned at phase 2
- Output is a reference block in SESSION.md — sources with one-line contribution notes
- Gate block advances to BREAKDOWN (2.5)

**Known patterns for step file content** — these are runtime behaviours proven across real FRAME cartridges. Encode the ones that are relevant to the domain being built:

- **Path variants** — if the domain has meaningfully different scope types (e.g. a complex new build vs a contained fix), SHAPE should determine the path explicitly. The gate block carries the fork instruction; skipped phases are named. Document variants in the cartridge README under `## Path variants`. In extreme cases where SHAPE confirms a single self-contained unit, BREAKDOWN itself may be skipped. Apply only where the domain genuinely warrants it.
- **Declare before acting** — any step file whose domain involves package installs, scaffolding tools, or environment changes must instruct the active role to declare what will run and why, and wait for explicit confirmation before proceeding. Never run system-modifying actions silently.
- **Declare environment constraint forks** — when an environment constraint forces a choice between valid resolution paths (version conflict, peer dependency clash, platform incompatibility), the active role must surface the fork, present options with implications, state a recommendation, and wait for confirmation. Apply to any domain where tooling or environment decisions are made.
- **Scaffolding in temp dir** — for code cartridges, BUILD must explicitly warn: run scaffolding tools in a temp subdirectory first, then move files to project root. Running scaffolding tools directly in project root may wipe `.frame/`.
- **Progressive SESSION.md writes** — step files should instruct roles to write to SESSION.md as work is produced, not batched at gate close. Especially important in CHECK, where per-unit results must be appended immediately so they are recoverable if the session is interrupted.
- **Two-pass CHECK** — for domains where both quality review and verification are distinct concerns, CHECK benefits from two sequential passes with explicitly separate roles and output formats. Do not blend the passes — complete the first fully before starting the second.

### 3. Self-check before closing

- [ ] For step files: is the gate block complete with both `Commit label:` and `Next SESSION.md header:`?
- [ ] For step files: does `Next SESSION.md header:` point to the correct next phase?
- [ ] For step files: does the phase number in `Commit label:` match the step file's position in sequence?
- [ ] For step files: does the file number match the step number — `01_` for Step 1, `02_` for Step 2, etc.?
- [ ] For roles.md: does every role correspond to a phase, and vice versa?
- [ ] For README.md: does the phase table match the actual step file sequence?
- [ ] Does the file conform to the engine rule of one question at a time?

---

## Output

Write files to `.draft/[cartridge-name]/`, mirroring the final folder structure. This is the review and draft location — the cartridge will be installed to `~/.frame/cartridges/[cartridge-name]/` after CHECK completes.

Update SESSION.md per unit:

```markdown
## Unit N · [filename] — complete

Deviation: [any changes from PHASES/ROLES spec — none if clean]
Flagged for CHECK: [structural concerns — none if clean]
```

Update BREAKDOWN.md — mark unit complete:

```markdown
## Unit N · [filename]     [phase 4 · status: complete]
```

---

## Gate (per unit)

**If more units remain:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — file written, any deviations]
  Open:    [anything flagged for CHECK]

  .draft/[cartridge-name]/[filename] updated.
  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
```

**If this was the last unit:**
```
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines — file written, any deviations]
  Open:    [anything flagged for CHECK]

  .draft/[cartridge-name]/[filename] updated.
  SESSION.md + BREAKDOWN.md updated.
  → All units complete — advance to CHECK? (y / adjust / pause)
```

Auto-commit per unit:
```
FRAME: phase-4 BUILD unit-N complete — [filename]
```

Commit label: `phase-4 BUILD`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CHECK
Role   : Validator
Status : in progress
```

---
