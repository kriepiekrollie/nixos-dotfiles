{ inputs, config, pkgs, lib, ... }:

{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.waybar.enable = true;
  programs.thunar.enable = true;
  programs.firefox.enable = true;

  users.users.benjamin.packages = with pkgs; [
    hyprpaper
    alacritty
    libnotify
    mako
    wofi
    grim 
    slurp
    wl-clipboard
    eww
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    (nerdfonts.override {
      fonts = [
        "IosevkaTerm"
        "FiraMono"
        "JetBrainsMono"
        "Inconsolata"
      ];
    })
  ];
  
}
