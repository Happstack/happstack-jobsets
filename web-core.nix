# core packages for web developement
{ cabalsdist-src ? <cabalsdist-src>
, clckwrks-src ? <clckwrks-src>
, clckwrks-cli-src ? <clckwrks-cli-src>
, clckwrks-dot-com-src ? <clckwrks-dot-com-src>
, clckwrks-plugin-page-src ? <clckwrks-plugin-page-src>
, clckwrks-plugin-media-src ? <clckwrks-plugin-media-src>
, clckwrks-theme-bootstrap-src ? <clckwrks-theme-bootstrap-src>
, clckwrks-theme-clckwrks-src ? <clckwrks-theme-clckwrks-src>
, example-dot-org-src ? <example-dot-org-src>
, hackage-whatsnew-src ? <hackage-whatsnew-src>
, happstack-authenticate-src ? <happstack-authenticate-src>
, happstack-clientsession-src ? <happstack-clientsession-src>
, happstack-server-src ? <happstack-server-src>
, happstack-server-tls-src ? <happstack-server-tls-src>
, happstack-hsp-src ? <happstack-hsp-src>
, happstack-jmacro-src ? <happstack-jmacro-src>
, harp-src ? <harp-src>
, isomaniac-src ? <isomaniac-src>
, ixset-typed-src ? <ixset-typed-src>
, reform-src ? <reform-src>
, servant-isomaniac-src ? <servant-isomaniac-src>
, web-routes-src  ? <web-routes-src>
, web-plugins-src ? <web-plugins-src>
, system ? builtins.currentSystem
}:
let overrideCabal = drv: f: (drv.override (args: args // {
          mkDerivation = drv: args.mkDerivation (drv // f drv);
        })) // {
          overrideScope = scope: overrideCabal (drv.overrideScope scope) f;
        };

    web-core-pkgs = import <nixpkgs> {
      inherit system;
      config.packageOverrides = pkgs: rec {
        # packages to build with GHC
        haskellPackages = pkgs.haskellPackages.override {
         overrides = self: super: {
          cabalsdist               = self.callPackage cabalsdist-src {};
          Clckwrks                 = self.callPackage clckwrks-src {};
          clckwrks-cli             = self.callPackage clckwrks-cli-src {};
          clckwrks-dot-com         = self.callPackage clckwrks-dot-com-src {};
          clckwrks-plugin-page     = self.callPackage clckwrks-plugin-page-src {};
          clckwrks-plugin-media    = self.callPackage clckwrks-plugin-media-src {};
          clckwrks-theme-bootstrap = self.callPackage clckwrks-theme-bootstrap-src {};
          clckwrks-theme-clckwrks  = self.callPackage clckwrks-theme-clckwrks-src {};
          example-dot-org          = self.callPackage example-dot-org-src {};
          hackage-whatsnew         = self.callPackage hackage-whatsnew-src {};
          happstack-authenticate   = self.callPackage happstack-authenticate-src {};
          happstack-clientession   = self.callPackage happstack-clientsession-src {};
          happstack-server         = self.callPackage happstack-server-src {};
          happstack-server-tls     = self.callPackage happstack-server-tls-src {};
          happstack-hsp            = self.callPackage happstack-hsp-src {};
          happstack-jmacro         = self.callPackage happstack-jmacro-src {};
          harp                     = overrideCabal super.harp (drv: { src = harp-src; });
          http-api-data            = self.callPackage ./pkgs/http-api-data {};
          ixset-typed              = overrideCabal super.ixset-typed (drv: { src = ixset-typed-src; });
          magic                    = overrideCabal super.magic (drv: { extraLibraries = (drv.extraLibraries or []) ++ [pkgs.file]; });
          reform                   = self.callPackage (reform-src + /reform) {};
          reform-blaze             = self.callPackage (reform-src + /reform-blaze) {};
          reform-happstack         = self.callPackage (reform-src + /reform-happstack) {};
          reform-hsp               = self.callPackage (reform-src + /reform-hsp) {};
          servant                  = self.callPackage ./pkgs/servant {};
          servant-happstack        = self.callPackage ./pkgs/servant-happstack {};
          web-plugins              = self.callPackage (web-plugins-src + /web-plugins) {};
          web-routes               = self.callPackage (web-routes-src + /web-routes) {};
          web-routes-boomerang     = self.callPackage (web-routes-src + /web-routes-boomerang) {};
          web-routes-happstack     = self.callPackage (web-routes-src + /web-routes-happstack) {};
          web-routes-hsp           = self.callPackage (web-routes-src + /web-routes-hsp) {};
         };
        };

        # packages to build with GHCJS
        haskell = pkgs.haskell // {
         packages = pkgs.haskell.packages // {
          ghcjs = pkgs.haskell.packages.ghcjs.override rec {
           overrides = self: super: {
            http-api-data            = self.callPackage ./pkgs/http-api-data {};
            isomaniac                = self.callPackage isomaniac-src {};
            servant                  = self.callPackage ./pkgs/servant {};
            servant-isomaniac        = self.callPackage servant-isomaniac-src {};
           };
          };
         };
        };
       };
      };
 in
  web-core-pkgs
