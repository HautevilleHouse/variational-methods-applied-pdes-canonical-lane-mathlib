import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure EulerLagrangePackage where
  lagrangian : Type u
  configurationSpace : Type v
  eulerLagrangeEquation : Prop
  ellipticity : Prop
  boundaryConditions : Prop

structure EulerLagrangeEvidence (E : EulerLagrangePackage) where
  eulerLagrangeEquationClosed : E.eulerLagrangeEquation
  ellipticityClosed : E.ellipticity
  boundaryConditionsClosed : E.boundaryConditions

def EulerLagrangeClosed (E : EulerLagrangePackage) : Prop :=
  E.eulerLagrangeEquation ∧ E.ellipticity ∧ E.boundaryConditions

theorem euler_lagrange_closed_from_evidence (Epkg : EulerLagrangePackage)
    (E : EulerLagrangeEvidence Epkg) : EulerLagrangeClosed Epkg := by
  exact And.intro E.eulerLagrangeEquationClosed
    (And.intro E.ellipticityClosed E.boundaryConditionsClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse