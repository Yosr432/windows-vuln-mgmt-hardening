<# 
Audit Windows security posture (baseline).
Outputs JSON + CSV-friendly objects.
Run as Administrator for best results.
#>

$ErrorActionPreference = "SilentlyContinue"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$outDir = Join-Path $PSScriptRoot "..\..\findings"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

function Get-RegValue($Path, $Name) {
    try { (Get-ItemProperty -Path $Path -Name $Name).$Name } catch { $null }
}

$computer = $env:COMPUTERNAME

# Firewall
$fwProfiles = Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction

# SMBv1
$smb1 = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State

# RDP + NLA
$rdpEnabled = Get-RegValue "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" "fDenyTSConnections"
# fDenyTSConnections: 0 means enabled, 1 means disabled
$nla = Get-RegValue "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" "UserAuthentication"

# Defender (basic status)
$defStatus = $null
try { $defStatus = Get-MpComputerStatus | Select-Object AMServiceEnabled, AntivirusEnabled, RealTimeProtectionEnabled, IoavProtectionEnabled, NISEnabled, BehaviorMonitorEnabled } catch {}

# BitLocker
$bitlocker = $null
try { $bitlocker = Get-BitLockerVolume | Select-Object MountPoint, VolumeStatus, ProtectionStatus, EncryptionPercentage } catch {}

# Local Admins
$localAdmins = $null
try {
    $localAdmins = (Get-LocalGroupMember -Group "Administrators" | Select-Object Name, ObjectClass)
} catch {}

# Windows Update quick signal
$hotfixCount = (Get-HotFix | Measure-Object).Count

$result = [PSCustomObject]@{
    Hostname = $computer
    Timestamp = (Get-Date).ToString("s")
    FirewallProfiles = $fwProfiles
    SMB1_State = $smb1.State
    RDP_fDenyTSConnections = $rdpEnabled
    RDP_NLA_UserAuthentication = $nla
    DefenderStatus = $defStatus
    BitLocker = $bitlocker
    LocalAdministrators = $localAdmins
    InstalledHotfixCount = $hotfixCount
}

$jsonPath = Join-Path $outDir "$computer-audit-$ts.json"
$result | ConvertTo-Json -Depth 6 | Out-File -Encoding UTF8 $jsonPath

Write-Host "Audit complete: $jsonPath"
