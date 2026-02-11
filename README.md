# Enterprise Windows Vulnerability Management & System Hardening

## Overview
This project simulates an enterprise-grade Windows vulnerability management lifecycle including:
- Asset inventory
- Baseline assessment
- Risk scoring
- Remediation planning
- Hardening implementation
- Post-remediation verification

## Methodology
Find → Prioritize → Fix → Verify → Report

## How to Run
Run PowerShell as Administrator:

1) Baseline Audit
    .\hardening\powershell\audit.ps1

2) Apply Hardening
    .\hardening\powershell\harden.ps1

3) Verify
    .\hardening\powershell\verify.ps1
