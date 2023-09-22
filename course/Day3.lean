import course.Day2


def compose {A B C : Type} (f : A → B) (g : B → C) : A → C :=
sorry

example {A B C : Prop} (hab : A → B) (hbc : B → C) : A → C :=
sorry


private def foo {A B C D : Type} (a : A) (f : A → B) (g : A → C) (h : A → B → C → D) : D :=
sorry

example {A B C D : Prop} (a : A) (hab : A → B) (hac : A → C) (habcd : A → B → C → D) : D :=
sorry

-- #eval foo 1 (· + 1) (· + 2) (fun a => fun b => fun c => a + b + c)


private def bar {A B C D : Type} (f : A → B) (g : A → C) (h : B → D) (i : C → D) : A → D :=
sorry

example {A B C D : Prop} (hab : A → B) (hac : A → C) (hbd : B → D) (hcd : C → D) : A → D :=
sorry

-- #eval (bar Nat.succ (· + 3) (· * 5) Nat.sqrt) 9



example : ∀ x : ℝ, ∀ y : ℝ,
  x^5 - y^5 = (x - y) * (x^4 + x^3*y + x^2*y^2 + x*y^3 + y^4) :=
by
  sorry


example : Nat.isPowerOfTwo 65536 :=
by
  sorry


theorem conjunction_swap (P Q : Prop) :
  P ∧ Q → Q ∧ P :=
by
  sorry

theorem conjunction_comm (P Q : Prop) :
  P ∧ Q ↔ Q ∧ P :=
by
  sorry

theorem disjunction_comm (P Q : Prop) :
  P ∨ Q ↔ Q ∨ P :=
by
  sorry


theorem biz : 1 + 1 ≠ 3 := sorry

example : ¬ (1 + 1 = 3) := sorry

example : (1 + 1 = 3) → False := sorry


theorem implication_indirect {P Q : Prop} (piq : P → Q) : ¬Q → ¬P :=
sorry

theorem implication_indirect' {P Q : Prop} (hpq : ¬P → ¬Q) : ¬¬Q → ¬¬P :=
implication_indirect hpq

theorem negate_twice {P : Prop} : P → ¬¬P :=
sorry

theorem implication_indirect'' {P Q : Prop} (hpq : ¬P → ¬Q) : Q → ¬¬P :=
implication_indirect' hpq ∘ negate_twice

theorem contrapositive {P Q : Prop} (hpq : ¬P → ¬Q) : Q → P :=
sorry


theorem rationals_dense :
  ∀ x z : ℚ, x < z → ∃ y : ℚ, x < y ∧ y < z :=
by
  sorry


theorem Cantor (T : Type) :
  ¬ (∃ f : T → Set T, Function.Surjective f) :=
by
  sorry


-- probably should be called `Sequence.tendsTo` or `seqLimit` but dot notation...
def Function.tendsTo (s : ℕ → ℝ) (L : ℝ) :
  Prop :=
∀ ε > 0, ∃ n₀ : ℕ, ∀ n > n₀, |s n - L| < ε

theorem limit_sum {u v : ℕ → ℝ} {a b : ℝ} (hu : u.tendsTo a) (hv : v.tendsTo b) :
  (u + v).tendsTo (a + b) :=
by
  sorry

theorem limit_product {u v : ℕ → ℝ} {a b : ℝ} (hu : u.tendsTo a) (hv : v.tendsTo b) :
  (u * v).tendsTo (a * b) :=
by
  sorry
