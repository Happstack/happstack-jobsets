{ mkDerivation, base, base64-bytestring, blaze-html, bytestring
, containers, directory, exceptions, extensible-exceptions
, fetchgit, filepath, hslogger, html, HUnit, monad-control, mtl
, network, network-uri, old-locale, parsec, process, sendfile
, stdenv, syb, system-filepath, template-haskell, text, threads
, time, time-compat, transformers, transformers-base
, transformers-compat, unix, utf8-string, xhtml, zlib
}:
mkDerivation {
  pname = "happstack-server";
  version = "7.4.2";
  src = fetchgit {
    url = "https://github.com/Happstack/happstack-server.git";
    sha256 = "97b51428b61ab373d0d7d86c9240dca86fbbea6692c92ec57624cade1bb0228b";
    rev = "030f4013e6ba2b71ec87921474ae6cf38c751caa";
  };
  buildDepends = [
    base base64-bytestring blaze-html bytestring containers directory
    exceptions extensible-exceptions filepath hslogger html
    monad-control mtl network network-uri old-locale parsec process
    sendfile syb system-filepath template-haskell text threads time
    time-compat transformers transformers-base transformers-compat unix
    utf8-string xhtml zlib
  ];
  testDepends = [ base bytestring containers HUnit parsec zlib ];
  homepage = "http://happstack.com";
  description = "Web related tools and services";
  license = stdenv.lib.licenses.bsd3;
}
