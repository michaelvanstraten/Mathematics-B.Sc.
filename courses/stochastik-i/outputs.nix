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
      stochastik-i =
        mkTypstProblemSets {
          srcDir = ./.;

          unstable_typstPackages = [
            {
              name = "colorful-boxes";
              version = "1.4.3";
              hash = "sha256-CTBHlkrNbNg+w1FK7xdickxBBgK/9BgC6maZoUQR5BU=";
            }
            {
              name = "showybox";
              version = "2.0.3";
              hash = "sha256-VQacq1Xi2bnY5Fh4hm0PVBZVXpuxYcn/76Fg/rOprY0=";
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
