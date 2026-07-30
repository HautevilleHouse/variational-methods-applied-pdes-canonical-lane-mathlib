import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure NonlinearVariationalPackage (X : SobolevSpace) where
  nonlinearFunctional : Type
  palaisSmaleCondition : Prop
  criticalPointExists : Prop
  palaisSmaleConditionClosed : palaisSmaleCondition
  criticalPointExistsClosed : criticalPointExists

def NonlinearVariationalClosed (N : NonlinearVariationalPackage X) : Prop :=
  N.palaisSmaleCondition ∧ N.criticalPointExists

theorem nonlinear_variational_closed_from_evidence (N : NonlinearVariationalPackage X) (h : N.palaisSmaleCondition ∧ N.criticalPointExists) :
    NonlinearVariationalClosed N := h

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse
