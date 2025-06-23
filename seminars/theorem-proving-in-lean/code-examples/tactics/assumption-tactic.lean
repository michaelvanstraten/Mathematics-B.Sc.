import Lean

-- Building a custom assumption tactic
elab "custom_assump" : tactic =>
  Lean.Elab.Tactic.withMainContext do
    let goal ← Lean.Elab.Tactic.getMainGoal
    let goalType ← Lean.Elab.Tactic.getMainTarget
    let ctx ← Lean.MonadLCtx.getLCtx

    let option_matching_expr ← ctx.findDeclM? fun decl => do
      let declExpr := decl.toExpr
      let declType ← Lean.Meta.inferType declExpr
      if ← Lean.Meta.isExprDefEq declType goalType
        then return Option.some declExpr
        else return Option.none

    match option_matching_expr with
    | some e => Lean.Elab.Tactic.closeMainGoal `custom_assump e
    | none => (Lean.Meta.throwTacticEx `custom_assump goal
        m!"unable to find matching hypothesis of type ({ goalType})")

example (h : 1 = 1) : 1 = 1 := by custom_assump
