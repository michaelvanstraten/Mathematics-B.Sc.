-- Examples from Lean's initialization (Init/Notation.lean)
infixl:35 " && " => and
infixl:30 " || " => or
notation:max "!" b:40 => not b
infixr:67 " :: " => List.cons
notation:max "¬" p:40 => Not p

-- Precedence determines parsing order
#eval true && false || true  -- true
-- Parsed as: (true && false) || true because && has higher precedence (35 > 30)

-- Right associative list construction
#eval 1 :: 2 :: 3 :: []  -- [1, 2, 3]
-- Parsed as: 1 :: (2 :: (3 :: []))
