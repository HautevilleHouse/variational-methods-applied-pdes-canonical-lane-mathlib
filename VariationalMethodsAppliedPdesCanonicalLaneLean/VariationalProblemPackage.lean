import .AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure VariationalProblemPackage where
  functional : Type u
  admissibleSpace : Type v
  eulerLagrangeEquation : Prop
  existenceMinimizer : Prop
  regularityOfMinimizer : Prop

structure VariationalProblemEvidence (P : VariationalProblemPackage) where
  eulerLagrangeEquationClosed : P.eulerLagrangeEquation
  existenceMinimizerClosed : P.existenceMinimizer
  regularityOfMinimizerClosed : P.regularityOfMinimizer

def VariationalProblemClosed (P : VariationalProblemPackage) : Prop :=
  P.eulerLagrangeEquation ∧ P.existenceMinimizer ∧ P.regularityOfMinimizer

theorem variational_problem_closed_from_evidence (P : VariationalProblemPackage)
    (E : VariationalProblemEvidence P) : VariationalProblemClosed P := by
  exact And.intro E.eulerLagrangeEquationClosed
    (And.intro E.existenceMinimizerClosed E.regularityOfMinimizerClosed)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse