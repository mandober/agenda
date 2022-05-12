module Lib.Functions where

-- ------------------------------------------------------------------------
-- Universes
-- ------------------------------------------------------------------------
-- Basic type universes and universe levels.
open import Agda.Primitive public
    renaming (Set to Type)
    using (Prop; Level; _⊔_; lzero; lsuc)

private
  variable
    a b c ℓ p                       : Level
    @0 A A₁ A₂ B B₁ B₂ C D Whatever : Type a
    @0 P Q R                        : A → Type p

-- Constant function
-- const : {A B : Set} A → (B → A)
const : {a : Level} {A : Set a} → A → B → A
const x = λ _ → x
