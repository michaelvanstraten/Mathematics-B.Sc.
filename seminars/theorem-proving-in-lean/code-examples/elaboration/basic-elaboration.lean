import Lean

-- Basic elaboration examples
-- Command elaboration
elab "#hello" : command =>
  Lean.logInfo "Hello from command!"

-- Term elaboration
elab "answer" : term =>
  return Lean.mkNatLit 42

#hello        -- Hello from command!
#check answer -- 42 : Nat
