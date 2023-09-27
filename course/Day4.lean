import course.Day3



theorem sumOddNumbers (n : ℕ) : sumList (oddNumbers n) = n ^ 2 :=
by
  sorry


theorem pow_two_lt_two_pow {n : ℕ} (n_gt_5 : n ≥ 5) : n^2 < 2^n :=
by
  sorry


theorem strong_induction (P : ℕ → Prop) : 
  (∀ x : ℕ, (∀ y : ℕ, y < x → (P y)) → (P x)) → (∀ n : ℕ, P n) :=
by
  sorry
