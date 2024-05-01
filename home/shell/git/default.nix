{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "kriepiekrollie";
    userEmail = "benjamin.kleyn@gmail.com";
  };
}

