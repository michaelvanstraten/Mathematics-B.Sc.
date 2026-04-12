{
  flake-utils,
  self,
  ...
}:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    inherit (self.lib.${system}) mkLaTeXProblemSets;
    packages = flake-utils.lib.flattenTree {
      nla =
        mkLaTeXProblemSets {
          srcDir = ./.;
          outputFilePattern = "Gruppe23_Pia-Girschick_Michael-van-Straten_Aufgabe%d.%d.pdf";
        }
        // {
          recurseForDerivations = true;
        };
    };
  in
  {
    inherit packages;
    checks = packages;
  }
)
