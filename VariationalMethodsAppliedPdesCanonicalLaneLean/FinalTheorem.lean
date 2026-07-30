import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsAppliedPdesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

def ConstrainedVariationalMethodsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_variational_methods_endgame (A : AdmissibleClass) :
    ConstrainedVariationalMethodsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse