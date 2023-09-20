import Std.Data.Nat.Basic


def is_square (a : Nat) : String := 
if (Nat.sqrt a) ^ 2 = a then "yes" else "no"

#eval is_square 8


def area_of_rectangle (a b : Float) : Float :=
2 * (a + b)


def factorial : Nat → Nat
| 0   => 1
| n+1 => (n+1) * factorial n


def fibonacci : Nat → Nat
| 0   => 0
| 1   => 1
| n+2 => fibonacci n + fibonacci (n+1)


private def hasNoDivisorUnder (n : Nat) : Nat → Bool
| 0   => true
| 1   => true
| 2   => true
| d+1 => n % d ≠ 0 && hasNoDivisorUnder n d

def isPrime (n : Nat) : Bool :=
n > 1 && hasNoDivisorUnder n n

#eval List.filter isPrime (List.range 100)


def list123a : List Nat := [1, 2, 3]
def list123b : List Nat := 1 :: [2, 3]
def list123c : List Nat := 1 :: (2 :: (3 :: []))
def list123d : List Nat := List.cons 1 (List.cons 2 (List.cons 3 (List.nil)))

def odd_numbers_dec : Nat → List Nat
| 0   => []
| n+1 => (2*n+1) :: odd_numbers_dec n

#eval odd_numbers_dec 7


def sumList : List Nat → Nat
| [ ]     => 0
| x :: xs => x + sumList xs

#eval sumList list123a
#eval sumList (List.range 10)
#eval sumList (odd_numbers_dec 10)


def countElems {α : Type} : List α → Nat
| [ ]     => 0
| _ :: xs => 1 + countElems xs

#eval countElems list123d
#eval countElems (List.range 42)
#eval countElems "Hello world".toList
#eval countElems ([] : List Float)


def listDiff : List Nat → List Nat
| [ ]          => []
| [ _ ]        => []
| x :: y :: xs => (y - x) :: listDiff (y :: xs)

#eval listDiff [0, 3, 10, 0]
#eval listDiff list123c
#eval listDiff (List.map (· ^ 3) (List.range 10))
#eval listDiff (List.map (· ^ 3) (List.range 10)) |> listDiff

def nTimes {α : Type} (f : α → α) (a : α) : Nat → α
| 0   => a
| n+1 => f (nTimes f a n)

#eval nTimes (· + 1) 5 2
#eval nTimes listDiff (List.map (· ^ 3) (List.range 10)) 3
#eval nTimes listDiff (List.map (· ^ 4) (List.range 10)) 4
#eval nTimes listDiff (List.map (· ^ 9) (List.range 10)) 9
#eval factorial 9


def revers {α : Type} : List α → List α
| [ ]     => [ ]
| x :: xs => revers xs ++ [x]

#eval revers list123b


private def reverse_append {α : Type} (ys : List α) : List α → List α
| [ ]     => ys
| x :: xs => reverse_append (x :: ys) xs

def reverse_fast {α : Type} : List α → List α :=
reverse_append []

#eval reverse_fast list123a

def odd_numbers : Nat → List Nat := reverse_fast ∘ odd_numbers_dec

#eval odd_numbers 100
