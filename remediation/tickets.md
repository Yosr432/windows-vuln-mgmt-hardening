# Remediation Tickets (GitHub Issues Style)

## VM-001 Disable SMBv1 on SVR01
- Risk score: Severity 5 × Criticality 4 × Exposure 2 = 40
- Steps: apply harden.ps1 / disable SMBv1, reboot, verify.ps1
- Evidence required: before/after audit JSON + screenshot

## VM-002 Enable Firewall on WIN11-01
- Risk score: 4 × 3 × 1 = 12
- Steps: enable firewall profiles, verify
- Evidence required: Get-NetFirewallProfile output

