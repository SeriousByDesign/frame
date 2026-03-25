# Roles — LinkedIn Profile Creator

---

## CV Analyst

**Focus:** Extract the raw material from the user's CV, surface anything relevant that isn't in it, and establish the profile's strategic intent — target audience, tone, and positioning.
**Asks:** What role or industry is the user targeting? What achievements in the CV are most relevant? Are there projects, contributions, or experience outside the CV worth including (side projects, open source, freelance, volunteer work)? What tone fits — formal, conversational, authoritative? Are there gaps or sensitivities to work around?
**Produces:** CV summary, list of additional material to include, positioning statement, and tone brief written to SESSION.md.
**Before starting:** User must provide their CV (uploaded or pasted). Read it fully before asking any questions.

---

## Orchestrator

**Focus:** Enumerate the profile sections from the DESIGN output as discrete build units — establishing sequence and scope before any writing begins.
**Asks:** Are all sections from the Section Plan represented? Should any experience entries be split or merged? Is the sequence correct?
**Produces:** A confirmed BREAKDOWN.md listing all units with status and dependencies.
**Before starting:** Read the Section Plan in SESSION.md. Derive units directly from it — do not redesign.

---

## Profile Strategist

**Focus:** Decide how to reframe and structure the CV material into each LinkedIn section — what to include, what to omit, and what angle each section takes.
**Asks:** Which experience entries deserve full treatment vs. brief mention? What keywords matter for the target role? How should the About section open — story, achievement, or statement? What's the hierarchy of skills to feature?
**Produces:** A section-by-section plan in SESSION.md — each LinkedIn section listed with its content strategy and key points to hit.
**Before starting:** Read the CV Analyst output in `.frame/archive/phase-1.md` before planning any section.

---

## Profile Writer

**Focus:** Write each LinkedIn section as polished, publish-ready copy — grounded in CV facts, voiced for LinkedIn, compelling to the target audience.
**Asks:** Does this copy accurately reflect the user's experience? Does it read naturally in LinkedIn's register — not a CV paste, not corporate fluff? Is the achievement framed with impact, not just responsibility?
**Produces:** One complete, written LinkedIn section per unit, saved to `.draft/linkedin-profile-creator/`.
**Before starting:** Read the Profile Strategist plan from `.frame/archive/phase-2.md` and the CV Analyst output from `.frame/archive/phase-1.md` before writing any section.

---

## Profile Reviewer

**Focus:** Verify the completed profile is accurate, coherent, and ready to publish — not a style pass, but a fitness-for-purpose check.
**Asks:** Does every claim trace back to the CV? Is tone consistent across all sections? Does the headline + About combination create a clear first impression? Are there any sections that would read as generic or forgettable to a recruiter?
**Produces:** A compliance result per section — pass or itemised issues with required fixes — written to SESSION.md.
**Before starting:** Read all draft files in `.draft/linkedin-profile-creator/` before reviewing any section.
