{
  nixpkgs,
  flake-utils,
  latix,
  ...
}:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    inherit (latix.lib.${system}) buildLatexmkProject;
    pkgs = import nixpkgs { inherit system; };
    inherit (pkgs) lib;
    packages = {
      "internships/spring-break-2024" = buildLatexmkProject {
        name = "internships-spring-break-2024";
        buildInputs = [
          (pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-basic
              enumitem
              isodate
              substr
              ;
          })
        ];
        src = lib.fileset.toSource {
          root = ./.;
          fileset = ./spring-break-2024.tex;
        };
        filename = "spring-break-2024.tex";
        preBuild = ''
          mkdir -p "$TMPDIR/texmf-var"
          export TEXMFCACHE="$TMPDIR/texmf-var"
          export TEXMFVAR="$TMPDIR/texmf-var"
        '';
      };
    };
  in
  {
    inherit packages;
    checks = packages;
  }
)
