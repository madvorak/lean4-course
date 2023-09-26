import course.Day2


def compose {A B C : Type} (f : A → B) (g : B → C) : A → C :=
fun a => g (f a)

example {A B C : Prop} (hab : A → B) (hbc : B → C) : A → C :=
fun a => hbc (hab a)


private def foo {A B C D : Type} (a : A) (f : A → B) (g : A → C) (h : A → B → C → D) : D :=
h a (f a) (g a)

example {A B C D : Prop} (a : A) (hab : A → B) (hac : A → C) (habcd : A → B → C → D) : D :=
habcd a (hab a) (hac a)

#eval foo 1 (· + 1) (· + 2) (fun a b c => a + b + c)


private def bar {A B C D : Type} (f : A → B) (g : A → C) (h : B → D) (i : C → D) : A → D :=
h ∘ f

example {A B C D : Prop} (hab : A → B) (hac : A → C) (hbd : B → D) (hcd : C → D) : A → D :=
hbd ∘ hab

#eval (bar Nat.succ (· + 3) (· * 5) Nat.sqrt) 9



example : ∀ x : ℝ, ∀ y : ℝ,
  x^5 - y^5 = (x - y) * (x^4 + x^3*y + x^2*y^2 + x*y^3 + y^4) :=
by
  intros
  ring


example : Nat.isPowerOfTwo 65536 :=
by
  unfold Nat.isPowerOfTwo
  use 16
  ring


theorem conjunction_swap (P Q : Prop) :
  P ∧ Q → Q ∧ P :=
by
  rintro ⟨p, q⟩
  exact ⟨q, p⟩

theorem conjunction_comm (P Q : Prop) :
  P ∧ Q ↔ Q ∧ P :=
by
  constructor <;> apply conjunction_swap

theorem disjunction_comm (P Q : Prop) :
  P ∨ Q ↔ Q ∨ P :=
by
  constructor <;>
  · intro hpq
    cases' hpq with p q
    · right
      exact p
    · left
      exact q


private theorem biz : 1 + 1 ≠ 3 := by trivial

example : ¬ (1 + 1 = 3) := biz

example : (1 + 1 = 3) → False := biz


theorem implication_indirect {P Q : Prop} (piq : P → Q) : ¬Q → ¬P :=
fun nq p => nq (piq p)

theorem implication_indirect' {P Q : Prop} (hpq : ¬P → ¬Q) : ¬¬Q → ¬¬P :=
implication_indirect hpq

theorem negate_twice {P : Prop} : P → ¬¬P :=
fun p np => np p

theorem implication_indirect'' {P Q : Prop} (hpq : ¬P → ¬Q) : Q → ¬¬P :=
implication_indirect' hpq ∘ negate_twice

theorem contrapositive {P Q : Prop} (hpq : ¬P → ¬Q) : Q → P :=
by
  intro q
  by_contra hyp
  exact hpq hyp q



theorem rationals_dense :
  ∀ x z : ℚ, x < z → ∃ y : ℚ, x < y ∧ y < z :=
by
  intro x z hyp
  use x / 2 + z / 2
  constructor <;> linarith


theorem false_of_equiv_neg {P : Prop} (hyp : P ↔ ¬ P) : False :=
by
  tauto

theorem Cantor (T : Type) :
  ¬ (∃ f : T → Set T, Function.Surjective f) :=
by
  by_contra hyp
  cases' hyp with f surj
  unfold Function.Surjective at surj
  specialize surj {x | x ∉ f x}
  cases' surj with a imposs
  have is_a_in : a ∈ f a ↔ a ∈ {x | ¬x ∈ f x}
  · exact Eq.to_iff (congrArg (Membership.mem a) imposs)
  rw [Set.mem_setOf_eq] at is_a_in
  exact false_of_equiv_neg is_a_in


-- probably should be called `Sequence.tendsTo` or `seqLimit` but dot notation...
def Function.tendsTo (s : ℕ → ℝ) (L : ℝ) :
  Prop :=
∀ ε > 0, ∃ n₀ : ℕ, ∀ n > n₀, |s n - L| < ε

theorem limit_sum {u v : ℕ → ℝ} {a b : ℝ}
    (hu : u.tendsTo a) (hv : v.tendsTo b) :
  (u + v).tendsTo (a + b) :=
by
  intro ε epp
  specialize hu (ε / 2) (half_pos epp)
  specialize hv (ε / 2) (half_pos epp)
  cases' hu with Nᵤ ha
  cases' hv with Nᵥ hb
  use max Nᵤ Nᵥ
  intro m hm
  specialize ha m (by
    calc m > max Nᵤ Nᵥ := hm
    _ ≥ Nᵤ := Nat.le_max_left Nᵤ Nᵥ 
  )
  specialize hb m (by
    calc m > max Nᵤ Nᵥ := hm
    _ ≥ Nᵥ := Nat.le_max_right Nᵤ Nᵥ
  )
  calc |(u + v) m - (a + b)|
    = |(u m + v m) - (a + b)|   := rfl
  _ = |(u m - a) + (v m - b)|   := by ring_nf
  _ ≤ |(u m - a)| + |(v m - b)| := abs_add ..
  _ < (ε / 2) + (ε / 2)         := add_lt_add ha hb
  _ = ε := add_halves ε

#print axioms limit_sum
