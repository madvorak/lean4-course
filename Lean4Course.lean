import Std.Data.Nat.Basic


def is_square (a : Nat) : Bool := (Nat.sqrt a) ^ 2 = a

#eval is_square 9
