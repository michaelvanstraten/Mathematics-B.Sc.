import Lean
open Lean

syntax "hi" : term

elab "#stx" t:term : command => do
    Lean.logInfo (repr t.raw)

#stx 1 + hi
-- Lean.Syntax.node
--   `«term_+_»
--   #[Lean.Syntax.node
--       `num
--       #[Lean.Syntax.atom
--           (Lean.SourceInfo.original "".toSubstring { byteIdx := 114 } " ".toSubstring { byteIdx := 115 })
--           "1"],
--     Lean.Syntax.atom
--       "+",
--     Lean.Syntax.node
--       `termHi
--       #[Lean.Syntax.atom
--           ...
--           "hi"]]