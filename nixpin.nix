let
  _nixpkgs = import <nixpkgs> {};
  nixpkgs = _nixpkgs.fetchFromGitHub (_nixpkgs.lib.importJSON ./nixpin.json);
in
  import nixpkgs

