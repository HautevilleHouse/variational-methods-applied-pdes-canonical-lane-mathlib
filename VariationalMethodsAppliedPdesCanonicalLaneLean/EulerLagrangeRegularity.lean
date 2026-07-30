import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure EulerLagrangeRegularityPackage where
  minimizer : Type
  pdeSatisfied : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  higherRegularity : Prop

structure EulerLagrangeRegularityEvidence
    (E : EulerLagrangeRegularityPackage) where
  pdeSatisfiedClosed : E.pdeSatisfied
  interiorRegularityClosed : E.interiorRegularity
  boundaryRegularityClosed : E.boundaryRegularity
  higherRegularityClosed : E.higherRegularity

def EulerLagrangeRegularityClosed (E : EulerLagrangeRegularityPackage) : Prop :=
  E.pdeSatisfied ∧ E.interiorRegularity ∧
  E.boundaryRegularity ∧ E.higherRegularity

theorem euler_lagrange_regularity_closed_from_evidence
    (E : EulerLagrangeRegularityPackage)
    (Ev : EulerLagrangeRegularityEvidence E) :
    EulerLagrangeRegularityClosed E := by
  exact And.intro Ev.pdeSatisfiedClosed
    (And.intro Ev.interiorRegularityClosed
      (And.intro Ev.boundaryRegularityClosed Ev.higherRegularityClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse