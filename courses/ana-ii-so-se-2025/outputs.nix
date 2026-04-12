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
      ana-ii-so-se-2025 =
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
            {
              name = "fletcher";
              version = "0.5.8";
              hash = "sha256-kKVp5WN/EbHEz2GCTkr8i8DRiAdqlr4R7EW6drElgWk=";
            }
            {
              name = "cetz";
              version = "0.3.4";
              hash = "sha256-5w3UYRUSdi4hCvAjrp9HslzrUw7BhgDdeCiDRHGvqd4=";
            }
            {
              name = "oxifmt";
              version = "0.2.1";
              hash = "sha256-8PNPa9TGFybMZ1uuJwb5ET0WGIInmIgg8h24BmdfxlU=";
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
