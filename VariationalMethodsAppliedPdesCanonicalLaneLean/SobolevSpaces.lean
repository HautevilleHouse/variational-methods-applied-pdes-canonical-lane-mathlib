import HautevilleHouse.VariationalMethodsAppliedPdesCanonicalLaneLean.MountainPass

/-!
# Sobolev Spaces Embedding Package
-/

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure SobolevEmbeddingPackage {D : DirectMethodPackage} {E : EulerLagrangePackage D} {M : MountainPassPackage D E} where
  sobolevInequalities : Prop
  compactEmbedding : Prop
  traceTheorems : Prop

structure SobolevEmbeddingEvidence {D : DirectMethodPackage} {E : EulerLagrangePackage D} {M : MountainPassPackage D E} (S : SobolevEmbeddingPackage D E M) where
  sobolevInequalitiesClosed : S.sobolevInequalities
  compactEmbeddingClosed : S.compactEmbedding
  traceTheoremsClosed : S.traceTheorems

def SobolevEmbeddingClosed {D : DirectMethodPackage} {E : EulerLagrangePackage D} {M : MountainPassPackage D E} (S : SobolevEmbeddingPackage D E M) : Prop :=
  S.sobolevInequalities ∧ S.compactEmbedding ∧ S.traceTheorems

theorem sobolev_embedding_closed_from_evidence {D : DirectMethodPackage} {E : EulerLagrangePackage D} {M : MountainPassPackage D E} (S : SobolevEmbeddingPackage D E M) (Ev : SobolevEmbeddingEvidence S) :
    SobolevEmbeddingClosed S := by
  exact And.intro Ev.sobolevInequalitiesClosed
    (And.intro Ev.compactEmbeddingClosed Ev.traceTheoremsClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse