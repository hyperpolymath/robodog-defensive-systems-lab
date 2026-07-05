<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
<!-- Owner: Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk> -->
<!-- Copyright (c) 2026 Jonathan D.A. Jewell (hyperpolymath) <j.d.a.jewell@open.ac.uk> -->

# Export Control and Publication-Safety Notice

This repository is published as a non-operational defensive research repository.
It is limited to synthetic simulation, communications-resilience experiments,
secure coordination research, formation-safety checks, safe-state behaviour, and
formal/interface safety boundaries.

Hardware-facing, RF-facing, field-test, or deployment-oriented work is outside
the public repository boundary unless separately reviewed for safety, legality,
and export-control compliance.

## Classification

This repository contains research artifacts that may be dual-use and may be
subject to export control regulations, including:

- **UK Export Control Act 2002** and Strategic Export Control Lists
- **Wassenaar Arrangement** Category 5 (Information Security) and, for compliance review only, Category 11 contexts involving restricted electronics
- **US ITAR** (International Traffic in Arms Regulations) — for reference only; UK law governs
- **US EAR** (Export Administration Regulations) — for reference only; UK law governs

### Technology Categories Present

| Category | Description | Control Status |
|----------|-------------|----------------|
| Defensive spectrum-awareness | Synthetic signal-environment modelling and interference classification | Dual-use review required |
| Post-quantum cryptography | ML-KEM, ML-DSA, and SLH-DSA protocol experiments | Potentially controlled (Cat 5A2) |
| Formation-safety checks | Distributed coordination safety for robotic systems | Dual-use review required |
| Autonomy safety | Collision avoidance, communication-loss handling, and safe-state behaviour | Dual-use review required |

## Defensive Use and Publication Boundary

### Permitted Uses

1. **Synthetic signal-environment modelling** — simulation-only research data
2. **Communications resilience** — degradation testing for authorised systems
3. **Secure communications research** — post-quantum protocol design and analysis
4. **Formation-safety analysis** — separation checks and bounded coordination
5. **Safe-state research** — communication-loss and fault-response boundaries
6. **Civil resilience research** — search-and-rescue and disaster-response coordination in lawful, authorised settings
7. **Academic research** — published defensive safety and resilience studies

### Explicitly Prohibited Uses

1. **Weapons development** — weapon-control, payload-control, target acquisition, kill chains, or lethal autonomy
2. **Surveillance or tracking of individuals** — profiling, monitoring, or target-selection workflows
3. **Unlawful interference with communications** — including real-world jamming or disruption of civilian, emergency, or unauthorised systems
4. **Offensive autonomous behaviour** — evasion, intrusion, or systems that decide to use force
5. **Export to embargoed or sanctioned entities** — per UK/EU/UN sanctions lists
6. **Deployment by restricted or unlawful end users**

## Contributor Requirements

### Before Contributing

All contributors must:

1. **Acknowledge** this export control policy by including in their first commit message:
   ```
   Export-Control-Acknowledged: yes
   ```

2. **Verify** they are not acting on behalf of any entity on:
   - UK Consolidated List of Financial Sanctions Targets
   - EU Consolidated Sanctions List
   - UN Security Council Sanctions Committees lists

3. **Ensure** their contributions stay within the repository publication boundary

### Code Review Requirements

All pull requests involving the following must receive explicit export control review:

- New cryptographic algorithm implementations
- Signal processing, synthetic spectrum-awareness, or anomaly-classification modules
- Autonomous safety or safe-state logic
- Formation control or swarm coordination protocols
- Any hardware-facing, RF-facing, field-test, or deployment-oriented work

## Technical Controls

### Source-Level Annotations

All modules that handle controlled technology must include the annotation:

```rust
//! DEFENSIVE USE ONLY — spectrum-awareness and resilience research.
//! Export control classification: Wassenaar Category [X], UK ML [Y].
//! See EXPORT-CONTROL.md for compliance requirements.
```

### Build-Time Verification

The `Trustfile.a2ml` includes checks that:

- No offensive capability markers exist in source code
- Core modules declare defensive-use-only intent
- Export control documentation is present and current

### CI/CD Enforcement

The `hypatia-scan` workflow includes export control scanning rules that flag:

- Offensive terminology in code, comments, or documentation
- Undocumented cryptographic implementations
- Missing defensive-use annotations on controlled modules

## Licensing Interaction

The MPL-2.0 license does **not** override export control obligations.
Even though the source code is publicly available under an open license, users
remain responsible for compliance with all applicable export control laws in
their jurisdiction.

## Contact

For export control queries:

- **Author:** Jonathan D.A. Jewell
- **Email:** j.d.a.jewell@open.ac.uk
- **Institution:** The Open University

## Document History

| Date | Change |
|------|--------|
| 2026-03-16 | Initial export control framework for v0.1 |
