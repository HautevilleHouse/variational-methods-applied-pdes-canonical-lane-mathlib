import .VariationalProblemPackage

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure EulerLagrangeAnalysisPackage
    (P : VariationalProblemPackage) where
  firstVariationFormula : Prop
  strongFormPDE : Prop
  notionOfSolution : Prop
  boundaryTerms : Prop

structure EulerLagrangeAnalysisEvidence
    {P : VariationalProblemPackage}
    (E : EulerLagrangeAnalysisPackage P) where
  firstVariationFormulaClosed : E.firstVariationFormula
  strongFormPDEClosed : E.strongFormPDE
  notionOfSolutionClosed : E.notionOfSolution
  boundaryTermsClosed : E.boundaryTerms

def EulerLagrangeAnalysisClosed
    {P : VariationalProblemPackage}
    (E : EulerLagrangeAnalysisPackage P) : Prop :=
  E.firstVariationFormula ∧ E.strongFormPDE ∧ E.notionOfSolution ∧ E.boundaryTerms

theorem euler_lagrange_analysis_closed_from_evidence
    {P : VariationalProblemPackage}
    (E : EulerLagrangeAnalysisPackage P)
    (Ev : EulerLagrangeAnalysisEvidence E) : EulerLagrangeAnalysisClosed E := by
  exact And.intro Ev.firstVariationFormulaClosed
    (And.intro Ev.strongFormPDEClosed
      (And.intro Ev.notionOfSolutionClosed Ev.boundaryTermsClosed))

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse