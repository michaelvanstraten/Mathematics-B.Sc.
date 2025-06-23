-- Example: rewriting if-then-else behavior to flip conditions
macro_rules
  | `(if $c:term then $t:term else $e:term) =>
    `(ite (! $c) $t $e)

#eval if true  then "yes" else "no"   -- "no"
#eval if false then 1      else 99    -- 1