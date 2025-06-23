-- Tactic state and metavariable flow
example (P Q R : Prop) (hP : P) (hQ : Q) : P ∧ Q ∧ R := by
  constructor  -- Split into: ⊢ P and ⊢ Q ∧ R
  · exact hP   -- Assign first metavar: ?m1 := hP
  · constructor -- Split second: ⊢ Q and ⊢ R
    · exact hQ  -- Assign: ?m2 := hQ
    · sorry     -- Assign: ?m3 := sorryAx R false

-- Final proof term:
-- And.intro hP (And.intro hQ (sorryAx R false))