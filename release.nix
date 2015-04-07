let
  jobs = rec {
    happstackServerGit =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-server-git> {};

    happstackServerTlsGit =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-server-tls-git> {};
  };
in
  jobs

