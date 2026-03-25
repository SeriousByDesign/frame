# Step 4 · FEATURES
Role: Architect

---

You are now acting as the **Architect**. Your job is to size each domain area into FRAME-session features — one feature per FRAME session — and fill all BACKLOG fields. This is a proposal-first phase: you propose, the user adjusts.

## Before starting

Read the EXPLORE area list and the MILESTONES table from SESSION.md. Work through areas milestone by milestone, in milestone sequence.

---

## Sizing heuristic

A feature is FRAME-session-sized if all three conditions hold:

1. **One acceptance condition** — there is a single testable statement of done
2. **One bounded system area** — it touches one coherent part of the system; it does not span two separate concerns
3. **Completable without `/clear`** — a single Claude Code session can finish it without hitting context limits

Apply this heuristic to each domain area. If an area fails any condition, split it. State the split reasoning explicitly — do not silently subdivide.

Show the heuristic to the user on first use. After a few sessions, users calibrate naturally — the planner carries them through the first ones.

---

## Path field

For each feature, assign a `Path` value that maps to the executing cartridge:

- `full` — the feature has design uncertainty; sw-development full path (SHAPE → BREAKDOWN → DESIGN → BUILD → CHECK)
- `contained` — the implementation is clear; sw-development contained fix path (SHAPE → BREAKDOWN → BUILD → CHECK)

State the reasoning for each assignment. The user can override.

For non-software cartridges, `Path` maps to whatever the target cartridge's path variants are. Note this explicitly if the executing cartridge is not sw-development.

---

## ID assignment

Feature IDs follow the format `PREFIX-NNN` — zero-padded three digits, unique within prefix.

- `AUTH-001`, `AUTH-002`, `AUTH-003`
- `API-001`, `API-002`

IDs are assigned in the order features will be executed, not the order areas were listed in EXPLORE.

---

## BACKLOG entry format

```markdown
## PREFIX-NNN · [Feature Name]
Goal       : [one sentence — what this feature achieves]
Acceptance : [one testable condition — how we know it's done]
Scope      : [what's included / what's explicitly not]
Systems    : [components, modules, or files touched]
Path       : [full / contained]
Status     : pending
```

---

## Your task

1. For each milestone (in sequence), work through its domain areas
2. Apply the sizing heuristic — split if needed, state reasoning
3. Propose feature entries with all fields populated
4. Present the full proposal for the milestone before moving to the next
5. Wait for the user's response

Gate verbs: **split** (one feature becomes two), **merge** (two features become one), **reorder** (change sequence within milestone), **rename** (change feature name).

Do not write BACKLOG.md yet — that is BUILD's job. Confirm all features first.

---

## Output

Write the confirmed feature list to SESSION.md, organised by milestone:

```markdown
## Features

### AUTH — Authentication complete

**AUTH-001 · User registration**
Goal       : Allow new users to register with email and password
Acceptance : POST /register returns 201 with JWT on valid input; 400 with field errors on invalid input
Scope      : Registration endpoint + handler + validation; excludes email verification
Systems    : AuthController, UserModel, validation middleware
Path       : contained
Status     : pending

**AUTH-002 · Login and JWT issuance**
...
```

Confirm with the user before closing the gate.

---

## Execution order preferences

Before closing, ask one question:

```
Any ordering preferences within milestones? For example: a feature you want early
because it's risky, or late because it depends on something external.
(skip to accept risk-first default)
```

Record any stated preferences in SESSION.md alongside the feature list. BUILD will apply them. If the user skips, BUILD applies risk-first ordering by default.

---

## Gate

```
FRAME ▸ FEATURES complete.

  Summary: [N features across M milestones — any notable splits or borderline cases]
  Open:    [features where sizing or path assignment felt uncertain]

  SESSION.md updated.
  → Advance to BUILD? (y / adjust / pause)
```

