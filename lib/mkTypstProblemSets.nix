{
  lib,
  mkTypstProblemSet,
}:
{
  srcDir,
  fileFilter ? (
    file:
    file.hasExt "typ"
    && !(builtins.elem file.name [
      "common.typ"
      "definitions.typ"
    ])
  ),
  unstable_typstPackages ? [ ],
}:
let
  mkAttrName =
    path:
    lib.path.removePrefix srcDir path
    |> lib.strings.removePrefix "./"
    |> lib.strings.removeSuffix ".typ";
in
srcDir
|> lib.fileset.fileFilter fileFilter
|> lib.fileset.toList
|> builtins.map (pset: {
  ${mkAttrName pset} = mkTypstProblemSet { inherit pset unstable_typstPackages; };
})
|> lib.mergeAttrsList
