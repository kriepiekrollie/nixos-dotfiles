{ pkgs ? import <nixpkgs> {} } :

pkgs.appimageTools.wrapType2 {

  name = "emulationstation-de";
  version = "3.0.1";
  src = pkgs.fetchurl {
    url = "https://gitlab.com/es-de/emulationstation-de/-/package_files/117882100/download";
    sha256 = "sha256-vozcZdrI3x9Rp+7LxoOTXDPJRAaLPOnx9Tfb1oY+QxE=";
  };

  meta = with pkgs.lib; {
    description = "EmulationStation Desktop Edition is a frontend for browsing and launching games from your multi-platform game collection.";
    homepage = "https://es-de.org";
    license = licenses.mit;
    platforms = platforms.linux;
  };

}
