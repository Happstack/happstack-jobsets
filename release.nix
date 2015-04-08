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

    happstack-authenticate-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <happstack-authenticate-git> {};

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

   web-plugins-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage (<web-plugins-git> + /web-plugins) {};

   clckwrks-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-git> {};

   clckwrks-cli-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-cli-git> {};

   clckwrks-plugin-page-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-plugin-page-git> {};

   clckwrks-plugin-media-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-plugin-media-git> {};

   clckwrks-theme-bootstrap-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-theme-bootstrap-git> {};

   clckwrks-theme-clckwrks-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-theme-clckwrks-git> {};

   example-dot-org-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <example-dot-org-git> {};

   clckwrks-dot-com-git =
      { system ? builtins.currentSystem }:
      let pkgs = import <nixpkgs> { inherit system; };
      in
       pkgs.haskellngPackages.callPackage <clckwrks-dot-com-git> {};

   };
in
  jobs

