# Risk Scoring Model

## Objective
To prioritize remediation efforts based on risk rather than technical severity alone.

---

## Risk Formula

Risk Score = Severity (1–5) × Criticality (1–5) × Exposure (1–3)

---

## Definitions

### Severity (1–5)
Represents technical impact and exploitability.

1 – Informational  
3 – Moderate weakness  
5 – High exploitation potential  

---

### Asset Criticality (1–5)
Represents business/system importance.

1 – Low-value endpoint  
3 – Important internal server  
5 – Domain Controller / Core Infrastructure  

---

### Exposure (1–3)

1 – Internal, limited access  
2 – Internal, broadly reachable  
3 – Internet-facing / remote accessible  

---

## Example Calculation

Finding: SMBv1 enabled on Domain Controller  
Severity: 5  
Criticality: 5  
Exposure: 2  

Risk Score = 5 × 5 × 2 = 50  

→ High priority remediation

---

## Prioritization Guidance

| Risk Score | Priority Level |
|------------|----------------|
| 40–75      | Immediate action |
| 20–39      | High priority |
| 10–19      | Medium priority |
| 1–9        | Low priority |
