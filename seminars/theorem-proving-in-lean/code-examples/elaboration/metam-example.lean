import Lean

open Lean Lean.Expr Lean.Meta

-- Creating and manipulating metavariables with MetaM
#eval show MetaM Unit from do
  -- Create a metavariable of type Nat
  let mvar ← mkFreshExprMVar (Expr.const ``Nat []) (userName := `goal)

  -- Create an expression using the metavariable
  let expr := .app (.const ``Nat.succ []) mvar

  -- Assign the metavariable to 42
  mvar.mvarId!.assign (.lit (.natVal 42))
  -- Get the final expression with metavariables resolved
  logInfo (<- instantiateMVars expr)  -- Nat.succ 42
