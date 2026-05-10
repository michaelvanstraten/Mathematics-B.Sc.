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
      gnumo-so-se-2026 =
        mkTypstProblemSets {
          srcDir = ./.;
          unstable_typstPackages = [
            {
              name = "zero";
              version = "0.6.1";
              hash = "sha256-aBYoozFFknJcZvT3ZC3YQXmZchEPNiMeEp/YrS51+Qo=";
            }
          ];
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
