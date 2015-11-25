{ system ? builtins.currentSystem }:
    let overrideCabal = drv: f: (drv.override (args: args // {
          mkDerivation = drv: args.mkDerivation (drv // f drv);
        })) // {
          overrideScope = scope: overrideCabal (drv.overrideScope scope) f;
        };
        pkgs = import <nixpkgs> { inherit system;
                                   config.packageOverrides = pkgs: rec
                                     { haskellPackages = pkgs.haskellPackages.override
                                         { overrides = self: super:
                                            { cabalsdist               = self.callPackage <cabalsdist-dit> {};
                                              jmacro                   = pkgs.stdenv.lib.overrideDerivation pkgs.haskellPackages.jmacro (oldAttrs: { patches = [ ./jmacro.patch ]; });
                                              clckwrks                 = self.callPackage <clckwrks-git> {};
                                              clckwrks-cli             = self.callPackage <clckwrks-cli-git> {};
                                              clckwrks-dot-com         = self.callPackage <clckwrks-dot-com-git> {};
                                              clckwrks-plugin-page     = self.callPackage <clckwrks-plugin-page-git> {};
                                              clckwrks-plugin-media    = self.callPackage <clckwrks-plugin-media-git> {};
                                              clckwrks-theme-bootstrap = self.callPackage <clckwrks-theme-bootstrap-git> {};
                                              clckwrks-theme-clckwrks  = self.callPackage <clckwrks-theme-clckwrks-git> {};
                                              example-dot-org          = self.callPackage <example-dot-org-git> {};
                                              hackage-whatsnew         = self.callPackage <hackage-whatsnew-git> {};
                                              happstack-authenticate   = self.callPackage <happstack-authenticate-git> {};
                                              happstack-clientession   = self.callPackage <happstack-clientsession-git> {};
                                              happstack-server         = self.callPackage <happstack-server-git> {};
                                              happstack-server-tls     = self.callPackage <happstack-server-tls-git> {};
                                              happstack-hsp            = self.callPackage <happstack-hsp-git> {};
                                              happstack-jmacro         = self.callPackage <happstack-jmacro-git> {};
                                              harp                     = overrideCabal super.harp (drv: { src = <harp-git>; });
                                              ixset-typed              = overrideCabal super.ixset-typed (drv: { src = <ixset-typed-git>; });
                                              magic                    = overrideCabal super.magic (drv: { extraLibraries = (drv.extraLibraries or []) ++ [pkgs.file]; });
#                                              vector                   = overrideCabal super.vector (drv: { doCheck = false; });
                                              reform                   = self.callPackage (<reform-git> + /reform) {};
                                              reform-blaze             = self.callPackage (<reform-git> + /reform-blaze) {};
                                              reform-happstack         = self.callPackage (<reform-git> + /reform-happstack) {};
                                              reform-hsp               = self.callPackage (<reform-git> + /reform-hsp) {};
                                              web-plugins              = self.callPackage (<web-plugins-git> + /web-plugins) {};
                                              web-routes               = self.callPackage (<web-routes-git> + /web-routes) {};
                                              web-routes-boomerang     = self.callPackage (<web-routes-git> + /web-routes-boomerang) {};
                                              web-routes-happstack     = self.callPackage (<web-routes-git> + /web-routes-happstack) {};
                                              web-routes-hsp           = self.callPackage (<web-routes-git> + /web-routes-hsp) {};
                                            };
                                         };
                                     };
                                };
     jobs = with pkgs.haskellPackages; rec {
       cabalsdist-git               = cabalsdist;
       hackage-whatsnew-git         = hackage-whatsnew;
       happstack-authenticate-git   = happstack-authenticate;
       happstack-server-git         = happstack-server;
       happstack-server-tls-git     = happstack-server-tls;
       happstack-hsp-git            = happstack-hsp;
       happstack-jmacro-git         = happstack-jmacro;
       reform-git                   = reform;
       reform-blaze-git             = reform-blaze;
       reform-hsp-git               = reform-hsp;
       reform-happstack-git         = reform-happstack;
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
in
  jobs
