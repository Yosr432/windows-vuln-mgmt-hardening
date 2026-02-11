<# 
Re-run audit and summarize key deltas.
#>

$ErrorActionPreference = "SilentlyContinue"
$computer = $env:COMPUTERNAME

Write-Host "Running post-remediation audit..."
& "$PSScriptRoot\audit.ps1" | Out-Null

Write-Host "Verification quick checks:"
$smb1 = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Write-Host ("SMB1 State: " + $smb1.State)

$fw = Get-NetFirewallProfile | Select-Object Name, Enabled
$fw | Format-Table -AutoSize

try {
  $def = Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, BehaviorMonitorEnabled
  $def | Format-List
} catch {
  Write-Host "Defender status not available."
}

