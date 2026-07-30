import HautevilleHouse.VariationalMethodsAppliedPdesCanonicalLaneLean.AdmissibleClass

/-!
# Direct Method in Calculus of Variations Package
-/

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure DirectMethodPackage where
  functional : Type -> Prop
  coercivity : Prop
  weakLowerSemicontinuity : Prop
  minimizerExistence : Prop
  minimizerRegularity : Prop

structure DirectMethodEvidence (D : DirectMethodPackage) where
  coercivityClosed : D.coercivity
  weakLowerSemicontinuityClosed : D.weakLowerSemicontinuity
  minimizerExistenceClosed : D.minimizerExistence
  minimizerRegularityClosed : D.minimizerRegularity

def DirectMethodClosed (D : DirectMethodPackage) : Prop :=
  D.coercivity ∧ D.weakLowerSemicontinuity ∧ D.minimizerExistence ∧ D.minimizerRegularity

theorem direct_method_closed_from_evidence (D : DirectMethodPackage) (E : DirectMethodEvidence D) :
    DirectMethodClosed D := by
  exact And.intro E.coercivityClosed
    (And.intro E.weakLowerSemicontinuityClosed
      (And.intro E.minimizerExistenceClosed E.minimizerRegularityClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse