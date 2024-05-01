{ inputs, config, pkgs, lib, ... }:

{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  users.users.benjamin.packages = with pkgs; [
    gnome.gnome-mines
    minecraft
    lutris
    superTuxKart
    superTux
    pingus
    hedgewars
    dolphin-emu
    rpcs3
    (retroarch.override {
      cores = with libretro; [
        citra
        desmume
        gambatte
        vba-next
        nestopia
        snes9x
        mupen64plus
        dolphin
        pcsx-rearmed
        pcsx2
      ];
    })
    (callPackage ./emulationstation-de {})
  ];
}
