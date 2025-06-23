import Lean

-- Simple macro-based tactic
macro "custom_sorry_macro" : tactic => `(tactic| sorry)

-- Elaboration-based tactic
elab "custom_sorry" : tactic =>
  Lean.Elab.Tactic.withMainContext do
    let goal ← Lean.Elab.Tactic.getMainGoal
    Lean.Elab.admitGoal goal

example : 1 = 2 := by
  custom_sorry
