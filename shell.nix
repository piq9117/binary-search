{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;

  project = haskellPackages.callPackage ./default.nix {};
in
pkgs.stdenv.mkDerivation {
  name = "binary-search";
  buildInputs = project.env.nativeBuildInputs ++ [
    haskellPackages.cabal-install
    haskellPackages.ghc
    haskellPackages.ghcid
  ];
}
