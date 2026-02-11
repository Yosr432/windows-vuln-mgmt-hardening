<#
Apply safe hardening controls.
Run as Administrator.
Note: In real enterprise, many of these are enforced via GPO.
#>

$ErrorActionPreference = "Stop"

Write-Host "== Windows Hardening Started =="

# 1) Ensure Firewall enabled
Get-NetFirewallProfile | ForEach-Object {
    Set-NetFirewallProfile -Name $_.Name -Enabled True
}
Write-Host "Firewall enabled for all profiles."

# 2) Disable SMBv1 (common hardening)
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart | Out-Null
Write-Host "SMBv1 disabled (restart may be required)."

# 3) Enable Defender protections (where available)
try {
    Set-MpPreference -PUAProtection Enabled
    Set-MpPreference -DisableRealtimeMonitoring $false
    Set-MpPreference -SubmitSamplesConsent 1
    Set-MpPreference -MAPSReporting 2
    Write-Host "Defender baseline preferences applied."
} catch {
    Write-Warning "Defender settings could not be applied on this host."
}

# 4) Require NLA for RDP
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" `
    -Name "UserAuthentication" -PropertyType DWord -Value 1 -Force | Out-Null
Write-Host "RDP Network Level Authentication enforced (if RDP is used)."

Write-Host "== Hardening Completed =="
Write-Host "Recommendation: reboot the machine if SMBv1 was disabled."
