import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure DirectMethodPackage where
  functionalCoercive : Prop
  functionalLowerSemicontinuous : Prop
  minimizerExists : Prop
  eulerLagrangeEquation : Prop

structure DirectMethodEvidence (D : DirectMethodPackage) where
  coerciveClosed : D.functionalCoercive
  lowerSemicontinuousClosed : D.functionalLowerSemicontinuous
  minimizerExistsClosed : D.minimizerExists
  eulerLagrangeClosed : D.eulerLagrangeEquation

def DirectMethodClosed (D : DirectMethodPackage) : Prop :=
  D.functionalCoercive ∧ D.functionalLowerSemicontinuous ∧
  D.minimizerExists ∧ D.eulerLagrangeEquation

theorem direct_method_closed_from_evidence (D : DirectMethodPackage)
    (E : DirectMethodEvidence D) : DirectMethodClosed D := by
  exact And.intro E.coerciveClosed
    (And.intro E.lowerSemicontinuousClosed
      (And.intro E.minimizerExistsClosed E.eulerLagrangeClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse