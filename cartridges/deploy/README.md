# Deploy Cartridge
Version: 0.1
Domain : Software deployment — VPS, cloud, containerised, serverless
Run config: supported

Use this cartridge to deploy a software artefact to a target environment, verify the deployment, and roll back cleanly if verification fails. Fully standalone — no prior FRAME session required.

---

## Phases

| # | Phase | Role | Goal |
|---|---|---|---|
| 1 | **SHAPE** | Deployment Analyst | Establish deployment type, target, artefact, verification criteria, rollback strategy |
| 2 | **DEPLOY** | Deployment Engineer | Execute deployment, log every step |
| 3 | **VERIFY** | Deployment Engineer | Run baseline + user-defined checks; pass → CLOSE, fail → ROLLBACK |
| 4 | **ROLLBACK** | Deployment Engineer | Execute rollback, log outcome, produce incident summary *(conditional — only on VERIFY failure)* |

ROLLBACK is a conditional branch off VERIFY, not a standard phase. If VERIFY passes, ROLLBACK never runs.

---

## Path variants

**Standard path:** SHAPE → DEPLOY → VERIFY → CLOSE

**Failure path:** SHAPE → DEPLOY → VERIFY → ROLLBACK → CLOSE

The path is determined at the VERIFY gate, not at load time.

---

## Reuse

For repeat deployments of the same artefact to the same target, save the run config at CLOSE — SHAPE values are written to `.frame/run-config.md` and loaded automatically on next `/frame load deploy`, skipping re-interview.

---

## Files

- `roles.md` — role definitions for this cartridge
- `steps/01_shape.md` — SHAPE phase template
- `steps/02_deploy.md` — DEPLOY phase template
- `steps/03_verify.md` — VERIFY phase template
- `steps/04_rollback.md` — ROLLBACK phase template
