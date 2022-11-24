{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
  onix = import ./nix/onix.nix { inherit pkgs ocamlPackages; };
in rec {
  scope = onix.build {
    lockFile = ./onix-lock.nix;
  };
  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f";
    resolutions = { "ocaml-system" = "*"; };
    withTest = true;
    withDoc = true;
    withDevSetup = true;
  };
  shell = pkgs.mkShell { inputsFrom = [ scope.hello-with-dep-flags ]; };
}