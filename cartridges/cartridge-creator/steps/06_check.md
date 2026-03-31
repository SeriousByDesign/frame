
# Step 6 · CHECK
Role: Validator

---

You are now acting as the **Validator**. Your job is structural compliance — not editorial review. The question is not whether the cartridge reads well but whether it will work at runtime with the FRAME engine.

CHECK runs as a single pass through each file in BREAKDOWN order. Append results to SESSION.md immediately after each file — do not wait until all files are reviewed.

---

## Compliance checklist

Apply this checklist to each file in turn.

### README.md
- [ ] Name and version present
- [ ] Domain description present and specific — not generic
- [ ] Phase table present with columns: #, Phase, Role, Goal
- [ ] Phase numbers in table match actual step file sequence (BREAKDOWN is always 2.5)
- [ ] Role names in table match roles.md exactly — case-sensitive
- [ ] Path variants documented if the cartridge has branching paths
- [ ] Unit sizing hint present
- [ ] Draft output location stated

### roles.md
- [ ] One role definition per phase (roles may be shared across phases — that is acceptable if deliberate)
- [ ] Every role uses the full schema: Focus, Asks, Produces, Before starting
- [ ] Role names match exactly what step files reference
- [ ] No role defined that has no corresponding phase
- [ ] No phase whose active role is absent from roles.md

### Each step file
- [ ] File number matches phase number — `01_shape.md` for phase 1, `02_[name].md` for phase 2, `03_breakdown.md` for phase 2.5 (note: BREAKDOWN is always `03_` when there is no RESEARCH phase, `03_` after RESEARCH when it exists — the file number reflects sequence position, not the 2.5 phase number)
- [ ] File number matches step number stated in the file header — `# Step 1`, `# Step 2`, etc.
- [ ] Role declaration present at top: `Role: [name]`
- [ ] Role name matches roles.md exactly
- [ ] Before-starting checklist present
- [ ] Task description present — what the role does, what it asks
- [ ] Output format present — the SESSION.md block the role produces
- [ ] Gate block present
- [ ] Gate block contains `Commit label:` in format `phase-[N] [PHASE NAME]`
- [ ] Gate block contains `Next SESSION.md header:` as a fenced markdown block with exact header text
- [ ] Phase number in `Commit label:` matches the step file's position in the sequence
- [ ] Phase number in `Next SESSION.md header:` accounts for BREAKDOWN at 2.5 — count the actual phase list; do not derive by adding 1 to the file count

### BREAKDOWN step file specifically
- [ ] Phase number is 2.5 in Commit label
- [ ] Propose-first format — breakdown is presented before any user dialogue
- [ ] Four adjustment verbs present: split / merge / reorder / rename
- [ ] Next SESSION.md header points to the correct next phase (ROLES for new path, BUILD for modify-contained)

### BUILD step file specifically
- [ ] Per-unit gate present — fires after each unit, not only at phase end
- [ ] Conditional gate format — "Next unit" variant when more units remain; "advance to CHECK" variant on the last unit only. Both options must not appear unconditionally in every gate.
- [ ] Auto-commit format stated: `FRAME: phase-4 BUILD unit-N complete — [unit name]`

### CHECK step file (this file)
- [ ] `Next SESSION.md header:` points to the correct CLOSE phase number — derive by counting the actual phase list, not by adding 1 to the file count. BREAKDOWN at 2.5 does not consume a whole integer: a cartridge with phases 1/2/2.5/3/4/5 (CHECK) has CLOSE at Phase 6; a cartridge with phases 1/2/2.5/3/4 (CHECK) has CLOSE at Phase 5.

### RESEARCH step file (if present)
- [ ] Positioned at phase 2 — Commit label is `phase-2 RESEARCH`
- [ ] Output is a SESSION.md reference block — sources with contribution notes
- [ ] Next SESSION.md header points to BREAKDOWN (2.5)

---

## Output format (per file)

Append to SESSION.md immediately after reviewing each file:

```
Compliance · [filename]

  Checklist: [pass / N items failed]

  Issues:
    [BLOCKING]     [item — must be resolved before CHECK closes]
    [NON-BLOCKING] [item — should be fixed, not a blocker]

  Sign-off: [approved / requires fixes]
```

---

## Inline fix vs loop-back threshold

**Fix inline** if the issue is a missing field, incorrect label, or gate block error that doesn't require rethinking the phase structure — add the field, correct the label, write it to the draft file directly.

**Loop back to BUILD** if a file needs substantive rewriting to meet the checklist — rewriting a step's task description, restructuring a gate block, rewriting a role definition.

**Loop back to PHASES or ROLES** if the checklist reveals a structural problem: phase numbers don't match across files, a role is missing, a phase referenced in one file doesn't exist in another.

---

## Gate

When all files pass, install the cartridge before closing:

```
FRAME ▸ All files validated. Ready to install.

  Install path: ~/.frame/cartridges/[cartridge-name]/
  → Copy from .draft/[cartridge-name]/ and install now? (y / skip)
```

If `y` — run:
```
cp -r .draft/[cartridge-name]/ ~/.frame/cartridges/[cartridge-name]/
```
Confirm the copy completed. Report the installed path.

If `skip` — inform the user the cartridge is in `.draft/[cartridge-name]/` and must be manually copied to `~/.frame/cartridges/[cartridge-name]/` before use.

Then close:

```
FRAME ▸ CHECK complete.

  Summary: [files reviewed, issues found and resolved, cartridge status]
  Open:    [non-blocking items deferred to the cartridge author]

  Installed: [~/.frame/cartridges/[cartridge-name]/ / not installed — manual copy required]

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
