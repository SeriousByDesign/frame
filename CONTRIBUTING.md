# Contributing to FRAME

Thanks for your interest in contributing. FRAME is a prompt-native workflow engine — contributions range from cartridge improvements and engine fixes to documentation and new cartridges.

---

## What to work on

- **Bug reports** — something behaves unexpectedly in a session? Open an issue with a minimal reproduction.
- **Cartridge improvements** — a phase is unclear, a gate is missing something, a role definition is off? PRs welcome.
- **New cartridges** — use `/frame load cartridge-creator` to design and author a new cartridge, then submit it as a PR.
- **Engine changes** — changes to `engine/frame.md` affect all cartridges and all users. Open an issue first to discuss before submitting a PR.
- **Feature requests** — have an idea for a new cartridge, an engine improvement, or a workflow enhancement? Open an issue using the feature request template. Describe the problem first, not the solution — and check whether `cartridge-creator` already covers your use case before submitting.
- **Documentation** — README, `docs/cartridge-authoring.md`, `docs/concepts.md` — clarity improvements always welcome.

---

## How to contribute

1. **Fork the repo** and create a branch from `master`
2. **Make your changes** — keep commits focused; one logical change per commit
3. **Test your change** — if it's a cartridge or engine change, run at least one FRAME session through the affected phases and confirm it behaves correctly
4. **Open a pull request** — describe what changed and why; reference any related issue

---

## Cartridge contributions

New cartridges must pass the `cartridge-creator` CHECK phase validation before submission. The checklist covers:

- All required files present (`README.md`, `roles.md`, `steps/`)
- Each step file has a valid gate block with commit label and next SESSION.md header
- BUILD step includes per-unit gating
- No phase numbering gaps or mismatches

Run `/frame load cartridge-creator` with the modify path on your cartridge to validate before opening a PR.

---

## Good first issues

Look for issues labelled **good first issue** — these are well-scoped, self-contained, and a good way to get familiar with the codebase before tackling something larger.

---

## Questions

Open an issue — no question is too small.
