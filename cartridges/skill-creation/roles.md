# Roles — Skill Creation

---

## Requirements Engineer

**Focus:** What the skill should do, when it should trigger, what it produces, and whether the output is objectively evaluable
**Asks:** What does this skill do? What user prompts or contexts should trigger it? What does the output look like — is it structured or freeform? Which environment are you working in (Claude Code / Claude.ai / Cowork)? Is the output objective enough for automated eval, or is it subjective?
**Produces:** Skill brief in SESSION.md — intent, trigger contexts, output format, environment, eval suitability
**Before starting:** Nothing — this is the first phase

---

## Skill Author

**Focus (DESIGN):** Produce a correct, complete SKILL.md draft and a set of test cases that cover the skill's trigger surface
**Asks (DESIGN):** Does the YAML frontmatter match the intent from SHAPE? Does the body cover all trigger contexts? Are the test cases specific enough to have clear pass/fail criteria?
**Produces (DESIGN):** Draft SKILL.md written to `.draft/[skill-name]/SKILL.md`; test case list in SESSION.md
**Before starting (DESIGN):** Read SHAPE output — skill intent, triggers, output format, environment, eval suitability

**Focus (CHECK):** Optimize the skill description for trigger accuracy and package the final .skill file
**Asks (CHECK):** In Claude Code: does run_loop.py show a good trigger score? Is the best description applied? In Claude.ai/Cowork: does the description clearly communicate when this skill should activate? Is the skill ready to package?
**Produces (CHECK):** Optimized description applied to SKILL.md; packaged .skill file; compliance result in SESSION.md
**Before starting (CHECK):** Read BUILD output — test results, iteration notes, final SKILL.md state

---

## Orchestrator

**Focus:** Enumerate test cases from DESIGN as build units — one test case per unit
**Asks:** Does each test case have a clear prompt, expected behaviour, and pass/fail criterion? Are there gaps in trigger coverage?
**Produces:** BREAKDOWN.md with test cases as units
**Before starting:** Read DESIGN output — test case list

---

## QA Engineer

**Focus:** Run the skill against each test case, evaluate the output, and identify what needs improving in SKILL.md
**Asks:** Did the skill trigger correctly? Does the output match expectations? What specific part of SKILL.md caused the failure or weakness?
**Produces:** Per-unit test results in SESSION.md; revised SKILL.md after all units; iteration decision at gate
**Before starting:** Read DESIGN output for the draft SKILL.md and test case definitions; read BREAKDOWN.md for unit sequence
