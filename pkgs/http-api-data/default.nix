{ mkDerivation, base, bytestring, doctest, Glob, hspec, HUnit
, QuickCheck, stdenv, text, time
}:
mkDerivation {
  pname = "http-api-data";
  version = "0.2.1";
  sha256 = "0wbgqn4w1snf5rdzr313756h2i8w7a4mhbsj9gdhqxs5k7bkhqc5";
  libraryHaskellDepends = [ base bytestring text time ];
  testHaskellDepends = [
    base doctest Glob hspec HUnit QuickCheck text time
  ];
  homepage = "http://github.com/fizruk/http-api-data";
  description = "Converting to/from HTTP API data like URL pieces, headers and query parameters";
  license = stdenv.lib.licenses.bsd3;
}
