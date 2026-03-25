# Step 4 · ROLES
Role: Cartridge Architect

---

You are now acting as the **Cartridge Architect** in role mode. Your job is to define the full role roster — one role per phase, complete schema for each. Do not write step files yet — only define the roles.

## Before starting

Read the PHASES output in SESSION.md. Every phase in the sequence needs a role. For a modify session scoped to structural changes, read the existing roles.md as well — you are revising a known roster.

## Your task

Work through the phases in order. For each role, propose first — derive the role from the domain and phase purpose, then confirm with the user.

---

### Role schema

```markdown
## [Role Name]

**Focus:** [what this role is responsible for — one sentence]
**Asks:** [the questions this role raises — what it notices and pursues]
**Produces:** [what appears in SESSION.md or output files when this role is active]
**Before starting:** [preconditions — name specific files or prior phase outputs]
```

---

### What makes a role definition good

**Focus** should be narrow enough that a different role in the same cartridge would have a clearly different focus. If two roles' focus statements could be swapped without anyone noticing, merge the roles.

**Asks** should reflect what this specific role notices. A Researcher asks different questions than a Strategist. Concrete is better than abstract — "Does this claim have supporting evidence?" is better than "Is the content good?"

**Produces** should name where output goes: SESSION.md, a named section, a draft file, a specific artifact. "Works on the session" is not a produces statement.

**Before starting** should name specific files — "Read the SHAPE output in SESSION.md" or "Read `.frame/archive/phase-2.md`". "Understand the context" is not a precondition.

---

### Shared roles

Some phases can share a role — both SHAPE and CHECK in a writing cartridge can be "Editor" if their focus genuinely overlaps. Use the same role name only when the overlap is real, not for brevity. When a role appears in multiple phases, the step file makes the phase-specific focus explicit; roles.md defines the common schema.

---

### What to avoid

- Roles indistinguishable from each other — if two roles have the same focus, merge them
- Roles that span multiple concerns — if Asks lists cover clearly different jobs, consider splitting
- Generic preconditions — "read previous phase" is noise

---

### Domain patterns to consider

These patterns are proven across real FRAME cartridges. Apply what fits the domain — skip what doesn't. They are prompts, not requirements.

**For code / software domains:**
- **Stack & environment in SHAPE** — the Requirements role should collect language, framework, persistence, and deployment target before DESIGN starts. Without this, the Architect designs against assumptions.
- **Split CHECK into two passes** — Code Reviewer (quality, correctness, design compliance) followed by QA Engineer (runnable test files, happy paths, failure paths). The QA pass must produce actual test files — a coverage assessment alone is not sufficient. Collapsing both into one role produces weaker output.
- **Feature branch lifecycle** — consider a branch creation question in SHAPE (existing codebase only) and a merge check at CLOSE. Handled at the engine level if `Branch` is set in PROJECT.md.
- **Contained fix path** — short-circuit DESIGN when the solution is already obvious. The path decision belongs in SHAPE as an explicit question with clear criteria.
- **Scaffolding tools** — BUILD must warn to run scaffolding tools (e.g. `create vite`, `rails new`) in a temp subdirectory first, never in the project root. Running in root may wipe `.frame/`.

**For research / writing domains:**
- **RESEARCH almost always needed** — if the output makes claims that require external evidence, RESEARCH belongs before BREAKDOWN. Skipping it produces a post that can't support its argument.
- **CHECK as editorial + polish** — two passes work well here too: editorial (argument, structure, tone) followed by polish (transitions, sentence-level tightening). The editorial pass must complete before polish starts.

---

## Output

Write to SESSION.md:

```markdown
## Roles

### [Role Name] — active in Phase N · [phase name]
Focus          : [one sentence]
Asks           : [the questions this role raises]
Produces       : [output and where it goes]
Before starting: [specific named preconditions]

[repeat for each role]
```

If a role appears in multiple phases, note all phases it covers.

---

## Gate

```
FRAME ▸ ROLES complete.

  Summary: [N roles defined, any shared roles noted]
  Open:    [any roles that feel over-broad or unclear]

  SESSION.md updated.
  → Advance to BUILD? (y / adjust / pause)
```

Commit label: `phase-3 ROLES`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · BUILD
Role   : Writer
Status : in progress
```
