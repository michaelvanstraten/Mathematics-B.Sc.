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
            {
              name = "cetz";
              version = "0.4.2";
              hash = "sha256-qBIEHqtiMSG/WoXHPC/rQ9VkestSvVNlUwTmAMX1wAs=";
            }
            {
              name = "oxifmt";
              version = "1.0.0";
              hash = "sha256-edTDK5F2xFYWypGpR0dWxwM7IiBd8hKGQ0KArkbpHvI=";
            }
            {
              name = "cetz-plot";
              version = "0.1.3";
              hash = "sha256-JtZJh8xIGgntdDQj8YBDlYLF6/QQXOt9tLaRYTtgyso=";
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
