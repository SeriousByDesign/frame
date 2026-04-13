# Cartridge Authoring

How to build a FRAME cartridge — structure, requirements, patterns, and conventions.

---

## The fast path

Run `/frame load cartridge-creator`. It guides you through domain analysis, phase design, role definition, file authorship, and compliance validation — producing a ready-to-install cartridge. Read this document first to understand what the cartridge-creator is building.

---

## Adapting an existing cartridge

If an existing cartridge is close to what you need, don't run cartridge-creator — copy and adapt. The engine integration points stay identical; only the domain-specific content changes.

**When to adapt vs build from scratch:** adapt when the phase structure is the same and you're adjusting roles and step instructions for a specific context. Build from scratch when the phase structure itself is different.

**Example: tailoring `sw-development` for a web project**

```bash
cp -r ~/.frame/cartridges/sw-development/ ~/.frame/cartridges/web-development/
```

Then edit:

- `README.md` — update name, version, and domain description
- `roles.md` — specialise roles (e.g. Architect → Frontend Architect / Backend Architect; Developer → split by layer if needed)
- `steps/03_design.md` — add web-specific architecture questions (routing, state management, API contract)
- `steps/04_build.md` — add web-specific build instructions (component structure, CSS approach, bundler config)

Leave untouched:
- Phase sequence and file numbering
- Gate block format (`FRAME ▸ ... complete.`)
- Commit label format
- SESSION.md header format
- BREAKDOWN phase (2.5) — never renumber or rename

The gate blocks, commit labels, and SESSION.md headers are how the engine tracks state. Any change to their format breaks phase transitions.

---

## Folder structure

```
~/.frame/cartridges/[cartridge-name]/
├── README.md
├── roles.md
└── steps/
    ├── 01_shape.md
    ├── 02_breakdown.md      ← always 03_ if RESEARCH is included
    ├── 03_design.md
    ├── 04_build.md
    └── 05_check.md
```

File numbers must match step numbers — `01_shape.md` is Step 1, `02_breakdown.md` is Step 2, and so on. BREAKDOWN is always phase 2.5 but its file number reflects sequence position, not phase number.

---

## README.md

Required fields:

```markdown
# [Cartridge Name]
Version: [N.N]
Express: supported          ← optional — include only if the cartridge supports express mode
Run config: supported       ← optional — include only if the cartridge supports run-config persistence
Domain: [precise description — not generic]

[One paragraph describing what the cartridge does and who uses it]

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | SHAPE | [role] | [goal] |
| 2 | [name] | [role] | [goal] |
| 2.5 | BREAKDOWN | Orchestrator | [goal] |
| ... | | | |

## Unit sizing hint

[How to size units for this domain — one paragraph]

## Draft output

[Where BUILD writes output files]
```

If the cartridge has branching paths (e.g. full path vs contained fix), document them in a `## Path variants` section.

---

## roles.md

One role definition per phase. Roles may be shared across phases if the overlap is genuine.

```markdown
## [Role Name]

**Focus:** [what this role is responsible for — one sentence]
**Asks:** [the questions this role raises]
**Produces:** [what appears in SESSION.md or output files]
**Before starting:** [specific named preconditions — name files, not "understand context"]
```

Role names must match exactly what step files reference — case-sensitive.

---

## Step files

Every step file needs:

### Role declaration
```markdown
# Step N · [PHASE NAME]
Role: [Role Name]
```

### Before starting section
Named preconditions — which archive files to read, what to check before proceeding.

### Task description
What the role does, what questions it asks, what it produces.

### Output format
The exact SESSION.md block the role writes. Use fenced markdown:

```markdown
## Output

Write to SESSION.md:

\`\`\`markdown
# SESSION  Phase N · [PHASE NAME]
Role   : [Role Name]
Status : complete

## [Section]
[content]
\`\`\`
```

### Gate block
Every step file must have a complete gate block with both required fields:

```markdown
## Gate

\`\`\`
FRAME ▸ [PHASE NAME] complete.

  Summary: [what to summarise]
  Open:    [what to flag]

  SESSION.md updated.
  → Advance to [next phase]? (y / adjust / pause)
\`\`\`

Commit label: `phase-[N] [PHASE NAME]`

Next SESSION.md header:
\`\`\`markdown
# SESSION  Phase [N+1] · [NEXT PHASE NAME]
Role   : [next role]
Status : in progress
\`\`\`
```

Both fields are required. Missing either will break phase transitions.

---

## BUILD step requirements

BUILD gates per unit, not per phase. The step file must include:

- A per-unit gate that fires after each unit completes
- A `(check)` advance trigger for when all units are done
- Auto-commit format per unit: `FRAME: phase-4 BUILD unit-N complete — [unit name]`

```markdown
## Gate (per unit)

\`\`\`
FRAME ▸ BUILD · Unit N complete.

  Summary: [1-2 lines]
  Open:    [anything flagged]

  SESSION.md + BREAKDOWN.md updated.
  → Next unit: Unit N+1? (y / adjust / pause)
  → All units complete — advance to CHECK? (check)
\`\`\`
```

---

## Phase sequence

The standard sequence:

```
SHAPE → [RESEARCH?] → BREAKDOWN → DESIGN → BUILD → CHECK
```

- **SHAPE** is always Phase 1
- **RESEARCH** (if needed) is Phase 2; everything shifts by one
- **BREAKDOWN** is always Phase 2.5 — never renumbered, never renamed
- **BUILD** is always immediately before CHECK
- **CHECK** is always the final numbered phase before CLOSE

BREAKDOWN and CHECK are engine-visible conventions — do not rename them.

### When to include RESEARCH

Include a RESEARCH phase if the domain requires gathering external material before the work can be structured. Writing does — software development doesn't. The test: does the user need to collect evidence, sources, or reference material from outside before deciding how to organise the work?

---

## Patterns

These runtime behaviours are proven across real FRAME sessions. Apply the ones relevant to your domain.

**One question at a time.** Never batch multiple questions — this is an engine rule, but step files should reinforce it for domain-specific question sequences.

**Propose first.** BREAKDOWN always proposes a breakdown before asking anything. DESIGN proposes a solution before asking for adjustments. Opinionated starting points are faster to react to than blank pages.

**Declare before acting.** For domains involving package installs, scaffolding tools, or environment changes: instruct the active role to state what will run and why, and wait for confirmation. Never run system-modifying actions silently.

**Declare environment constraint forks.** For domains where tooling or environment decisions arise: when a constraint forces a choice between valid resolution paths (version conflict, dependency clash), surface the fork, present options with implications, state a recommendation, and wait for confirmation.

**Scaffolding in temp dir.** For code cartridges: BUILD must warn to run scaffolding tools in a temp subdirectory first, then move files to project root. Running scaffolding tools in the project root may wipe `.frame/`.

**Progressive writes.** Write to SESSION.md as work is produced — not batched at gate close. Especially important in CHECK, where per-unit results must be appended immediately so they are recoverable if the session is interrupted.

**Run config.** If the cartridge is likely to be run repeatedly against the same target (e.g. deploy, publish, release), declare `Run config: supported` in the cartridge README. At CLOSE, the engine will ask the user whether to save SHAPE values to `.frame/run-config.md`. On the next `/frame load`, the engine detects the file, verifies the `Cartridge:` field matches, and asks the user whether to load it — injecting the values as prior context at the start of SHAPE. The user can accept, skip, or start fresh. Only declare this for cartridges where re-entering SHAPE from scratch on every run is genuinely wasteful.

**Express mode.** If the domain has tasks that are genuinely self-contained and small enough to plan and execute in a single pass, declare `Express: supported` in the cartridge README. The engine will ask the user to choose `express` or `full` at load time. Express mode skips BREAKDOWN — the DESIGN step must handle the case where there is no BREAKDOWN.md by producing a single integrated plan rather than per-unit guidance, and the BUILD step must handle single-pass execution with a gate that fires once at completion rather than per-unit. Add an `## Express mode` section to both DESIGN and BUILD step files explaining the difference. Do not add express support speculatively — only where BREAKDOWN genuinely adds no value for small tasks in the domain.

**Path variants.** Cartridges may define multiple phase paths based on scope complexity, determined at the SHAPE gate. The standard path runs all phases in sequence. A shorter path skips phases that add no value for the problem at hand — typically DESIGN when the implementation approach is unambiguous, or BREAKDOWN when SHAPE confirms a single self-contained unit with no decomposition needed. Skipped phases must be declared in the cartridge README under `## Path variants`, and the SHAPE gate block must carry the fork instruction explicitly. See `sw-development` for a reference implementation. Apply only where the domain genuinely warrants it — not every cartridge needs variants.

**Two-pass CHECK.** For domains where quality review and verification are distinct concerns, split CHECK into two sequential passes with separate roles and output formats. Complete the first pass fully before starting the second.

---

## Naming convention

- Domain-based kebab-case: `blog-writing`, `linkedin-profile`, `legal-research`
- Full words preferred
- The name describes the kind of work, not the output artifact
- `cartridge-creator` is a system tool — its naming is an exception

---

## Installing a cartridge

After authoring, copy to the global library:

```bash
cp -r .draft/[cartridge-name]/ ~/.frame/cartridges/[cartridge-name]/
```

The `cartridge-creator` CHECK phase offers to do this automatically on validation pass.

To use project-locally instead (not recommended for shared use), copy to `.frame/cartridges/` at the project root. Add `.frame/cartridges/` to `.gitignore` — project-local cartridges should not be committed.
