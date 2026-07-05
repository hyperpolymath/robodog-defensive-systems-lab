<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
<!-- Owner: Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk> -->
<!-- TOPOLOGY.md — Project architecture map and completion dashboard -->
<!-- Last updated: 2026-07-05 -->

# robodog-defensive-systems-lab — Project Topology

Publication boundary: this topology describes synthetic simulation,
communications resilience, secure coordination, and autonomy-safety research.
It is not a deployment architecture for fielded RF, surveillance, weapon, or
restricted-end-user systems.

## System Architecture

```
                    ┌─────────────────────────────────────────────┐
                    │      SIMULATION / RESEARCH CONTROL           │
                    │      (Synthetic Scenario Interface)          │
                    └──────────────────┬──────────────────────────┘
                                       │
                                       ▼
                    ┌─────────────────────────────────────────────┐
                    │          ZIG API + FFI BRIDGE                │
                    │        ffi/zig/src/main.zig                 │
                    │    C-ABI ← generated/abi/robodog_ffi.h      │
                    └──────────────────┬──────────────────────────┘
                                       │
          ┌────────────────────────────┼────────────────────────────┐
          │                            │                            │
          ▼                            ▼                            ▼
┌──────────────────┐  ┌────────────────────────┐  ┌──────────────────────┐
│   RUST CORE      │  │   SPARK SAFETY         │  │   IDRIS2 ABI         │
│                  │  │                        │  │                      │
│  ecm/            │  │  ecm_safety.ads/adb    │  │  Types.idr           │
│   signals.rs     │  │  formation_safety.*    │  │  ECM.idr             │
│   detection.rs   │  │  autonomy_safety.*     │  │  Crypto.idr          │
│  crypto/         │  │                        │  │  Formation.idr       │
│  formation/      │  │  Proven: bounds,       │  │  Foreign.idr         │
│  autonomy/       │  │  separation, comms     │  │                      │
│                  │  │  loss, safe-state      │  │  Dependent types:    │
│  PQ crypto,      │  │                        │  │  key sizes, bands,   │
│  synthetic FFT,  │  │  No: Suppress,         │  │  no offensive types  │
│  formation geom, │  │  Unchecked_*,          │  │                      │
│  collision avoid │  │  believe_me            │  │  No: partial,        │
└──────────────────┘  └────────────────────────┘  │  believe_me,         │
                                                   │  assert_total        │
                                                   └──────────────────────┘

┌─────────────────────────────────────────────────────────────────────┐
│                    REPO INFRASTRUCTURE                               │
│  EXPORT-CONTROL.md    Trustfile.a2ml    run-checks.sh               │
│  .machine_readable/   0-AI-MANIFEST     Justfile                    │
│  .github/workflows/   contractiles/     TOPOLOGY.md                 │
└─────────────────────────────────────────────────────────────────────┘
```

## Completion Dashboard

```
COMPONENT                          STATUS              NOTES
─────────────────────────────────  ──────────────────  ─────────────────────────────────
RUST CORE (src/rust/)
  Synthetic Spectrum Awareness       ████░░░░░░  40%    Synthetic signals, classification, FFT spectrum
  Cryptographic Protocols           ████░░░░░░  40%    ML-KEM, ML-DSA, SLH-DSA-family wrappers
  Formation Control Algorithms      ████░░░░░░  40%    5 shapes, separation checks
  Defensive Autonomy Logic          ████░░░░░░  40%    Collision avoid, safe-state, comms

SPARK SAFETY (src/spark/)
  Spectrum-Awareness Safety Specs   ███░░░░░░░  30%    Band bounds, power limits
  Formation Safety Proofs           ███░░░░░░░  30%    Separation distance
  Autonomy Safety Proofs            ███░░░░░░░  30%    Comms timeout, speed, safe-state

IDRIS2 ABI (src/abi/)
  Core Types                        ████░░░░░░  40%    Frequency, modulation, signals
  Spectrum-Awareness Types          ████░░░░░░  40%    Power bounds, synthetic snapshots
  Crypto Types                      ████░░░░░░  40%    Key sizes, PQ algorithms
  Formation Types                   ███░░░░░░░  30%    Coordinates, separation proofs
  FFI Declarations                  ███░░░░░░░  30%    Zig bridge bindings

ZIG API + FFI (ffi/zig/)
  Signal Classification             ████░░░░░░  40%    3 rules, band checking
  Distance / Separation             █████░░░░░  50%    Ground + aerial, integer math
  Formation Computation             ███░░░░░░░  30%    Line + circle, rest TBD
  Spectrum-Awareness API            ████░░░░░░  40%    Type mirror, classify, recommend
  ABI Verification Types            ███░░░░░░░  30%    Round-trip proofs

INFRASTRUCTURE
  Export Control Framework          ██████████ 100%    Compliance and publication-safety context
  Trustfile.a2ml                    ██████████ 100%    Repository trust and safety-boundary checks
  .machine_readable/                ██████████ 100%    STATE tracking active
  0-AI-MANIFEST.a2ml                ██████████ 100%    AI entry point verified
  Generated C Header                ██████████ 100%    robodog_ffi.h

REPO INFRASTRUCTURE
  Justfile Automation               ████████░░  80%    Build tasks configured
  CI/CD Workflows                   ██████████ 100%    17 standard workflows
  Publication Boundary              ██████████ 100%    Defensive research scope documented

─────────────────────────────────────────────────────────────────────────────
OVERALL:                            ████░░░░░░  ~40%   v0.1 Foundation
```

## Language Stack

```
           ┌─────────────────────┐
           │   zig (API)      │  Consumer-facing
           └──────────┬──────────┘
           ┌──────────┼──────────┐
           │   ZIG (FFI)         │  C-ABI bridge
           └──────────┬──────────┘
    ┌─────────────────┼─────────────────┐
    │                 │                 │
┌───┴────┐     ┌──────┴──────┐    ┌────┴─────┐
│  RUST  │     │   SPARK     │    │  IDRIS2  │
│ (Core) │     │  (Safety)   │    │  (ABI)   │
└────────┘     └─────────────┘    └──────────┘
```

## Key Dependencies

```
IDRIS2 ABI ──defines──► ZIG FFI ──bridges──► RUST CORE
     │                     │                    │
     │                     │                    │
     ▼                     ▼                    ▼
SPARK SAFETY ◄──proves── FORMATION ──uses──► AUTONOMY
     │                                          │
     ▼                                          ▼
EXPORT CONTROL ──────────────────────────► zig API
```

## Update Protocol

This file is maintained by both humans and AI agents. When updating:

1. **After completing a component**: Change its bar and percentage
2. **After adding a component**: Add a new row in the appropriate section
3. **After architectural changes**: Update the ASCII diagram
4. **Date**: Update the `Last updated` comment at the top of this file

Progress bars use: `█` (filled) and `░` (empty), 10 characters wide.
Percentages: 0%, 10%, 20%, ... 100% (in 10% increments).
