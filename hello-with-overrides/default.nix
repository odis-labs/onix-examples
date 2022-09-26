{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
  onix = import ./nix/onix.nix { inherit pkgs ocamlPackages; };

in {
  scope = onix.build {
    lockFile = ./onix-lock.nix;
    overrides = self: super: {
      dune = pkgs.dune_3;
      ocaml-base-compiler = ocamlPackages.ocaml;
    };
  };

  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f";
  };
}