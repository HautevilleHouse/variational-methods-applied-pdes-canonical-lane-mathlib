import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure EulerLagrangePackage where
  functional : Type
  firstVariation : Prop
  eulerLagrangeEquation : Prop
  firstVariationClosed : firstVariation
  eulerLagrangeEquationClosed : eulerLagrangeEquation

def EulerLagrangeClosed (E : EulerLagrangePackage) : Prop :=
  E.firstVariation ∧ E.eulerLagrangeEquation

theorem euler_lagrange_closed_from_evidence (E : EulerLagrangePackage) (h : E.firstVariation ∧ E.eulerLagrangeEquation) :
    EulerLagrangeClosed E := h

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse
