{ inputs, config, pkgs, lib, ... }:

{
  users.users.benjamin.packages = with pkgs; [
    droidcam
    libreoffice-qt
    sioyek
    discord
    gimp
    wine
    winetricks
    obsidian
    virtualbox
    inkscape
    obs-studio
    qbittorrent-qt5
    shotwell
    vlc
    gedit
    networkmanagerapplet
    gnome.gnome-calculator
    tuxpaint
    texlive.combined.scheme-full
  ];
}
