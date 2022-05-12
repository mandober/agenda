module Lib.Integers where

open import Lib.Equality
open import Lib.Nat

-- -----------------------------------------------------------------
-- Integers
-- -----------------------------------------------------------------
-- | Integers
abstract

  ℤ : Set
  ℤ = ℕ × ℕ     -- define: ×

  0z : ℤ
  0z = 0 , 0    -- define: ,

  1z : ℤ
  1z = 1 , 0
