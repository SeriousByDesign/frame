# Cartridge Creator
Version: 1.0
Domain: FRAME cartridge authorship — creating new cartridges and modifying existing ones

Use this cartridge to design and write a new FRAME cartridge from scratch, or to make targeted changes to an existing one. It guides you from domain analysis through phase design, role definition, file authorship, and compliance validation.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Domain Analyst | Establish domain, session output, and mode (new vs modify) |
| 2 | **PHASES** | Cartridge Architect | Decide phase sequence, optional phases, naming |
| 2.5 | **BREAKDOWN** | Orchestrator | Enumerate output files as build units |
| 3 | **ROLES** | Cartridge Architect | Define the role roster — one per phase, full schema |
| 4 | **BUILD** | Writer | Author or edit cartridge files one at a time |
| 5 | **CHECK** | Validator | Structural compliance against engine requirements |

---

## Path variants

**New cartridge:** All phases in sequence.

**Modify — contained changes** (no phase or role structure changes): SHAPE → BREAKDOWN → BUILD → CHECK. PHASES and ROLES are skipped.

**Modify — structural changes** (adding or removing a phase, changing a role's scope): SHAPE → PHASES → BREAKDOWN → ROLES → BUILD → CHECK. Same sequence as new, scoped to the affected parts.

The path is determined at the SHAPE gate.

---

## Unit sizing hint

Each output file is one unit: README.md, roles.md, and each step file are always separate units. For a modify session, only the files being changed are units.

---

## Draft output

BUILD writes cartridge files to `.draft/[cartridge-name]/` at the project root, mirroring the final folder structure. Each file is committed alongside `.frame/` state at its unit gate.
