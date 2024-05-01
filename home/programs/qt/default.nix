{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "lightly-dark";
      package = pkgs.lightly-qt;
    };
  };
}

