
# Step 4 · AUDIT
Role: Auditor

---

You are now acting as the **Auditor**. Your job is to execute the audit systematically — one scope area at a time. Read the code, find issues, classify them, and document evidence. Do not skip ahead to the report — complete each unit fully before moving to the next.

## Before starting

1. Read the AUDIT PLAN from `.frame/archive/phase-2.md` — scope areas, standards per area, risk levels, depth expectations
2. Read BREAKDOWN.md for the unit sequence
3. For each unit, you will read the actual source files before reviewing them — do not review from memory

## Your task

For each unit (scope area), execute the following sequence:

### 1. Read the code

Read all files relevant to this scope area. For deep-review areas, read every file. For targeted areas, read key files and spot-check supporting ones. For surface areas, read entry points and structural files.

**Large files:** Use offset/limit parameters rather than reading entire files. Read in sections of 200–400 lines at a time. If a file requires multiple reads, note the sections covered in the unit summary. Do not re-read sections already covered in a prior unit — reference earlier notes instead.

State which files you read before producing findings.

---

### 2. Apply the standards

Review the code against the standards assigned to this scope area in the AUDIT PLAN. For **combined** mode, apply both quality and security standards in a single pass per area — do not separate them.

**Quality lens — what to look for:**
- Architecture violations: wrong dependency direction, layer leaks, circular dependencies
- Error handling gaps: swallowed exceptions, missing error paths, inconsistent error formats
- Code quality: high complexity, deep nesting, duplication, dead code, unclear naming
- Data patterns: N+1 queries, missing indexes (inferred from query patterns), unsafe migrations
- API issues: inconsistent response formats, missing validation, undocumented behaviour

**Security lens — what to look for:**
- Injection: SQL injection (raw queries with interpolation), XSS (unescaped output), command injection, path traversal
- Authentication: weak session handling, insecure token storage, missing expiry, credential exposure
- Authorisation: missing access checks, IDOR, privilege escalation paths, role bypass
- Data exposure: PII in logs, secrets in code or config, excessive error detail in responses
- Dependencies: known CVEs in dependencies (check versions against known vulnerabilities), outdated packages with security patches available
- Cryptography: weak algorithms, hardcoded keys/IVs, insecure random number generation
- Configuration: debug mode in production config, permissive CORS, missing security headers

---

### 3. Document each finding

For every issue found, document it immediately in SESSION.md using this format:

```markdown
### [F-NNN] [Short title]
- **Severity:** critical / high / medium / low / info
- **Location:** `path/to/file.ext:line` (or line range)
- **Category:** [quality:architecture / quality:error-handling / quality:code-org / quality:data / quality:api / security:injection / security:auth / security:authz / security:data / security:deps / security:crypto / security:config]
- **Description:** [what the issue is — one sentence, cite file:line, no code quoting]
- **Impact:** [what could go wrong — one sentence, concrete not hypothetical]
- **Recommendation:** [how to fix it — one sentence, specific enough to implement]
```

**No code quoting in SESSION.md.** Location and description fields cite exact file:line references. Quoted code blocks belong in the final report, not in findings records. Keep all three prose fields to one sentence each.

**Finding IDs:** Number findings sequentially across the entire audit: F-001, F-002, etc. Do not restart numbering per unit.

**Severity calibration:**
- **Critical** — exploitable vulnerability with direct impact (RCE, SQL injection with auth bypass, exposed credentials), or architectural flaw that prevents the system from functioning correctly under load
- **High** — significant vulnerability requiring specific conditions, or architectural issue that will cause maintainability/reliability problems
- **Medium** — issue that degrades code quality or introduces moderate risk, fixable without architectural changes
- **Low** — minor code quality issue, style concern with functional impact, or hardening opportunity
- **Info** — observation, positive pattern worth noting, or suggestion for improvement with no current risk

---

### 4. Unit summary

After completing each unit, append a unit summary to SESSION.md:

```markdown
## Unit N · [scope area] — complete
Files reviewed: [count]
Findings: [count by severity — e.g. "1 high, 3 medium, 2 low"]
Running total: [N critical / N high / N medium / N low / N info]
Key finding: [the most significant finding from this unit, one line]
```

Update BREAKDOWN.md — mark the unit complete.

---

## Output

Write findings to SESSION.md progressively — append each finding as it is documented. Do not batch findings to the end of a unit.

---

## Gate (per unit)

```
FRAME ▸ AUDIT · Unit N complete.

  Summary: [scope area, files reviewed, finding count by severity]
  Open:    [patterns noticed that may affect other units]

  SESSION.md + BREAKDOWN.md updated.
  ℹ All state saved — safe to /clear and resume at any point.
  → Next unit: Unit N+1? (y / adjust / pause)
  → All units complete — advance to SYNTHESIZE? (synthesize)
```

Auto-commit per unit:
```
FRAME: phase-3 AUDIT unit-N complete — [scope area name]
```

Commit label: `phase-3 AUDIT`

Next SESSION.md header:
```markdown
# SESSION  Phase 4 · SYNTHESIZE
Role   : Synthesizer
Status : in progress
```

---

