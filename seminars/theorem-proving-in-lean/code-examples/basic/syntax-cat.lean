declare_syntax_cat boolean_expr
syntax "⊥" : boolean_expr -- ⊥ for false
syntax "⊤" : boolean_expr -- ⊤ for true
syntax:40 boolean_expr " OR " boolean_expr : boolean_expr
syntax:50 boolean_expr " AND " boolean_expr : boolean_expr

-- Now that we are working in our own syntax category, we are completely
-- disconnected from the rest of the system. And these cannot be used in place of
-- terms anymore:
-- #check ⊥ AND ⊤ -- expected term

-- In order to integrate our syntax category into the rest of the system we will
-- have to extend an already existing one with new syntax, in this case we
-- will re-embed it into the `term` category:
syntax "[Bool|" boolean_expr "]" : term
#check_failure [Bool| ⊥ AND ⊤] -- elaboration function for '«term[Bool|_]»' has not been implemented
