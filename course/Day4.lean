import course.Day3


lemma sum_reversAppend (xs ys : List ℕ) :
  sumList (reversAppend xs ys) = sumList xs + sumList ys :=
by
  revert xs
  induction ys with
  | nil =>
    intro xs
    rfl
  | cons d l ih =>
    intro xs
    unfold reversAppend
    convert ih (d :: xs) using 1
    show sumList xs + (d + sumList l) = (d + sumList xs) + sumList l
    ring

lemma sum_reversFast (l : List ℕ) : sumList (reversFast l) = sumList l :=
by
  unfold reversFast
  rw [sum_reversAppend]
  rw [show sumList [] = 0 by rfl]
  exact Nat.zero_add (sumList l)

lemma sum_oddNumbersDec (n : ℕ) : sumList (oddNumbersDec n) = n ^ 2 :=
by
  induction n with
  | zero =>
    rfl
  | succ n ih =>
    unfold oddNumbersDec
    unfold sumList
    rw [ih]
    show _ = (n+1) ^ 2
    ring

theorem sum_oddNumbers (n : ℕ) : sumList (oddNumbers n) = n ^ 2 :=
by
  show sumList (reversFast (oddNumbersDec n)) = n ^ 2
  rw [sum_reversFast, sum_oddNumbersDec]


lemma pow_two_aux (n : ℕ) : (n+5) ^ 2 < 2 ^ (n+5) :=
by
  induction n with
  | zero =>
    decide
  | succ n ih =>
    convert_to (n + 6) ^ 2 < 2 ^ (n + 6)
    convert_to n^2 + 12*n + 36 < 2 ^ (n+5) + 2 ^ (n+5) using 1
    · ring
    · ring
    have ih' : n^2 + 10*n + 25 < 2 ^ (n+5)
    · convert ih using 1
      ring
    have gap : 2*n + 11 ≤ 2 ^ (n+5)
    · nlinarith
    linarith

theorem pow_two_lt_two_pow {n : ℕ} (n_gt_5 : n ≥ 5) : n^2 < 2^n :=
by
  have res := pow_two_aux (n - 5)
  convert res <;> exact Nat.eq_add_of_sub_eq n_gt_5 rfl


lemma strong_induction_aux (P : ℕ → Prop) :
  (∀ x : ℕ, (∀ y : ℕ, y < x → P y) → P x) →
  (∀ n : ℕ, (∀ z : ℕ, z < n → P z)) :=
by
  intro hyp n
  induction n with
  | zero =>
    intro z z_lt_0
    exfalso
    exact Nat.not_succ_le_zero z z_lt_0
  | succ n ih =>
    intro z z_le_n
    apply hyp
    intro y y_lt_z
    apply ih
    linarith

theorem strong_induction (P : ℕ → Prop) : 
  (∀ x : ℕ, (∀ y : ℕ, y < x → P y) → P x) → (∀ n : ℕ, P n) :=
by
  intro hyp n
  apply strong_induction_aux P hyp n.succ n
  exact Nat.lt.base n
