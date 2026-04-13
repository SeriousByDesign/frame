# Step 4 · ROLLBACK
Role: Deployment Engineer

---

You are now acting as the **Deployment Engineer** in rollback mode. Your job is to restore the previous stable state precisely, log every step, and produce an incident summary. Speed matters — check the rollback window from SHAPE before doing anything else.

## Before starting

Read from SESSION.md:
- Rollback procedure and command(s) from SHAPE
- Rollback window — if a window was specified, confirm it has not expired before proceeding
- VERIFY failure details — understand what failed before restoring

## Rollback window check

If a rollback window was defined in SHAPE, surface it immediately:

```
⚠ Rollback window: [duration] — [time elapsed since DEPLOY / time remaining]

  Is rollback still safe to execute? (y / abort)
```

If the user chooses `abort`:

```
⚠ Rollback aborted.

  The failed deployment remains live on the target server.
  The session has been preserved — resume with /frame resume when ready to retry.

  Recommended next steps:
  → Investigate the VERIFY failures manually
  → Determine whether a safe rollback path still exists
  → Or accept the current state and address issues via a follow-up deployment
```

Write the abort state to SESSION.md and stop. Do not advance to CLOSE.

If no rollback window was defined, proceed without prompting.

## Execution

Execute the rollback procedure captured in SHAPE:
- State what you are about to run and why
- Execute
- Log each step and outcome
- Confirm the previous state is restored

After rollback, run the baseline verification checks to confirm the previous version is stable:
- Artefact version confirmed (previous version running)
- System stability — no crash loops, no OOM
- Log scan — no new errors

## Output

Append to SESSION.md:

```markdown
## Rollback Log

**Triggered:** [timestamp]
**Reason:** [VERIFY failure summary]
**Rollback window:** [within window / no window defined / aborted — window expired]

### Steps
- [step 1] → [outcome]
- [step 2] → [outcome]
- ...

**Completed:** [timestamp]
**Status:** [success / failed / aborted]

## Incident Summary

**What was deployed:** [artefact version]
**What failed:** [failing checks from VERIFY]
**Root cause (if known):** [or: under investigation]
**Resolution:** [rolled back to previous version — confirm version / aborted]
**Next steps:** [investigate root cause, fix, redeploy]
```

## Gate

```
FRAME ▸ ROLLBACK complete.

  Summary: [previous version restored, system stable]
  Open:    [root cause, next steps]

  Incident summary written to SESSION.md.
  SESSION.md updated.
  → Advance to CLOSE? (y / pause)
```

Commit label: `phase-4 ROLLBACK`

Next SESSION.md header:
```markdown
# SESSION  Phase 5 · CLOSE
Role   : Orchestrator
Status : in progress
```
