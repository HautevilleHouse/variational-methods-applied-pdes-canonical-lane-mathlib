import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedPdesCanonicalLaneLean

structure RegularityPackage (X : SobolevSpace) where
  solution : Type
  interiorRegularity : Prop
  boundaryRegularity : Prop
  interiorRegularityClosed : interiorRegularity
  boundaryRegularityClosed : boundaryRegularity

def RegularityClosed (R : RegularityPackage X) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity

theorem regularity_closed_from_evidence (R : RegularityPackage X) (h : R.interiorRegularity ∧ R.boundaryRegularity) :
    RegularityClosed R := h

end VariationalMethodsAppliedPdesCanonicalLaneLean
end HautevilleHouse
