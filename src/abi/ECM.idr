-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Jonathan D.A. Jewell (hyperpolymath) <j.d.a.jewell@open.ac.uk>
-- Owner: Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk>
--
-- ECM.idr — spectrum-awareness signal types with spectral validity proofs.
--
-- DEFENSIVE USE ONLY — signal analysis types for spectrum monitoring.

module ECM

import Types

%default total

||| Signal power in milliwatts, bounded to simulation limits.
||| Maximum 100 mW for nominal simulation use, 1000 mW for calibration.
public export
data SimPower : Type where
  MkSimPower : (mw : Nat) -> {auto prf : LTE mw 1000} -> SimPower

||| Nominal simulation power limit (100 mW).
public export
data OpPower : Type where
  MkOpPower : (mw : Nat) -> {auto prf : LTE mw 100} -> OpPower

||| A detected signal with all required fields.
public export
record DetectedSignal where
  constructor MkDetected
  frequency   : Frequency
  modulation  : Modulation
  signalClass : SignalClass
  power       : SimPower

||| Proof that a detected signal is within nominal simulation power limits.
||| This type witness can only be constructed for signals <= 100 mW.
public export
data WithinOpLimits : DetectedSignal -> Type where
  IsOpSafe : {sig : DetectedSignal} ->
             (prf : LTE (case sig.power of MkSimPower mw => mw) 100) ->
             WithinOpLimits sig

||| Spectrum snapshot — a collection of detected signals.
public export
record SpectrumSnapshot where
  constructor MkSnapshot
  signals : List DetectedSignal

||| Check if any suspected intentional-disruption class is present in a snapshot.
public export
hasJamming : SpectrumSnapshot -> Bool
hasJamming snap = any isSuspectedDisruption snap.signals
  where
    isSuspectedDisruption : DetectedSignal -> Bool
    isSuspectedDisruption sig = case sig.signalClass of
      SuspectedJammer => True
      _               => False
