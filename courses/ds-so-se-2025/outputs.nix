{
  flake-utils,
  self,
  ...
}:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    inherit (self.lib.${system}) mkTypstProblemSets;
    packages = flake-utils.lib.flattenTree {
      ds-so-se-2025 =
        mkTypstProblemSets {
          srcDir = ./.;
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
