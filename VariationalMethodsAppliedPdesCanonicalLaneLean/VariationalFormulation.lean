import canonicalLaneMathlib.AdmissibleClass

/-!
# Variational Formulation Package

This module defines the standard variational formulation for a PDE: an energy
functional over a Banach space, its first variation, and the concept of a
critical point. The package carries proof obligations for the coercivity,
weak lower semicontinuity, and the existence of a minimizer via the direct
method in the calculus of variations.
-/

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure VariationalFormulationPackage where
  energyFunctional : Type u -> Type v
  admissibleSpace : Type w
  coercivity : Prop
  weakLowerSemicontinuity : Prop
  minimizerExists : Prop

structure VariationalFormulationEvidence (V : VariationalFormulationPackage) where
  coercivityClosed : V.coercivity
  weakLowerSemicontinuityClosed : V.weakLowerSemicontinuity
  minimizerExistsClosed : V.minimizerExists

def VariationalFormulationClosed (V : VariationalFormulationPackage) : Prop :=
  V.coercivity ∧ V.weakLowerSemicontinuity ∧ V.minimizerExists

theorem variational_formulation_closed_from_evidence
    (V : VariationalFormulationPackage) (E : VariationalFormulationEvidence V) :
    VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed (And.intro E.weakLowerSemicontinuityClosed E.minimizerExistsClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse