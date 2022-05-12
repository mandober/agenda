module Lib.Unit where

-- open import module Agda.Builtin.Unit

{-
  The unit type is bound to the builtin UNIT.

  Agda needs to know about the unit type since some of the primitive operations in the reflected type checking monad return values in the unit type.

  https://agda.readthedocs.io/en/v2.6.2.1/language/reflection.html#reflection-tc-monad
-}

record ⊤ : Set where

{-# BUILTIN UNIT ⊤ #-}
