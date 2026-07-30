import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure SobolevEmbeddingPackage where
  domain : Type u
  codomain : Type v
  sobolevExponent : ℝ
  embeddingContinuous : Prop
  compactEmbedding : Prop
  embeddingConstants : Prop

structure SobolevEmbeddingEvidence (S : SobolevEmbeddingPackage) where
  embeddingContinuousClosed : S.embeddingContinuous
  compactEmbeddingClosed : S.compactEmbedding
  embeddingConstantsClosed : S.embeddingConstants

def SobolevEmbeddingClosed (S : SobolevEmbeddingPackage) : Prop :=
  S.embeddingContinuous ∧ S.compactEmbedding ∧ S.embeddingConstants

theorem sobolev_embedding_closed_from_evidence (S : SobolevEmbeddingPackage)
    (E : SobolevEmbeddingEvidence S) : SobolevEmbeddingClosed S := by
  exact And.intro E.embeddingContinuousClosed
    (And.intro E.compactEmbeddingClosed E.embeddingConstantsClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse