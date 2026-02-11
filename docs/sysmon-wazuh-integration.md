# Sysmon + Wazuh Integration Guide

## Install Sysmon
sysmon64.exe -accepteula -i sysmon-config.xml

## Configure Wazuh Agent (Windows)
Add to ossec.conf:

<localfile>
  <location>Microsoft-Windows-Sysmon/Operational</location>
  <log_format>eventchannel</log_format>
</localfile>

Restart Wazuh agent.

## Test Detection
powershell -Command "Get-Process"
ping 8.8.8.8
New-Item C:\Temp\sysmon_test.txt

Verify on Wazuh Manager:
/var/ossec/logs/archives/archives.json
/var/ossec/logs/alerts/alerts.json

Optional custom detection rule:

<rule id="100200" level="10">
  <if_group>sysmon</if_group>
  <field name="win.system.eventID">1</field>
  <match>powershell.exe</match>
  <description>Sysmon: PowerShell execution detected</description>
</rule>
