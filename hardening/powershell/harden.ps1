# Hardening Script
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
Set-MpPreference -PUAProtection Enabled
