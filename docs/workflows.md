# FRAME — Inputs, Outputs & Workflows

This is a selection of workflows based on the cartridges currently included with FRAME. It is not exhaustive — new cartridges create new workflows and new combinations.

---

## Cartridge reference

| Input | Cartridge | Output |
|-------|-----------|--------|
| Project idea | `project-planner` | `BACKLOG.md` |
| Article idea | `blog-writing` | Publishing-ready article |
| CV | `linkedin-profile` | Complete LinkedIn profile |
| Skill idea | `skill-creation` | Claude Code skill |
| Domain brief | `cartridge-creator` | New FRAME cartridge |
| Existing codebase | `code-audit` | `audit-report.md` |
| Existing codebase | `codebase-analysis` | Report set + `ADVICE.md` |
| `BACKLOG.md` / task | `sw-development` | Implemented task(s) |
| `audit-report.md` / `ADVICE.md` / `BACKLOG.md` | `findings-to-tasks` | Tasks in tracking tool |
| Committed or uncommitted changes | `document-and-commit` | Commit message, changelog entry, doc updates |

---

## Workflows

### New Project Kickoff

Start a project from an idea and get to a structured, prioritised backlog ready for implementation.

1. `/frame load project-planner` — define goal, team context, constraints; output: `BACKLOG.md`
2. `/frame load findings-to-tasks` — reads `BACKLOG.md`; generates work items in your tracking tool _(optional — skip if you work directly from `BACKLOG.md`)_
3. `/frame load sw-development` — pick a work item from `BACKLOG.md` or your tracking tool and implement it

Repeat step 3 per work item.

---

### Code-Fix Workflow

Fix a bug from a tracking tool with full traceability.

1. `/frame load sw-development`
2. Tell Claude Code to read the bug from your tracking tool for implementation
3. Run through the phases and implement the fix — if the fix involves external libraries, tell Claude Code to retrieve the latest documentation via `find-docs`
4. Before CLOSE, tell Claude Code to update the bug status in the tracking tool
5. End cartridge run

---

### Work-Item Workflow

Same as Code-Fix, but use a work item instead of a bug. Pull the item from your tracking tool at the start of the session, implement it through the phases, and update its status before CLOSE.

---

### Codebase Health → Backlog

Get a structured analysis of an existing codebase and turn findings into actionable tasks in one chain.

1. `/frame load codebase-analysis` — produces report set + `ADVICE.md`
2. `/frame load findings-to-tasks` — reads `ADVICE.md`; generates tasks in your tracking tool (Jira, Linear, etc.)
3. `/frame load sw-development` — implement tasks from the tracking tool

---

### Pre-Release Audit

Run a quality and security audit before a release and turn every finding into a tracked task.

1. `/frame load code-audit` — produces `audit-report.md`
2. `/frame load findings-to-tasks` — reads `audit-report.md`; generates tasks in your tracking tool
3. `/frame load sw-development` — work through the generated tasks

---

### Content Creation

Write a blog post, article, or essay from idea to publishable draft.

1. `/frame load blog-writing` — define audience, angle, and SEO target; produce a structured draft
2. Review and publish

---

### LinkedIn Profile from CV

Turn a CV into a complete, publish-ready LinkedIn profile.

1. Prepare your CV as a text or markdown file
2. `/frame load linkedin-profile` — FRAME reads the CV, adopts a profile editor role, and produces all profile sections

---

### Document and Commit

Document code changes made outside of a FRAME session and produce a clean commit record.

1. `/frame load document-and-commit`
2. FRAME reads the diff automatically — confirm the change state (committed or uncommitted)
3. Answer SHAPE questions: intent, ticket reference, breaking change flag, doc files to update
4. Review the generated commit message, changelog entry, and doc edits at the BUILD gate
5. Confirm — FRAME commits

Works for both uncommitted changes (stages and commits) and already-committed changes (adds a separate `docs:` commit for any documentation updates).

---

### Custom Tooling

Build a new FRAME cartridge for a domain not covered by the included set.

1. `/frame load cartridge-creator` — describe the domain; FRAME guides you through phase design, role definition, and file authorship
2. The output is a ready-to-install cartridge at `~/.frame/cartridges/[name]/`

Alternatively, copy an existing cartridge and adapt it — see `docs/cartridge-authoring.md`.
