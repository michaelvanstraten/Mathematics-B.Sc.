-- Metavariables example
-- When Lean sees: apply Eq.trans
-- It creates metavariables:
--   ?m1 : a = ?b    -- first goal
--   ?m2 : ?b = c    -- second goal
--   ?b  : α         -- intermediate value

-- Solving the first goal assigns ?b
-- This automatically updates the second goal's type
example (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c := by
  apply Eq.trans h1 h2  -- Lean infers ?b := b