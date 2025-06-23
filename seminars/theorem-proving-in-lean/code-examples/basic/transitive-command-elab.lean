import Lean

open Lean Elab Command

-- this meta-level code
syntax (name := xxx) "red" : command
syntax (name := yyy) "green" : command
syntax (name := zzz) "blue" : command

@[macro xxx] def redMacro : Macro := fun stx =>
  match stx with
  | _ => `(green)

@[macro yyy] def greenMacro : Macro := fun stx =>
  match stx with
  | _ => `(blue)

@[command_elab zzz] def blueElab : CommandElab := fun stx =>
  Lean.logInfo "finally, blue!"

-- this is object-level code
red -- finally, blue!
