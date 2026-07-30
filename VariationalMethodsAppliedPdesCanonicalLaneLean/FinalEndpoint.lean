import .VariationalProblemPackage
import .CompactnessAndLowerSemicontinuity
import .EulerLagrangeAnalysis

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure FinalEndpointPackage
    (P : VariationalProblemPackage)
    (C : CompactnessAndLowerSemicontinuityPackage P)
    (E : EulerLagrangeAnalysisPackage P) where
  minimizerSolvesEulerLagrange : Prop
  regularityFromEulerLagrange : Prop
  endpointReached : Prop

structure FinalEndpointEvidence
    {P : VariationalProblemPackage}
    {C : CompactnessAndLowerSemicontinuityPackage P}
    {E : EulerLagrangeAnalysisPackage P}
    (F : FinalEndpointPackage P C E) where
  minimizerSolvesEulerLagrangeClosed : F.minimizerSolvesEulerLagrange
  regularityFromEulerLagrangeClosed : F.regularityFromEulerLagrange
  endpointReachedClosed : F.endpointReached

def FinalEndpointClosed
    {P : VariationalProblemPackage}
    {C : CompactnessAndLowerSemicontinuityPackage P}
    {E : EulerLagrangeAnalysisPackage P}
    (F : FinalEndpointPackage P C E) : Prop :=
  F.minimizerSolvesEulerLagrange ∧ F.regularityFromEulerLagrange ∧ F.endpointReached

theorem final_endpoint_closed_from_evidence
    {P : VariationalProblemPackage}
    {C : CompactnessAndLowerSemicontinuityPackage P}
    {E : EulerLagrangeAnalysisPackage P}
    (F : FinalEndpointPackage P C E)
    (Ev : FinalEndpointEvidence F) : FinalEndpointClosed F := by
  exact And.intro Ev.minimizerSolvesEulerLagrangeClosed
    (And.intro Ev.regularityFromEulerLagrangeClosed Ev.endpointReachedClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse