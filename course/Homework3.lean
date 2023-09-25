import course.Day3


-- prove using only `exact` and `constructor` and `left` and `right` and `intro` and `cases'`
example (P Q R : Prop) : P ∧ (Q ∨ R) ↔ P ∧ Q ∨ P ∧ R :=
by
  sorry


theorem limit_product {u v : ℕ → ℝ} {a b : ℝ} (hu : u.tendsTo a) (hv : v.tendsTo b) :
  (u * v).tendsTo (a * b) :=
by
  sorry
