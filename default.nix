{ stdenv, fetchFromGitHub, libX11, libXinerama, zlib, libXft }:

stdenv.mkDerivation {
  pname = "dmenu";
  version = "5.2";

  # src = fetchFromGitHub {
  #   owner = "beni69";
  #   repo = "dmenu";
  #   rev = "";
  #   sha256 = "";
  # };
  src = ./.;

  buildInputs = [ libX11 libXinerama zlib libXft ];

  postPatch = ''
    sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
    sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
  '';

  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';

  makeFlags = [ "CC:=$(CC)" ];
}
