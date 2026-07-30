import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

def sourceRepository : String :=
  "variational-methods-applied-pdes-canonical-lane"

def sourceDescription : String :=
  "Variational Methods Applied PDEs"

structure VariationalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure VariationalAdmittedObject where
  space : VariationalSpace
  functionalDefined : Prop
  minimizerExists : Prop
  eulerLagrangeSatisfied : Prop
  conclusion : eulerLagrangeSatisfied

structure VariationalEndgameState where
  object : VariationalAdmittedObject

def VariationalWitnessClosed (O : VariationalAdmittedObject) : Prop :=
  O.eulerLagrangeSatisfied

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse