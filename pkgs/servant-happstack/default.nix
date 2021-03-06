{ mkDerivation, base, bytestring, case-insensitive, containers
, happstack-server, http-api-data, http-types, mmorph, mtl, network
, servant, stdenv, string-conversions, text, transformers, servant-src
}:
mkDerivation {
  pname = "servant-happstack";
  version = "0.1.0.0";
  src = (servant-src + /servant-happstack);
  libraryHaskellDepends = [
    base bytestring case-insensitive containers happstack-server
    http-api-data http-types mmorph mtl network servant
    string-conversions text transformers
  ];
  license = stdenv.lib.licenses.bsd3;
}
