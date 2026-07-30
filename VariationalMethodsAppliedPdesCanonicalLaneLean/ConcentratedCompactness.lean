import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure ConcentratedCompactnessPackage where
  sequenceBounded : Prop
  lossOfCompactnessCharacterized : Prop
  concentrationProfile : Prop
  defectMeasure : Prop

structure ConcentratedCompactnessEvidence (C : ConcentratedCompactnessPackage) where
  boundedClosed : C.sequenceBounded
  lossCharacterizedClosed : C.lossOfCompactnessCharacterized
  profileClosed : C.concentrationProfile
  defectClosed : C.defectMeasure

def ConcentratedCompactnessClosed (C : ConcentratedCompactnessPackage) : Prop :=
  C.sequenceBounded ∧ C.lossOfCompactnessCharacterized ∧
  C.concentrationProfile ∧ C.defectMeasure

theorem concentrated_compactness_closed_from_evidence
    (C : ConcentratedCompactnessPackage) (E : ConcentratedCompactnessEvidence C) :
    ConcentratedCompactnessClosed C := by
  exact And.intro E.boundedClosed
    (And.intro E.lossCharacterizedClosed
      (And.intro E.profileClosed E.defectClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse