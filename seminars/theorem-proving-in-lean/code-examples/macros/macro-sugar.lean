-- Using macro_rules syntax sugar
syntax:10 term:10 " RXOR " term:11 : term

macro_rules
  | `($l:term RXOR $r:term) => `($l && !$r)

-- Using macro syntax (even more concise)
macro l:term:10 " ⊕ " r:term:11 : term =>
  `((!$l && $r) || ($l && !$r))

#eval true ⊕ false  -- true
#eval false ⊕ true  -- true