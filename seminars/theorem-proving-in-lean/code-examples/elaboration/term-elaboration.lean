import Lean
open Lean Elab Command Term Meta

elab n:term "♥" a:"♥"? b:"♥"? : term => do
  let nExpr : Expr ← elabTermEnsuringType n (mkConst `Nat)
  if let some a := a then
    if let some b := b then
      return Expr.app (Expr.app (Expr.const `Nat.add []) nExpr) (mkNatLit 3)
    else
      return Expr.app (Expr.app (Expr.const `Nat.add []) nExpr) (mkNatLit 2)
  else
    return Expr.app (Expr.app (Expr.const `Nat.add []) nExpr) (mkNatLit 1)

#eval 7 ♥ -- 8
#eval 7 ♥♥ -- 9
#eval 7 ♥♥♥ -- 10
