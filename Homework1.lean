import Std.Data.Nat.Basic


def is4thpow (a : Nat) : Bool := false -- TODO

#eval is4thpow 15
#eval is4thpow 16
#eval is4thpow 17
#eval is4thpow 0
#eval is4thpow 1
#eval is4thpow 2
#eval is4thpow 3
#eval is4thpow 4
#eval is4thpow 5
#eval List.filter is4thpow (List.range 5000)


def isPerfectNumber (a : Nat) : Bool := false -- TODO

#eval isPerfectNumber 5
#eval isPerfectNumber 6
#eval isPerfectNumber 7
#eval isPerfectNumber 12
#eval isPerfectNumber 28
#eval isPerfectNumber 30


def prefixSums : List Int → List Int := id -- TODO

#eval prefixSums [1, 2, 5, 0]
#eval prefixSums [1, -5, 3, 2, 2, 2, 2]
#eval prefixSums [0, 0, 10, -1, -2, -3, -4, -5, 0, 10, 0]


def postfixSums : List Int → List Int := id -- TODO

#eval postfixSums [1, 2, 5, 0]
#eval postfixSums [1, -5, 3, 2, 2, 2, 2]
#eval postfixSums [0, 0, 10, -1, -2, -3, -4, -5, 0, 10, 0]
