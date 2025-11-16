{
  description = "Deterministic LaTeX compilation with Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    git-hooks.url = "github:cachix/git-hooks.nix";
    latix.url = "github:michaelvanstraten/latix";
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
                  nixfmt-rfc-style.enable = true;
                  latexindent = {
                    enable = true;
                    settings = {
                      flags = "--local --silent --modifylinebreak --overwriteIfDifferent";
                    };
                  };
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
                pkgs.typst
              ];
            };

            devShells.ds-so-se-2025 =
              let
                llvmPackages = pkgs.llvmPackages_latest;
                stdenv = llvmPackages.stdenv;
                mkShell = pkgs.mkShell.override { inherit stdenv; };

                ghdl-llvm = stdenv.mkDerivation rec {
                  pname = "ghdl-llvm";
                  version = "5.1.1";

                  src = pkgs.fetchurl {
                    url = "https://github.com/ghdl/ghdl/releases/download/v${version}/ghdl-llvm-${version}-macos15-aarch64.tar.gz";
                    sha256 = "sha256-BEVlKkYNAauU06lfqI85iulVCXPa9Yc/ZsJIDSxz4gk=";
                  };

                  installPhase = ''
                    ls
                    mkdir -p $out
                    cp -r * $out/
                  '';

                  meta = {
                    homepage = "https://github.com/ghdl/ghdl";
                    platforms = [ "aarch64-darwin" ];
                  };
                };

                riscv32 = import nixpkgs {
                  inherit system;
                  crossSystem = {
                    config = "riscv32-none-elf";
                  };
                };

              in
              mkShell {
                packages = [
                  ghdl-llvm
                  pkgs.zlib
                  riscv32.buildPackages.gcc
                ];
              };
          }
        )
      );
}
