{ nixpkgs  ? (import ./nixpin.nix { }) }:

import ./package.nix {
  inherit (nixpkgs) stdenv fetchurl makeWrapper jre;
}

