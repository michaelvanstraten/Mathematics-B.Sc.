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
      algebra-i =
        mkTypstProblemSets {
          srcDir = ./.;
          unstable_typstPackages = [
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
