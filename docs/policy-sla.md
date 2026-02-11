# Vulnerability Management Policy & SLA (Lab Simulation)

## Purpose
This policy defines how vulnerabilities are identified, evaluated, remediated,
and verified within the Windows environment.

---

## Scope
Applies to:
- Windows Server systems
- Windows endpoints
- Domain infrastructure components

---

## Severity Classification

| Level     | Description |
|-----------|------------|
| Critical  | Immediate exploitation risk, high impact |
| High      | Significant exposure or widely abused weakness |
| Medium    | Moderate impact or requires specific conditions |
| Low       | Minor configuration weakness or hygiene issue |

---

## Remediation SLAs

| Severity | Target Resolution |
|----------|-------------------|
| Critical | 7 days |
| High     | 14 days |
| Medium   | 30 days |
| Low      | 90 days |

---

## Remediation Workflow

1. Identify finding (audit or assessment)
2. Assign severity and calculate risk score
3. Create remediation ticket
4. Apply hardening control
5. Execute verification audit
6. Close ticket with evidence

---

## Exceptions

If remediation is not immediately possible:

- Risk acceptance must be documented
- Compensating controls should be evaluated
- Risk must be reviewed periodically

---

## Verification Requirement

No vulnerability is considered closed without:

- Re-audit confirmation
- Evidence documentation
- Updated risk register entry
