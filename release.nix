{ system ? builtins.currentSystem }:
    let overrideCabal = drv: f: (drv.override (args: args // {
          mkDerivation = drv: args.mkDerivation (drv // f drv);
        })) // {
          overrideScope = scope: overrideCabal (drv.overrideScope scope) f;
        };
     pkgs = import ./web-core.nix { system = system; };
     ghcJobs = with pkgs.haskellPackages; rec {
       hackage-whatsnew-git         = hackage-whatsnew;
       happstack-authenticate-git   = happstack-authenticate;
       happstack-server-git         = happstack-server;
       happstack-server-745         = pkgs.haskellPackages.callPackage ./pkgs/happstack-server-7.4.5 {};
       happstack-server-tls-git     = happstack-server-tls;
       happstack-hsp-git            = happstack-hsp;
       happstack-jmacro-git         = happstack-jmacro;
       http-api-data-old            = http-api-data;
       reform-git                   = reform;
       reform-blaze-git             = reform-blaze;
       reform-hsp-git               = reform-hsp;
       reform-happstack-git         = reform-happstack;
       servant-git                  = servant;
       servant-happstack-git        = servant-happstack;
       web-routes-git               = web-routes;
       web-routes-boomerang-git     = web-routes-boomerang;
       web-routes-happstack-git     = web-routes-happstack;
       web-routes-hsp-git           = web-routes-hsp;
       web-plugins-git              = web-plugins;
       clckwrks-git                 = clckwrks;
       clckwrks-cli-git             = clckwrks-cli;
       clckwrks-plugin-page-git     = clckwrks-plugin-page;
       clckwrks-plugin-media-git    = clckwrks-plugin-media;
       clckwrks-theme-bootstrap-git = clckwrks-theme-bootstrap;
       clckwrks-theme-clckwrks-git  = clckwrks-theme-clckwrks;
       example-dot-org-git          = example-dot-org;
       clckwrks-dot-com-git         = clckwrks-dot-com;
    };

    ghcjsJobs = with pkgs.haskell.packages.ghcjs; rec {
      isomaniac-git                = isomaniac;
      servant-isomaniac-git        = servant-isomaniac;
      servant-git-ghcjs            = servant;
      http-api-data-old-ghcjs      = http-api-data;
    };
in
  ghcJobs // ghcjsJobs
