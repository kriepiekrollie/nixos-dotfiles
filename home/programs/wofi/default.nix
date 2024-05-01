{ inputs, config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 800;
      height = 600;
      always_parse_args = true;
      show_all = false;
      term = "alacritty";
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      prompt = "";
      columns = 2;
      allow_images = true;
      key_down = "Ctrl-j";
      key_up = "Ctrl-k";
      key_left = "Ctrl-h";
      key_right = "Ctrl-l";
      key_expand = "Ctrl-Tab";
    };
    # style = " for some reason this only allows string or null?";
  };
  # I'll just do it this way instead ugh
  home.file.".config/wofi/style.css".source = ./style.css;
}

