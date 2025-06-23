-- Metavariables as tactic goals
-- When you see this in tactic mode:
-- h1 : P
-- h2 : Q
-- ⊢ P ∧ Q

-- Internally it's a metavariable ?goal with:
-- • Local context: [h1 : P, h2 : Q]
-- • Target type: P ∧ Q
-- • Assignment: none (unassigned)

-- apply And.intro creates two new metavariables:
-- ?m1 : P  and  ?m2 : Q
-- and assigns ?goal := And.intro ?m1 ?m2