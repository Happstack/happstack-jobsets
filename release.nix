let
  jobs = rec {
    build =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; }; in
      pkgs.haskellngPackages.happstack-server;
  };
in
  jobs
