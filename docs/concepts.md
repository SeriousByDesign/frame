# FRAME Concepts

How FRAME works — phases, roles, gates, cartridges, and state.

---

## The core idea

A FRAME session is a structured conversation. Instead of a freeform exchange with Claude, you move through defined phases — each with a specific role active, a specific job to do, and an explicit checkpoint before advancing.

The engine (`frame.md`) handles the structure. A cartridge defines what that structure looks like for a specific domain.

---

## The engine and cartridges

FRAME has two layers:

**The engine** (`engine/frame.md`) is the overall orchestrator. It handles everything that applies to every session regardless of domain:
- LOAD — resolves the cartridge, checks for existing sessions, initialises git, writes `PROJECT.md`
- CLOSE — archives the final phase, runs the branch merge check, writes the session close block
- Gate protocol — the `y / adjust / pause` mechanic at every phase boundary
- Phase close — archiving SESSION.md, writing the next phase header, auto-committing
- BUILD per-unit gating — the unit-level checkpoint mechanic
- CHECK issue resolution — inline fix, loop-back to BUILD, loop-back to DESIGN
- Role interaction rules — one question at a time, declare before acting, progressive writes
- Resume, recall, status, stop — session lifecycle commands
- Token awareness — context usage flagging at unit gates

The engine is a single Markdown file. It is the `/frame` slash command.

**Cartridges** own everything in between LOAD and CLOSE — the domain-specific phases, the roles that run them, and the step-by-step templates that drive the work. A cartridge is also plain Markdown.

This split means the engine never changes when you add a new domain — you write a cartridge. And cartridges never need to re-implement gate mechanics, commit logic, or resume behaviour — they inherit it from the engine automatically.

---

## Phases

Every session runs SHAPE → BREAKDOWN → DESIGN → BUILD → CHECK → CLOSE. RESEARCH is inserted between SHAPE and BREAKDOWN for domains that require gathering external material before the work can be structured — writing cartridges typically include it, software development cartridges typically don't.

| Phase | Job |
|---|---|
| SHAPE | Define the problem — scope, constraints, acceptance criteria |
| RESEARCH | Gather external material — sources, data, evidence *(optional)* |
| BREAKDOWN | Split the work into right-sized units |
| DESIGN | Decide how to solve the problem |
| BUILD | Execute one unit at a time |
| CHECK | Review what was built |
| CLOSE | Wrap up, archive, commit |

SHAPE, BREAKDOWN, BUILD, CHECK, and DESIGN are **cartridge-defined** — the cartridge determines which phases run, in what order, and what each phase does. CLOSE always runs and is handled by the engine. The RESEARCH decision is made when designing the cartridge, not at runtime — with BREAKDOWN always remaining at phase 2.5 regardless.

The sequence is deliberate: you define the problem before decomposing it, decompose it before designing the solution, and design before building. Each phase produces output that the next phase depends on. Skipping a phase doesn't save time — it moves the work into a later phase where it's harder to do cleanly. The exception is BREAKDOWN in express mode: when the scope is genuinely self-contained and the plan can be produced directly in DESIGN, skipping BREAKDOWN is a legitimate choice, not a shortcut. Express mode is selected at load time for cartridges that support it.

**DESIGN** is where the active role decides how to approach the work — structure, sequence, key decisions — before execution starts. The separation from BUILD matters: decisions made explicitly in their own phase don't get buried mid-execution, and BUILD can proceed with a clear plan rather than figuring it out on the fly.

**CHECK** runs in two sequential passes. The first reviews whether the output meets the requirements and matches the design. The second verifies it — tests for code, editorial polish for writing, whatever the domain requires. When CHECK finds a blocking issue, the engine has a defined resolution mechanic: fix inline if the issue is contained, loop back to BUILD if it requires reworking a unit, or loop back to DESIGN if it reveals a structural problem. Nothing gets papered over.

---

## Roles

At each phase, FRAME adopts a specific role. The role determines what to notice, what to ask about, and what to produce. Examples:

- **Requirements Engineer** — clarifies the problem, never suggests solutions
- **Architect** — designs the solution, never writes implementation code
- **Developer** — implements one unit, guided by the design
- **Code Reviewer** — reviews against requirements and design intent
- **QA Engineer** — writes and verifies test coverage

Roles are defined in each cartridge's `roles.md`. The same role can appear in multiple phases if the work genuinely overlaps — the step file makes the phase-specific focus explicit.

The examples above are from the `sw-development` cartridge. Other cartridges define their own role rosters — the `blog-writing` cartridge has an Editor, Researcher, Content Strategist, and Writer instead.

Role-switching is functional, not theatrical. Roles differ in what they notice and produce — not in personality or tone.

---

## Gates

At the end of every phase, FRAME outputs a gate:

```
FRAME ▸ [Phase name] complete.

  Summary: [2-3 lines — what was decided or produced]
  Open:    [unresolved questions]

  SESSION.md updated.
  → Advance to [next phase]? (y / adjust / pause)
```

Three responses:
- `y` — archive the phase, begin the next
- `adjust` — stay in the current phase, address a concern, re-present the gate
- `pause` — write all state files, stop safely; resume with `/frame resume`

Nothing advances without your confirmation. Gates are the mechanism that keeps you in control.

BUILD phases gate **per unit**, not per phase — after each work unit completes, not at the end of all units. This is the natural `/clear` point during long sessions.

---

## Cartridges

A cartridge is a folder of Markdown files that defines a workflow for a specific domain:

```
~/.frame/cartridges/sw-development/
├── README.md       ← name, version, phase list
├── roles.md        ← role definitions
└── steps/
    ├── 01_shape.md
    ├── 02_breakdown.md
    ├── 03_design.md
    ├── 04_build.md
    └── 05_check.md
```

Cartridges are plain Markdown — no code, no tooling, no configuration syntax. To build a new one, run `/frame load cartridge-creator`. See [cartridge-authoring.md](cartridge-authoring.md) for the full guide.

Cartridges resolve in order: explicit path → project-local (`.frame/cartridges/`) → global library (`~/.frame/cartridges/`). Project-local always wins.

---

## State files

FRAME maintains three files in `.frame/` at your project root:

**`PROJECT.md`** — written at load, rarely changes. Records the cartridge, goal, stack, constraints, and out-of-scope items.

**`BREAKDOWN.md`** — written at BREAKDOWN, updated as units complete. The authoritative list of work units and their status.

**`SESSION.md`** — current phase only. Overwritten at each gate. Contains working notes for the active phase — what was decided, what was built, what's flagged for the next phase.

Completed phases are archived to `.frame/archive/phase-N.md` — a compressed summary plus the full SESSION.md content before it was wiped. Retrieve with `/frame recall phase-N`.

---

## Pause and resume

FRAME is designed for long sessions that span multiple context windows. The pause/resume cycle is a first-class workflow:

- At any unit gate, type `pause` — state is written, safe to `/clear`
- `/frame resume` restores full context: project, breakdown, current phase, active unit

FRAME reminds you at every unit gate and phase gate that state is saved and it's safe to `/clear`. The context bar is visible — the decision of when to clear is yours.

---

## Auto-commit

FRAME auto-commits at every gate close and every unit complete. Commits include both `.frame/` state files and working code — each commit is a coherent snapshot of process state and output together.

Commit messages are prefixed `FRAME:` — identifiable in `git log`, squashable before merging if you want a clean history.

To commit `.frame/` files only (no working code): `/frame load <cartridge> --no-code-commits`.
