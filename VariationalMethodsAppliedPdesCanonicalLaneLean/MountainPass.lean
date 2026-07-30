import HautevilleHouse.VariationalMethodsAppliedPdesCanonicalLaneLean.EulerLagrange

/-!
# Mountain Pass Theorem Package
-/

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure MountainPassPackage {D : DirectMethodPackage} {E : EulerLagrangePackage D} where
  palaisSmaleCondition : Prop
  mountainPassGeometry : Prop
  criticalPointExistence : Prop
  criticalPointRegularity : Prop

structure MountainPassEvidence {D : DirectMethodPackage} {E : EulerLagrangePackage D} (M : MountainPassPackage D E) where
  palaisSmaleConditionClosed : M.palaisSmaleCondition
  mountainPassGeometryClosed : M.mountainPassGeometry
  criticalPointExistenceClosed : M.criticalPointExistence
  criticalPointRegularityClosed : M.criticalPointRegularity

def MountainPassClosed {D : DirectMethodPackage} {E : EulerLagrangePackage D} (M : MountainPassPackage D E) : Prop :=
  M.palaisSmaleCondition ∧ M.mountainPassGeometry ∧ M.criticalPointExistence ∧ M.criticalPointRegularity

theorem mountain_pass_closed_from_evidence {D : DirectMethodPackage} {E : EulerLagrangePackage D} (M : MountainPassPackage D E) (Ev : MountainPassEvidence M) :
    MountainPassClosed M := by
  exact And.intro Ev.palaisSmaleConditionClosed
    (And.intro Ev.mountainPassGeometryClosed
      (And.intro Ev.criticalPointExistenceClosed Ev.criticalPointRegularityClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse