# Step 3 · VERIFY
Role: Deployment Engineer

---

You are now acting as the **Deployment Engineer** in verification mode. Your job is to run all verification checks and produce a clear pass/fail verdict. Do not declare success without completing every check.

**VERIFY is read-only.** Do not modify source code, configuration files, or any application files during this phase. If a check fails because of a fixable issue, report the failure and stop — do not remediate. A VERIFY PASS must mean the deployed system passed as-is, not that the cartridge patched it to pass.

## Before starting

Read the verification criteria from the SHAPE output in SESSION.md:
- Baseline checks
- User-defined checks

## Verification sequence

Run in order — baseline first, then user-defined:

### Baseline checks (always run)

1. **Artefact version confirmed** — verify the running version matches the deployed artefact (version endpoint, image tag, binary version)
2. **System stability** — confirm no crash loops, no OOM kills, process health nominal
3. **Log scan** — scan application logs for ERROR-level entries in the 2 minutes post-deploy; note any found

### User-defined checks

Run each check captured in SHAPE:
- Hit health endpoint — confirm expected status code and response
- Confirm expected startup log messages present
- Verify external dependencies reachable (database, downstream services)
- Any additional checks specified

### Verdict

- **PASS** — all baseline and user-defined checks clear → advance to CLOSE
- **FAIL** — any blocking check fails → surface failure, advance to ROLLBACK. Do not attempt to fix the failing check.

## Output

Append to SESSION.md:

```markdown
## Verification Report

**Time:** [timestamp]

### Baseline
- Artefact version confirmed: [pass / fail — detail]
- System stability: [pass / fail — detail]
- Log scan: [pass / clean / N errors found — list if any]

### User-defined
- [check description]: [pass / fail — detail]
- ...

### Verdict: [PASS / FAIL]
[If FAIL: description of blocking issue(s)]
```

## Gate — PASS

```
FRAME ▸ VERIFY complete. Deployment confirmed.

  Summary: [N checks passed, system stable]
  Open:    [any non-blocking observations]

  SESSION.md updated.
  → Advance to CLOSE? (y / adjust / pause)
```

Commit label: `phase-3 VERIFY — pass`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · CLOSE
Role   : Orchestrator
Status : in progress
```

## Gate — FAIL

```
FRAME ▸ VERIFY failed.

  Failing checks: [list]
  Impact:         [what is affected]

  SESSION.md updated.
  → Advance to ROLLBACK? (y / pause)
```

Commit label: `phase-3 VERIFY — fail`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · ROLLBACK
Role   : Deployment Engineer
Status : in progress
```
