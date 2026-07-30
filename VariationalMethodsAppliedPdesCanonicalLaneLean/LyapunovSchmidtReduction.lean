import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure LyapunovSchmidtReductionPackage where
  operator : Type u
  bifurcationParameter : Type v
  reducedEquation : Prop
  spectralGap : Prop
  bifurcationPointIdentified : Prop

structure LyapunovSchmidtReductionEvidence (L : LyapunovSchmidtReductionPackage) where
  reducedEquationClosed : L.reducedEquation
  spectralGapClosed : L.spectralGap
  bifurcationPointIdentifiedClosed : L.bifurcationPointIdentified

def LyapunovSchmidtReductionClosed (L : LyapunovSchmidtReductionPackage) : Prop :=
  L.reducedEquation ∧ L.spectralGap ∧ L.bifurcationPointIdentified

theorem lyapunov_schmidt_reduction_closed_from_evidence
    (L : LyapunovSchmidtReductionPackage)
    (E : LyapunovSchmidtReductionEvidence L) : LyapunovSchmidtReductionClosed L := by
  exact And.intro E.reducedEquationClosed
    (And.intro E.spectralGapClosed E.bifurcationPointIdentifiedClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse