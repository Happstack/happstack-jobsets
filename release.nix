let
  jobs = rec {
    happstack-server-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-server-git> {};

    happstack-server-tls-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-server-tls-git> {};

    happstack-hsp-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-hsp-git> {};

    happstack-jmacro-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-jmacro-git> {};

   reform-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform) {};

   reform-hsp-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform-hsp) {};

   reform-happstack-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform-happstack) {};

  };
in
  jobs

