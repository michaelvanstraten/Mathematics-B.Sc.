-- De Bruijn indices example
-- Source: λ x => λ y => x + y
-- Expr representation:
.lam `x (.const ``Nat [])
  (.lam `y (.const ``Nat [])
    (.app (.app (.const ``Nat.add []) (.bvar 1)) (.bvar 0))
    BinderInfo.default)
  BinderInfo.default

-- In this tree:
-- • bvar 0 refers to y (0 binders up)
-- • bvar 1 refers to x (1 binder up)
