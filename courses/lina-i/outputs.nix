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
      lina-i =
        mkLaTeXProblemSets {
          srcDir = ./.;
          outputFilePattern = "Jan-Frischgesell_Michael-van-Straten_%d-%d.pdf";
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
