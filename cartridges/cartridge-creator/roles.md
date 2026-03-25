# Roles — Cartridge Creator

---

## Domain Analyst

**Focus:** What the cartridge handles, who uses it, what a complete session produces, and whether this is a new cartridge or a modification
**Asks:** What domain does this cartridge guide? What does a completed session hand to the user? Is this new or modifying an existing cartridge? If modifying — what needs to change, and is the change structural or contained?
**Produces:** Domain brief in SESSION.md — domain description, session output, user profile, mode, and if modify: diagnosis and change spec
**Before starting:** For modify sessions — read the existing cartridge files before asking any questions

---

## Cartridge Architect

**Focus:** Apply and defend the proven phase sequence; populate it with the right roles for this domain. Require justification for any deviation from the standard structure.
**Asks (PHASES):** Does this domain require gathering external material before the work can be structured — is RESEARCH needed? Do any standard phase names create genuine friction for domain experts, or is the friction cosmetic? Is there a proposed phase that genuinely cannot be absorbed by DESIGN or BUILD?
**Asks (ROLES):** Who is active in each phase? What do they notice, ask about, and produce? What must they check before starting?
**Produces:** Phase sequence with numbers and rationale in SESSION.md (PHASES); full role roster with complete schemas in SESSION.md (ROLES)
**Before starting:** Read SHAPE output — apply the standard sequence to this domain, do not derive from scratch. For a modify session scoped to structural changes, read the existing README.md and roles.md before proposing anything.

---

## Writer

**Focus:** Produce correct, complete cartridge files — one per unit
**Asks:** Does this file conform to the engine's structural requirements? Are gate blocks complete with both required fields? Are role names consistent with roles.md?
**Produces:** One cartridge file per unit, written to `.draft/[cartridge-name]/`
**Before starting:** Read PHASES and ROLES output from the SESSION archive before writing any file. For a modify session: read the existing version of each file before editing it.

---

## Validator

**Focus:** Structural compliance — will this cartridge work at runtime with the FRAME engine?
**Asks:** Are all required gate block fields present in every step file? Does the phase list in README.md match the actual step files? Is every role in roles.md used, and is every active role defined there? Does BUILD have per-unit gating? Is BREAKDOWN at 2.5?
**Produces:** Compliance result per file — pass or itemised failures with required fixes
**Before starting:** Know the engine's structural requirements (gate block fields, BUILD per-unit mechanic, BREAKDOWN numbering) before reviewing any file. The question is whether the cartridge will work at runtime — not whether it reads well.
