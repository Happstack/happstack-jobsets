{ system ? builtins.currentSystem }:
 let pkgs = import <nixpkgs> { inherit system; };
     jobs = rec {
    happstack-server-git =
       pkgs.haskellngPackages.callPackage <happstack-server-git> {};

    happstack-server-tls-git =
       pkgs.haskellngPackages.callPackage <happstack-server-tls-git> {};

    happstack-hsp-git =
       pkgs.haskellngPackages.callPackage <happstack-hsp-git> {};

    happstack-jmacro-git =
       pkgs.haskellngPackages.callPackage <happstack-jmacro-git> {};

    happstack-authenticate-git =
       pkgs.haskellngPackages.callPackage <happstack-authenticate-git> {};

    reform-git =
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform) {};

    haskell-reform-hsp =
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform-hsp) {};

    reform-happstack-git =
       pkgs.haskellngPackages.callPackage (<reform-git> + /reform-happstack) {};

    web-routes-git =
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes) {};

    web-routes-boomerang-git =
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-boomerang) {};

   web-routes-happstack-git =
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-happstack) {};

   web-routes-hsp-git =
       pkgs.haskellngPackages.callPackage (<web-routes-git> + /web-routes-hsp) {};

   web-plugins-git =
       pkgs.haskellngPackages.callPackage (<web-plugins-git> + /web-plugins) {};

   clckwrks-git =
       pkgs.haskellngPackages.callPackage <clckwrks-git> {};

   clckwrks-cli-git =
       pkgs.haskellngPackages.callPackage <clckwrks-cli-git> {};

   clckwrks-plugin-page-git =
       pkgs.haskellngPackages.callPackage <clckwrks-plugin-page-git> {};

   clckwrks-plugin-media-git =
       pkgs.haskellngPackages.callPackage <clckwrks-plugin-media-git> {};

   clckwrks-theme-bootstrap-git =
       pkgs.haskellngPackages.callPackage <clckwrks-theme-bootstrap-git> {};

   clckwrks-theme-clckwrks-git =
       pkgs.haskellngPackages.callPackage <clckwrks-theme-clckwrks-git> {};

   example-dot-org-git =
       pkgs.haskellngPackages.callPackage <example-dot-org-git> {};

   clckwrks-dot-com-git =
       pkgs.haskellngPackages.callPackage <clckwrks-dot-com-git> {};

   };
in
  jobs

