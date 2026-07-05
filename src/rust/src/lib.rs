// SPDX-License-Identifier: MPL-2.0
// Copyright (c) 2026 Jonathan D.A. Jewell (hyperpolymath) <j.d.a.jewell@open.ac.uk>
// Owner: Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk>

//! # robodog-ecm — Defensive Spectrum-Awareness and Autonomy Safety
//!
//! DEFENSIVE USE ONLY — spectrum-awareness and resilience research.
//! Export control classification: Wassenaar Category 5A2 (Crypto), Category 11 review context.
//! See EXPORT-CONTROL.md for compliance requirements.
//!
//! This crate provides the core Rust implementation for:
//!
//! - **Synthetic spectrum-awareness** — synthetic signal modelling,
//!   interference classification, and resilience simulation. No real RF captures
//!   or hardware-facing interfaces are included.
//! - **Post-quantum cryptographic protocols** — ML-KEM, ML-DSA, and SLH-DSA
//!   family experiments through current wrapper names.
//! - **Formation control** — distributed coordination algorithms for multi-robot
//!   systems. Safety-oriented formations for SAR and disaster response research.
//! - **Defensive autonomy** — collision avoidance, anomaly response, safe-state
//!   transitions. All safety-critical logic has SPARK proof counterparts.

#![forbid(unsafe_code)]
pub mod autonomy;
pub mod crypto;
pub mod ecm;
pub mod formation;

/// Crate-level version, synchronised with Cargo.toml.
pub const VERSION: &str = env!("CARGO_PKG_VERSION");

/// Export control classification for this crate.
pub const EXPORT_CLASSIFICATION: &str = "Wassenaar Cat 5A2 / Cat 11 — Defensive Use Only";
