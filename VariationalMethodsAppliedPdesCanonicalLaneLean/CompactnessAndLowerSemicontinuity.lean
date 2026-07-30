import .VariationalProblemPackage

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure CompactnessAndLowerSemicontinuityPackage
    (P : VariationalProblemPackage) where
  coercivity : Prop
  weakLowerSemicontinuity : Prop
  minimizerExistence : Prop

structure CompactnessAndLowerSemicontinuityEvidence
    {P : VariationalProblemPackage}
    (C : CompactnessAndLowerSemicontinuityPackage P) where
  coercivityClosed : C.coercivity
  weakLowerSemicontinuityClosed : C.weakLowerSemicontinuity
  minimizerExistenceClosed : C.minimizerExistence

def CompactnessAndLowerSemicontinuityClosed
    {P : VariationalProblemPackage}
    (C : CompactnessAndLowerSemicontinuityPackage P) : Prop :=
  C.coercivity ∧ C.weakLowerSemicontinuity ∧ C.minimizerExistence

theorem compactness_and_lower_semicontinuity_closed_from_evidence
    {P : VariationalProblemPackage}
    (C : CompactnessAndLowerSemicontinuityPackage P)
    (E : CompactnessAndLowerSemicontinuityEvidence C) :
    CompactnessAndLowerSemicontinuityClosed C := by
  exact And.intro E.coercivityClosed
    (And.intro E.weakLowerSemicontinuityClosed E.minimizerExistenceClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse