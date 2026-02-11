# Vulnerability Management Methodology (Windows Environment)

## Overview
This project follows a structured vulnerability management lifecycle aligned with
enterprise security engineering practices. The objective is to identify,
prioritize, remediate, and verify configuration and vulnerability risks
within a Windows-based infrastructure.

---

## Phase 1 – Asset Inventory & Classification

All systems are inventoried and classified based on:

- Business role (Domain Controller, Member Server, Endpoint)
- Environment (Production / Lab)
- Asset Criticality (1–5 scale)
- Exposure level (Internal / External)

This ensures that remediation decisions are risk-based and not purely technical.

---

## Phase 2 – Baseline Assessment

Security posture is assessed using automated PowerShell auditing:

- Firewall configuration
- SMB protocol status
- Defender configuration
- RDP/NLA settings
- Local Administrator group review
- Update posture (basic signal)

Evidence is exported as structured JSON reports.

---

## Phase 3 – Risk Scoring & Prioritization

Each finding is evaluated using a risk scoring model:

Risk Score = Severity × Asset Criticality × Exposure

This ensures that high-impact issues on critical systems are addressed first.

---

## Phase 4 – Remediation Planning

Findings are documented and assigned:

- Owner
- Remediation action
- SLA deadline
- Verification requirement

Remediation is executed via:
- PowerShell enforcement
- Group Policy configuration (documented baseline)

---

## Phase 5 – Hardening Implementation

Secure configuration controls are applied, including:

- Disabling legacy protocols (e.g., SMBv1)
- Enforcing firewall activation
- Enabling Defender security baseline
- Enforcing RDP Network Level Authentication (where applicable)

All changes are documented.

---

## Phase 6 – Verification & Evidence Collection

Post-remediation audit is executed.

Baseline and post-remediation reports are compared to confirm:

- Risk reduction
- Control effectiveness
- No unintended configuration drift

---

## Phase 7 – Reporting & Metrics

Security posture improvement is summarized using:

- High/Medium/Low findings distribution
- Risk score reduction
- Control compliance improvement
- Observations and future improvements

This ensures transparency and measurable security progress.
