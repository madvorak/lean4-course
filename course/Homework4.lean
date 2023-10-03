import course.Day4


def cubesDec : ℕ → List ℕ
| 0   => []
| n+1 => n^3 :: cubesDec n

def cubes : ℕ → List ℕ := reversFast ∘ cubesDec

-- Hint: Formulate a lemma that avoids `-`, `/`, and `cubes`.
theorem sum_cubes (n : ℕ) : sumList (cubes n) = ((n-1) ^ 2 * n ^ 2) / 4 :=
by
  sorry
