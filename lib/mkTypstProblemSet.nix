{
  lib,
  buildTypstProject,
}:
{
  pset,
  fontPaths ? [ ],
  virtualPaths ? [ ],
  unstable_typstPackages ? [ ],
  ...
}:
let
  courseDir = builtins.dirOf pset;
  jobName = lib.strings.removeSuffix ".typ" (builtins.baseNameOf pset);

  src = lib.fileset.toSource {
    root = courseDir;
    fileset = lib.fileset.fileFilter (
      f: f.name != ".DS_Store" && !(f.hasExt "nix") && !(f.hasExt "pdf")
    ) courseDir;
  };
in
buildTypstProject {
  name = jobName;
  inherit
    src
    fontPaths
    virtualPaths
    unstable_typstPackages
    ;
  typstSource = builtins.baseNameOf pset;
}
