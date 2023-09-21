import course.Day2


example (a b c d : ℕ) (ha : a = b + d) (hb : b = a * a) (hc : c = b + d) (hd : d = c * c) :
  b ^ d = d ^ b := sorry

example (a b c d : ℤ) (ha : a = d ^ 4) (hb : b = 1 / c) (hc : c = a - b) (hd : d = 4 * a) :
  (a + b) ^ 2 - c ^ 2 = b * d := sorry

example (x : ℚ) : x^2 - 6*x + 10 ≥ 0 := sorry

example (x y : ℚ) : 2 * x^3 * y^3 ≤ x^4 * y^2 + x^2 * y^4 := sorry

example (x y z : ℚ) : 4*x^2 + 12*x*y - 4*x*z + 9*y^2 - 6*y*z + z^2 ≥ 0 := sorry

example (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : 1 / a + 1 / b ≤ a / b^2 + b / a^2 := sorry
