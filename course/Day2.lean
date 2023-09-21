import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LibrarySearch

theorem add_self (n : ℕ) : n + n = 2 * n :=
(Nat.two_mul n).symm

theorem add_self_add_self (n : ℕ) :
  n + n + n = 3 * n :=
by
  ring

example (x y : ℝ) :
  x^5 - y^5 = (x - y) * (x^4 + x^3*y + x^2*y^2 + x*y^3 + y^4) :=
by
  ring

example (n : ℕ) : 2 ^ (n + 3) = 8 * 2 ^ n :=
by
  ring

example (a b c : ℕ) (ha : a = 4) (hb : b = 3) (hc : c = 7) :
  a + b = c :=
by
  rw [ha, hb, hc]

example (a b c : ℕ) (ha : a = 4) (hb : 3 = b) (hc : c = 7) :
  a + b = c :=
by
  rw [ha, ←hb, hc]

example (a : ℕ) (ha : a = 4) (ha' : a = 5) :
  1 + 1 = 3 :=
by
  rw [ha] at ha'
  contradiction

example (x y z : ℚ) (hxy : x < y) (hyz : y < z) : x < z :=
lt_trans hxy hyz

example (x y z : ℚ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z :=
le_trans hxy hyz

example (x y z : ℚ) (hxy : x ≤ y) (hyz : y < z) : x < z :=
LE.le.trans_lt hxy hyz

example (a b c d : ℝ) (abcd : a + b + c ≤ 2 * d) (ab : a ≤ b) (ac : 2 * a ≤ c) :
  2 * a ≤ d :=
by
  linarith

example (x y : ℝ) (hxy : x ≤ y) : x ≤ y + y*y :=
by
  have hyy : y*y ≥ 0
  · exact mul_self_nonneg y
  linarith

example (x y : ℝ) (hxy : x ≤ y) : x ≤ y + y*y :=
by
  nlinarith

example (x y : ℝ) (hx : x < 0) (hy : y < 0) : x * 50 * y > 0 :=
by
  nlinarith

example (x y : ℝ) : x*x + 2*x*y + y*y ≥ 0 :=
by
  convert_to (x + y) ^ 2 ≥ 0
  · ring
  exact sq_nonneg (x + y)

example (x : ℝ) : x*x - 10*x + 27 ≥ 0 :=
by
  have suff : x*x - 10*x + 25 ≥ 0
  · convert_to (x - 5) ^ 2 ≥ 0
    · ring
    nlinarith
  linarith

example (x : ℝ) (xnz : x ≠ 0) :
  x + 1/x = (x^2 + 1) / x :=
by
  field_simp
  exact (sq x).symm

example (x : ℝ) (x_pos : x > 0) :
  x + 1/x ≥ 2 :=
by
  have : (x - 1) ^ 2 ≥ 0
  · exact sq_nonneg (x - 1)
  have : x^2 + 1 - 2*x ≥ 0
  · convert this
    ring
  have : x^2 + 1 ≥ 2*x
  · exact Iff.mp sub_nonneg this
  have : (x^2 + 1) / x ≥ 2*x / x
  · exact Iff.mpr (div_le_div_right x_pos) this
  have right_simpl : 2*x / x = 2 * (x/x)
  · exact mul_div_assoc 2 x x
  have left_simpl : (x ^ 2 + 1) / x = x + 1/x
  · field_simp
    exact sq x
  rw [right_simpl, left_simpl] at this
  convert this
  field_simp
