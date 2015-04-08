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

    web-routes-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes) {};

    web-routes-boomerang-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-boomerang) {};

   web-routes-happstack-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-happstack) {};

   web-routes-hsp-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-hsp) {};

   };
in
  jobs

