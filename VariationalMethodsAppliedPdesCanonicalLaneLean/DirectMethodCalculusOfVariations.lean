import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure DirectMethodPackage where
  functional : Type u
  admissibleSpace : Type v
  lowerSemicontinuity : Prop
  coercivity : Prop
  existenceMinimizer : Prop

structure DirectMethodEvidence (D : DirectMethodPackage) where
  lowerSemicontinuityClosed : D.lowerSemicontinuity
  coercivityClosed : D.coercivity
  existenceMinimizerClosed : D.existenceMinimizer

def DirectMethodClosed (D : DirectMethodPackage) : Prop :=
  D.lowerSemicontinuity ∧ D.coercivity ∧ D.existenceMinimizer

theorem direct_method_closed_from_evidence (D : DirectMethodPackage)
    (E : DirectMethodEvidence D) : DirectMethodClosed D := by
  exact And.intro E.lowerSemicontinuityClosed
    (And.intro E.coercivityClosed E.existenceMinimizerClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse