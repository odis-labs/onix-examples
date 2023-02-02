{
  name = "fmt";
  version = "0.9.0";,
  src = {
    url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
    sha512 = "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
  };
  depends = [ "base-unix" "ocaml" ];
  build-depends = [ "ocamlbuild" "ocamlfind" "topkg" ];
  build = [
    ["ocaml" "pkg/pkg.ml" "build" "--dev-pkg" "false" "--with-base-unix" "true" "--with-cmdliner" "false"]
  ];
}
