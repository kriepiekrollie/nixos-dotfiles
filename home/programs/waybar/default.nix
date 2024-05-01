{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 2;

      modules-left = [
        "hyprland/workspaces"
        "custom/media"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
        "pulseaudio"
        "network"
        "battery"
        "battery#bat2"
        "clock"
        "tray"
      ];
      "hyprland/workspaces" = {
        format = " {name} │ {windows} ";
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        window-rewrite = {
          "class<firefox>" = " ";
          "class<org.pwmt.zathura>" = " ";
          "class<sioyek>" = " ";
          "class<libreoffice-(.*)>" = " ";
          "class<shotwell>" =" ";
          "class<org.kde.kamoso>" = "󰵝 ";
          "class<cheese>" = "󰵝 ";
          "class<vlc>" = "󰕼 ";
          "class<Gimp.(.*)>" = " ";
          "class<org.kde.kdenlive>" = " ";
          "class<gnome-mines>" = "󰷚 ";
          "class<Minecraft Launcher>" = "󰍳 ";
          "class<steam>" = "󰓓 ";
          "class<discord>" = "󰙯 ";
          "class<alacritty>" = " ";
          "class<thunar>" = " ";
        };
        window-rewrite-default = "󰙵 ";
        format-window-separator = " ";
      };
      "hyprland/window" = {
        max-length = 100;
        separate-outputs = true;
      };
      tray = {
        icon-size = 21;
        spacing = 10;
      };
      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon}󱐋";
        format-critical = "{capacity}% 󰂎";
        format-alt = "{time} {icon}";

        format-icons = [
          "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
        ];
      };
      "battery#bat2" = {
        bat = "BAT2";
      };
      network = {
        # "interface": "wlp2*", // (Optional) To force the use of this interface
        format-wifi = "{essid}  ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      pulseaudio = {
        # "scroll-step": 1, // %, can be a float
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = "󰝟 {format_source}";
        format-source = "";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ 
            "󰕿" "󰖀" "󰕾"
          ];
        };
        on-click = "pavucontrol";
      };
    };
    style = ./style.css;
  };
}

