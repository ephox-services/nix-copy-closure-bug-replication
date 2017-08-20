{ stdenv, fetchurl, makeWrapper, jre }:

stdenv.mkDerivation rec {
  name = "dynamodb-local-${version}";
  version = "1.0.0";

  dynamoTarball = fetchurl {
    url = https://s3-ap-southeast-1.amazonaws.com/dynamodb-local-singapore/dynamodb_local_latest.tar.gz;
    sha256 = "d79732d7cd6e4b66fbf4bb7a7fc06cb75abbbe1bbbfb3d677a24815a1465a0b2";
  };

  nativeBuildInputs = [ makeWrapper ];

  unpackPhase = ''
    source $stdenv/setup
    mkdir -p $out $out/dynamo
    tar xf $dynamoTarball -C $out/dynamo
  '';

  installPhase = ''
    mkdir $out/bin
    makeWrapper ${jre}/bin/java $out/bin/dynamodb-local --add-flags "-jar $out/dynamo/DynamoDBLocal.jar"
  '';

}

