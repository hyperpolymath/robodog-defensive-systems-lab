K9!
# SPDX-License-Identifier: MPL-2.0
# Owner: Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk>
# robodog-defensive-systems-lab — Template Hunt (K9/Nickel).
#
# This component defines automated dependency discovery and repository
# validation patterns for defensive research infrastructure.

leash = 'Kennel # Combined evaluation and execution monitoring.

pedigree = {
  schema_version = "1.0.0",
  name = "robodog-defensive-systems-lab-hunt-template",
  component_type = "recon-strategy",
  description = "Defines the search patterns for dependency-based vulnerability hunting.",
  security_level = "Hunt",
  signature_required = true,
}

# SEARCH PATTERNS: Defines the identifiers and markers to look for.
patterns = {
  # CRITICAL: Detect usage of deprecated or insecure crypto primitives.
  insecure_crypto = [
    "md5", "sha1", "des", "rc4",
  ],
  # POLICY: Find instances of non-standard FFI boundaries.
  unverified_ffi = [
    "extern \"C\"", "unsafe",
  ],
}

# EXECUTION HOOKS: Procedures to run when a pattern is matched.
hooks = {
  on_match = fun match_context =>
    let severity = if std.array.contains match_context.pattern patterns.insecure_crypto then 'Critical else 'Warning in
    {
      action = 'Flag,
      severity = severity,
      message = "Pattern '%{match_context.pattern}' detected in %{match_context.file}",
    }
}
