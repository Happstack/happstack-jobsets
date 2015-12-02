{ mkDerivation, base, base64-bytestring, blaze-html, bytestring
, containers, directory, exceptions, extensible-exceptions
, filepath, hslogger, html, HUnit, monad-control, mtl, network
, network-uri, old-locale, parsec, process, sendfile, stdenv, syb
, system-filepath, template-haskell, text, threads, time
, time-compat, transformers, transformers-base, transformers-compat
, unix, utf8-string, xhtml, zlib
}:
mkDerivation {
  pname = "happstack-server";
  version = "7.4.5";
  sha256 = "15nwj4pszx161qm20d8vyj9kkqkzlyx76fk3c3cppr840ssi2jkh";
  libraryHaskellDepends = [
    base base64-bytestring blaze-html bytestring containers directory
    exceptions extensible-exceptions filepath hslogger html
    monad-control mtl network network-uri old-locale parsec process
    sendfile syb system-filepath template-haskell text threads time
    time-compat transformers transformers-base transformers-compat unix
    utf8-string xhtml zlib
  ];
  testHaskellDepends = [
    base bytestring containers HUnit parsec zlib
  ];
  homepage = "http://happstack.com";
  description = "Web related tools and services";
  license = stdenv.lib.licenses.bsd3;
}
