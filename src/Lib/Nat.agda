module Lib.Nat where

-- open import Data.Nat using (ℕ; zero; suc)
-- open import Data.Nat using (_+_; _⨯_)

open import Lib.Equality
open import Lib.Bool

{-
  Builtin natural numbers are defined in Agda.Builtin.Nat module.
  The standard library and, e.g. agda-prelude reexport the definitions from these modules.

  https://github.com/agda/agda-stdlib
  https://github.com/UlfNorell/agda-prelude
-}

-- -----------------------------------------------------------------
-- Natural numbers: definition
-- -----------------------------------------------------------------
data ℕ : Set where
    Z : ℕ
    S : ℕ → ℕ

{-# BUILTIN NATURAL ℕ #-}

-- -----------------------------------------------------------------
-- Natural numbers: add
-- -----------------------------------------------------------------
infixl 7 _+_
_+_ : ℕ → ℕ → ℕ
0     + m = m
(S n) + m = S (n + m)

{-# BUILTIN NATPLUS _+_ #-}

-- -----------------------------------------------------------------
-- Natural numbers: theorems
-- -----------------------------------------------------------------

n+Z≡n : ∀ (n : ℕ) ->  n + 0 ≡ n
n+Z≡n    0                  = refl
n+Z≡n (S n) rewrite n+Z≡n n = refl


n≡n+0 : ∀ (n : ℕ) -> n ≡ n + 0
n≡n+0    0  = refl
n≡n+0 (S n) = context S (n≡n+0 n)


plus-n+Sm : ∀ (n m : ℕ) -> S (n + m) ≡ n + S m
plus-n+Sm    0  m = refl
plus-n+Sm (S n) m = context S (plus-n+Sm n m)


plus-m+Sn : ∀ (n m : ℕ) -> S (m + n) ≡ m + S n
plus-m+Sn n    0  = refl
plus-m+Sn n (S m) = context S (plus-m+Sn n m)


-- | Theorem: (+) is commutative over ℕ
n+m≡m+n : ∀ (n : ℕ) → ∀ (m : ℕ) → n + m ≡ m + n
n+m≡m+n    0  m = n≡n+0 m
n+m≡m+n (S n) m = transitivity s1 s2
    where
    s1 : S (n + m) ≡ S (m + n)
    s1 = context S (n+m≡m+n n m)
    s2 : S (m + n) ≡ m + S n
    s2 = plus-m+Sn n m
