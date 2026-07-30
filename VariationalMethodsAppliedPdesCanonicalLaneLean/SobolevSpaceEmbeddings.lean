import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure SobolevSpacePackage where
  exponent : ℝ
  domainDimension : ℕ
  embeddingContinuous : Prop
  embeddingCompact : Prop
  criticalExponent : Prop

structure SobolevSpaceEvidence (P : SobolevSpacePackage) where
  embeddingContinuousClosed : P.embeddingContinuous
  embeddingCompactClosed : P.embeddingCompact
  criticalExponentClosed : P.criticalExponent

def SobolevSpaceClosed (P : SobolevSpacePackage) : Prop :=
  P.embeddingContinuous ∧ P.embeddingCompact ∧ P.criticalExponent

theorem sobolev_space_closed_from_evidence (P : SobolevSpacePackage)
    (E : SobolevSpaceEvidence P) : SobolevSpaceClosed P := by
  exact And.intro E.embeddingContinuousClosed
    (And.intro E.embeddingCompactClosed E.criticalExponentClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse