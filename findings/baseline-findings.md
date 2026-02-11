# Baseline Findings (Before Hardening)

## Summary
- Scope: DC01, SVR01, WIN11-01
- Date: YYYY-MM-DD
- Method: PowerShell audit + configuration review

## Top Findings
1) SMBv1 enabled on SVR01 (Risk: High)
   - Evidence: audit JSON
   - Impact: legacy protocol increases attack surface
   - Recommendation: disable SMBv1

2) Firewall disabled on WIN11-01 (Risk: High)
   - Evidence: Get-NetFirewallProfile
   - Recommendation: enable firewall profiles

3) Defender cloud protection disabled (Risk: Medium)
   - Evidence: MpComputerStatus / preferences
   - Recommendation: enable baseline Defender settings

