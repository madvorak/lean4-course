import course.Day1


def is4thpow (a : Nat) : Bool := false -- TODO

#eval is4thpow 15 -- false
#eval is4thpow 16 -- true
#eval is4thpow 17 -- false
#eval is4thpow 0 -- true
#eval is4thpow 1 -- true
#eval is4thpow 2 -- false
#eval is4thpow 3 -- false
#eval is4thpow 4 -- false
#eval is4thpow 5 -- false
#eval List.filter is4thpow (List.range 5000)


def isPerfectNumber (a : Nat) : Bool := false -- TODO

#eval isPerfectNumber 5 -- false
#eval isPerfectNumber 6 -- true
#eval isPerfectNumber 7 -- false
#eval isPerfectNumber 12 -- false
#eval isPerfectNumber 28 -- true
#eval isPerfectNumber 30 -- false


def prefixSums : List Int → List Int := id -- TODO

#eval prefixSums [1, 2, 5, 0] -- [1, 3, 8, 8]
#eval prefixSums [1, -5, 3, 2, 2, 2, 2]
#eval prefixSums [0, 0, 10, -1, -2, -3, -4, -5, 0, 10, 0]


def postfixSums : List Int → List Int := id -- TODO

#eval postfixSums [1, 2, 5, 0] -- [8, 7, 5, 0]
#eval postfixSums [1, -5, 3, 2, 2, 2, 2]
#eval postfixSums [0, 0, 10, -1, -2, -3, -4, -5, 0, 10, 0]
