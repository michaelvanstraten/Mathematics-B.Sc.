{
  flake-utils,
  self,
  ...
}:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    inherit (self.lib.${system}) mkLaTeXProblemSets;
  in
  {
    packages = flake-utils.lib.flattenTree {
      ana-i =
        mkLaTeXProblemSets {
          srcDir = ./.;
          outputFilePattern = "%d. Aufgabenblatt - Aufgabe %d.pdf";
        }
        // {
          recurseForDerivations = true;
        };
    };
  }
)
