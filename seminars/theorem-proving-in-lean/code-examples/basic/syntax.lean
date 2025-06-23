import Lean
open Lean

syntax "hi" : term

elab "#stx" t:term : command => do
    Lean.logInfo (repr t.raw)

#stx 1 + hi
-- Lean.Syntax.node
--   (Lean.SourceInfo.none)
--   `term_+_
--   #[Lean.Syntax.node
--       (Lean.SourceInfo.none)
--       `num
--       #[Lean.Syntax.atom
--           (Lean.SourceInfo.original "".toSubstring { byteIdx := 114 } " ".toSubstring { byteIdx := 115 })
--           "1"],
--     Lean.Syntax.atom
--       (Lean.SourceInfo.original "".toSubstring { byteIdx := 116 } " ".toSubstring { byteIdx := 117 })
--       "+",
--     Lean.Syntax.node
--       (Lean.SourceInfo.none)
--       `termHi
--       #[Lean.Syntax.atom
--           ...
--           "hi"]]
