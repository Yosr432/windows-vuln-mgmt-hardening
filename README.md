# Enterprise Vulnerability Management & System Hardening (Windows)

## Overview
This project simulates an enterprise-grade vulnerability management lifecycle in a Windows environment.
It covers baseline security assessment, risk-based prioritization, remediation planning, system hardening
using PowerShell and Group Policy concepts, and post-remediation verification with evidence.

## Scope (Windows-only)
- Windows Server and Windows 10/11 endpoints
- Configuration and exposure checks (misconfig-based weaknesses)
- Risk scoring (severity x asset criticality x exposure)
- Remediation workflow with tickets and SLAs
- Hardening implementation + verification (before vs after)

## Environment (Example)
- DC01: Windows Server 2022 (AD DS + DNS + GPO)
- SVR01: Windows Server 2022 (Member Server)
- WIN11-01: Windows 11 endpoint (Defender; Sysmon optional)

## Methodology
1. **Asset Inventory**: identify hosts, roles, criticality, exposure.
2. **Baseline Audit**: run `audit.ps1` to collect security posture evidence.
3. **Findings & Risk Scoring**: prioritize using a simple risk model.
4. **Remediation Plan & Tickets**: define owners, SLAs, and evidence required.
5. **Hardening**: apply secure configuration via `harden.ps1` (and document GPO baseline).
6. **Verification**: run `verify.ps1` and compare to baseline results.
7. **Reporting**: summarize improvements and key KPIs.

## Key Deliverables
- Asset Inventory: `assets/inventory.csv`
- Policy & SLA: `docs/policy-sla.md`
- Risk Scoring Model: `docs/risk-scoring.md`
- Findings (Before/After): `findings/`
- Remediation Workflow: `remediation/`
- Scripts (Audit/Harden/Verify): `hardening/powershell/`

## How to Run (per host)
> Run PowerShell as **Administrator**

### 1) Baseline Audit
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\hardening\powershell\audit.ps1
### 2) Apply Hardening
.\hardening\powershell\harden.ps1
Restart-Computer

### 3) Verify (Post-Remediation)
    .\hardening\powershell\verify.ps1

###  Evidence

Audit reports saved under: findings/reports/

Screenshots stored in: screenshots/

Findings documented in:

findings/baseline-findings.md

findings/post-remediation-findings.md


