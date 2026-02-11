# Architecture (Enterprise Windows Vulnerability Management & Hardening Lab)

## 1. Purpose
This lab simulates a realistic Windows enterprise environment to practice:
- Vulnerability and configuration assessments
- Risk-based prioritization
- Remediation planning
- System hardening (PowerShell + GPO-aligned baseline)
- Post-remediation verification with evidence

The architecture is intentionally small but mirrors how security teams manage Windows environments at scale.

---

## 2. Scope (Windows-only)
**In-scope systems**
- Windows Server (Domain Controller)
- Windows Server (Member Server)
- Windows 10/11 Endpoint (Domain-joined)

**In-scope controls**
- Group Policy security baselines (documented / optionally enforced)
- Windows Firewall configuration
- Microsoft Defender baseline
- Protocol hardening (e.g., SMBv1 removal)
- Remote access hardening (RDP NLA when applicable)

---

## 3. Components & Roles

### 3.1 DC01 — Domain Controller (Tier 0)
**Role:** Identity and policy control plane.  
**Key services:**
- Active Directory Domain Services (AD DS)
- DNS
- Group Policy Objects (GPO)

**Why it matters:** The DC is the highest-value Windows asset in most environments, so it is treated as **highest criticality**.

---

### 3.2 SVR01 — Member Server (Tier 1)
**Role:** Represents a typical Windows server workload (app/file/web optional).  
**Why it matters:** Common lateral movement target; must follow secure baselines (protocols, firewall, access control).

---

### 3.3 WIN11-01 — Endpoint (Tier 2)
**Role:** Represents a user workstation.  
**Key controls:**
- Microsoft Defender Antivirus
- Windows Firewall
- Optional: Sysmon for additional telemetry

**Why it matters:** Endpoints are frequent initial access points and must be hardened consistently.

---

### 3.4 Administrative Role (Security Admin)
**Role:** Executes the security lifecycle using scripted automation:
- `audit.ps1` (baseline posture)
- `harden.ps1` (apply controls)
- `verify.ps1` (post-remediation validation)

This reflects real security engineering practice: standardization, repeatability, and evidence collection.

---

## 4. Logical Topology

### 4.1 Infrastructure + Controls (Clear View)
```mermaid
flowchart TB

    subgraph Infrastructure
        DC["DC01\nActive Directory\nDNS + GPO"]
        SVR["SVR01\nMember Server"]
        WIN["WIN11-01\nUser Endpoint"]
    end

    subgraph Security_Controls
        DEF["Microsoft Defender"]
        FW["Windows Firewall"]
        GPO["Security Baseline via GPO"]
    end

    subgraph Administration
        ADMIN["Security Administrator\n(PowerShell Scripts)"]
    end

    DC --> SVR
    DC --> WIN

    GPO --> SVR
    GPO --> WIN

    DEF --> WIN
    FW --> SVR
    FW --> WIN

    ADMIN --> DC
    ADMIN --> SVR
    ADMIN --> WIN


Domain join is configured for SVR01 and WIN11-01.

Defender is available on endpoint and server (where supported).

Hardening actions are designed to be safe defaults, but should be reviewed before applying in production.
