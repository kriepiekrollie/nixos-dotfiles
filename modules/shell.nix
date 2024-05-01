{ inputs, config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.java.enable = true;
  programs.npm.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    unzip
    p7zip
    unrar
    btop
    (python3.withPackages (ps: with ps; [
      numpy
      pillow
      requests
      networkx
    ]))
    gcc
    libgcc
    ghc
    nodejs
    neofetch
    termdown
    bat
    fzf
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    thefuck
    eza
    lf
    gh
    cava
    xorg.xauth
    appimage-run
    glxinfo
    mesa-demos
    ttyper
  ];

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

}
