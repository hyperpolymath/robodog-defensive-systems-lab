; SPDX-License-Identifier: MPL-2.0
;; guix.scm — GNU Guix package definition for robodog-ecm
;; Usage: guix shell -f guix.scm

(use-modules (guix packages)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "robodog-ecm")
  (version "0.1.0")
  (source #f)
  (build-system gnu-build-system)
  (synopsis "robodog-ecm")
  (description "robodog-defensive-systems-lab — defensive spectrum-awareness and autonomy-safety research.")
  (home-page "https://github.com/hyperpolymath/robodog-defensive-systems-lab")
  (license ((@@ (guix licenses) license) "MPL-2.0"
             "https://github.com/hyperpolymath/palimpsest-license")))
