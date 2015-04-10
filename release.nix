{ system ? builtins.currentSystem }:
    let pkgs = import <nixpkgs> { inherit system;
                                   config.packageOverrides = pkgs: rec
                                     { haskellngPackages = pkgs.haskellngPackages.override
                                         { overrides = self: super:
                                            { clckwrks                 = self.callPackage <clckwrks-git> {};
                                              clckwrks-cli             = self.callPackage <clckwrks-cli-git> {};
                                              clckwrks-dot-com         = self.callPackage <clckwrks-dot-com-git> {};
                                              clckwrks-plugin-page     = self.callPackage <clckwrks-plugin-page-git> {};
                                              clckwrks-plugin-media    = self.callPackage <clckwrks-plugin-media-git> {};
                                              clckwrks-theme-bootstrap = self.callPackage <clckwrks-theme-bootstrap-git> {};
                                              clckwrks-theme-clckwrks  = self.callPackage <clckwrks-theme-clckwrks-git> {};
                                              example-dot-org          = self.callPackage <example-dot-org-git> {};
                                              happstack-authenticate   = self.callPackage <happstack-authenticate-git> {};
                                              happstack-server         = self.callPackage <happstack-server-git> {};
                                              happstack-server-tls     = self.callPackage <happstack-server-tls-git> {};
                                              happstack-hsp            = self.callPackage <happstack-hsp-git> {};
                                              happstack-jmacro         = self.callPackage <happstack-jmacro-git> {};
                                              reform                   = self.callPackage (<reform-git> + /reform) {};
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
     jobs = with pkgs.haskellngPackages; rec {
       happstack-authenticate-git   = happstack-authenticate;
       happstack-server-git         = happstack-server;
       happstack-server-tls-git     = happstack-server-tls;
       happstack-hsp-git            = happstack-hsp;
       happstack-jmacro-git         = happstack-jmacro;
       reform-git                   = reform;
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


