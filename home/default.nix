{ config, pkgs, ... }: 

{

  imports = [
    ./programs
    ./shell
  ];

  home = {
    username = "benjamin";
    homeDirectory = "/home/benjamin";
    stateVersion = "24.05";
    packages = [
      pkgs.hello
    ];
    pointerCursor = {
      x11.enable = true;
      gtk.enable = true;
      size = 16;
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };

  programs.home-manager = {
    enable = true;
  };

}
