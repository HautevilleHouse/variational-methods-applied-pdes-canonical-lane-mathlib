import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure SobolevSpace where
  baseSpace : Type
  norm : Type
  completeness : Prop

structure BilinearForm (X : SobolevSpace) where
  domain : Type
  coercivity : Prop
  boundedness : Prop

structure VariationalProblem (X : SobolevSpace) where
  bilinearForm : BilinearForm X
  linearFunctional : Type
  uniqueSolvability : Prop

structure AdmittedObject where
  sobolevSpace : SobolevSpace
  problem : VariationalProblem sobolevSpace
  conclusion : uniqueSolvability problem

def AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  problemUniqueSolvability A.object.problem ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def problemUniqueSolvability (P : VariationalProblem) : Prop :=
  P.uniqueSolvability

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse
