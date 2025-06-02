{
  description = "Deterministic LaTeX compilation with Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
    latix.url = "github:michaelvanstraten/latix";
    latix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      git-hooks,
      ...
    }@inputs:
    let
      inherit ((import ./lib/outputs.nix inputs).lib) callOutputs;
      inherit (nixpkgs.lib.attrsets) recursiveUpdate;
    in
    recursiveUpdate
      (callOutputs {
        directory = ./.;
      })
      (
        flake-utils.lib.eachDefaultSystem (
          system:
          let
            pkgs = import nixpkgs { inherit system; };
          in
          {
            checks = {
              git-hooks = git-hooks.lib.${system}.run {
                src = ./.;
                hooks = {
                  # nixfmt-rfc-style.enable = true;
                  # statix.enable = true;
                  # chktex.enable = true;
                  latexindent = {
                    enable = true;
                    settings = {
                      flags = "--local --silent --modifylinebreak --overwriteIfDifferent";
                    };
                  };
                  lacheck.enable = false;
                  actionlint.enable = true;
                  prettier = {
                    enable = true;
                    settings = {
                      prose-wrap = "always";
                    };
                  };
                  trim-trailing-whitespace.enable = true;
                  typstyle.enable = true;
                  typstyle.args = [ "--wrap-text" ];
                };
              };
            };

            formatter = pkgs.nixfmt-rfc-style;

            devShells.default = pkgs.mkShell {
              inherit (self.checks.${system}.git-hooks) shellHook;
              packages = [
                self.checks.${system}.git-hooks.enabledPackages
                pkgs.texlab
                pkgs.texlivePackages.latexindent
              ];
            };
          }
        )
      );
}
