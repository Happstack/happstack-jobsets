{ mkDerivation, base, bytestring, doctest, Glob, hspec, HUnit
, QuickCheck, stdenv, text, time
}:
mkDerivation {
  pname = "http-api-data";
  version = "0.1.1.1";
  sha256 = "0xcy0cvjbwn8s03lrwnnihfsbyhhc4vq67q0xhb2gsvmfb2qdb1j";
  libraryHaskellDepends = [ base bytestring text time ];
  testHaskellDepends = [
    base doctest Glob hspec HUnit QuickCheck text time
  ];
  homepage = "http://github.com/fizruk/http-api-data";
  description = "Converting to/from HTTP API data like URL pieces, headers and query parameters";
  license = stdenv.lib.licenses.bsd3;
}
