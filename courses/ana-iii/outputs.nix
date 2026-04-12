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
      ana-iii =
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
