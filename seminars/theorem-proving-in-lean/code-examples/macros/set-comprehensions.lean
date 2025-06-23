def Set (alpha : Type u) := alpha → Prop
def Set.mem (X : Set alpha) (x : alpha) : Prop := X x

-- Integrate into the already existing typeclass for membership notation
instance : Membership alpha (Set alpha) where
  mem := Set.mem

def Set.empty : Set alpha := λ _ => False

-- the basic "all elements such that" function for the notation
def setOf {alpha : Type} (p : alpha → Prop) : Set alpha := p

declare_syntax_cat binder_construct
syntax "{" binder_construct "|" term "}" : term

syntax ident " : " term : binder_construct
syntax ident " ∈ " term : binder_construct

macro_rules
  | `({ $var:ident : $ty:term | $body:term }) => `(setOf (fun ($var : $ty) => $body))
  | `({ $var:ident ∈ $s:term | $body:term }) => `(setOf (fun $var => $var ∈ $s ∧ $body))

def oneSet : Set Nat := λ x => x = 1
#check { x ∈ oneSet | 10 ≤ x } -- setOf fun x => x ∈ oneSet ∧ 10 ≤ x : Set Nat

example : ∀ x, ¬(x ∈ { y ∈ oneSet | y ≠ 1 }) := by
  intro x h
  -- h : x ∈ setOf fun y => y ∈ oneSet ∧ y ≠ 1
  -- ⊢ False
  cases h
  -- : x ∈ oneSet
  -- : x ≠ 1
  contradiction
