let
  jobs = rec {
    build =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; } in
      inherit (pkgs) haskellngPackages.happstack-server;
      }
  };
in
  jobs
