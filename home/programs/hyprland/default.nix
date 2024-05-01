{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
    ];
    settings = {
    };
    extraConfig = ''
# This is an example Hyprland config file.
#
# Refer to the wiki for more information.

#
# Please note not all available settings / options are set here.
# For a full list, see the wiki
#

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=eDP-1,1920x1080@60,0x0,1

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
# exec-once = waybar & ags & hyprpaper & hyprpm reload -n
exec-once = hyprpaper & hyprpm reload -n

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Set programs that you use
$terminal = alacritty
$fileManager = thunar
$appmenu = wofi --show drun
$runmenu = wofi --show run
$windowmenu = wofi --show window
$wallpaperswitch = sh ~/.scripts/hyprSwitchWallpaper.sh
$screenshot = grim -g "$(slurp -d)"

# Some default env vars.
env = XCURSOR_SIZE,24

env = QT_QPA_PLATFORM,wayland
env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = QT_AUTO_SCREEN_SCALE_FACTOR,1

env = GTK_THEME,Catppuccin-Mocha-Standard-Mauve-Dark

env = ELECTRON_OZONE_PLATFORM_HINT,wayland

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = false
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 7
    gaps_out = 13
    border_size = 3
    col.active_border = rgba(cba6f7ee) rgba(89b4faee) 45deg
    col.inactive_border = rgba(585b70ee) rgba(333333ee) 45deg

    cursor_inactive_timeout = 15

    layout = dwindle

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 7

    blur {
        enabled = false
        size = 4
        passes = 1
        noise = 0.05
        # popups = true
        contrast = 1.4
        brightness = 1.4
        vibrancy = 0.2
    }

    active_opacity = 0.96
    inactive_opacity = 0.92
    fullscreen_opacity = 1.00

    dim_inactive = true
    dim_strength = 0.12

    drop_shadow = false
    shadow_range = 10
    shadow_render_power = 4
    shadow_offset = 0 0
    col.shadow = rgba(cba6f7ff)
    col.shadow_inactive = rgba(11111b00)

    # screen_shader = ~/.config/hypr/screenShader.frag
}

animations {
    enabled = true

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = overShoot, 0.05, 1.2, 0.5, 1.00
    bezier = easeOut, 0.10, 1.0, 0.5, 1.00

    animation = windows, 1, 7, overShoot
    animation = windowsOut, 1, 7, overShoot, popin 70%
    animation = border, 1, 10, overShoot
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 4, easeOut, slidefade 50%
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # you probably want this
}

master {
# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
# See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = true
    workspace_swipe_fingers = 3
}

misc {
# See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = 1 # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true
    disable_splash_rendering = true
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device {
    # name = epic-mouse-v1
    #     sensitivity = -0.5
}

plugin {
    hyprexpo {
        columns = 3
        gap_size = 0
        bg_col = rgb(11111b)
        workspace_method = first 1 # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = false # laptop touchpad, 4 fingers
        gesture_distance = 300 # how far is the "max"
        gesture_positive = false
    }
}

xwayland {
    force_zero_scaling = true
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# windowrulev2 = suppressevent maximize, class:.* # Youll probably like this.
windowrulev2 = opaque, class:shotwell
windowrulev2 = opaque, class:WebApp-Crunchyroll(.*)
windowrulev2 = opaque, class:Gimp.*
windowrulev2 = opaque, class:org.kde.kdenlive
windowrulev2 = opaque, class:steam
windowrulev2 = opaque, class:vlc
windowrulev2 = opaque, class:org.pwmt.zathura
windowrulev2 = opaque, class:libreoffice-(.*)
windowrulev2 = tile, class:Minecraft Launcher
windowrulev2 = float, class:steam, title:Friends List
windowrulev2 = float, class:steam, title:Steam Settings
windowrulev2 = fullscreen, class:org.libretro.(.*)

# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Delete, exit,
bind = $mainMod, W, killactive,
bind = $mainMod, T, togglefloating,
bind = $mainMod, F, fullscreen, 
bind = $mainMod SHIFT, F, fullscreen, 2
bind = $mainMod CTRL, F, fakefullscreen,
bind = $mainMod, M, fullscreen, 1
bind = $mainMod, Z, exec, $wallpaperswitch
bind = $mainMod, G, pin,

bind = $mainMod, Return, exec, $terminal
bind = $mainMod, E, exec, $fileManager

bind = $mainMod, space, exec, $appmenu
bind = $mainMod ALT, space, exec, $runmenu
bind = $mainMod, slash, exec, $windowmenu

bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, V, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Swap window with mainMod + SHIFT + arrow keys
bind = $mainMod SHIFT, H, swapwindow, l
bind = $mainMod SHIFT, L, swapwindow, r
bind = $mainMod SHIFT, K, swapwindow, u
bind = $mainMod SHIFT, J, swapwindow, d

# Swap window with mainMod + SHIFT + arrow keys
bind = $mainMod CTRL, H, movewindow, l
bind = $mainMod CTRL, L, movewindow, r
bind = $mainMod CTRL, K, movewindow, u
bind = $mainMod CTRL, J, movewindow, d

# Resize window with mainMod + ALT + arrow keys
binde = $mainMod ALT, H, resizeactive, -20 0
binde = $mainMod ALT, L, resizeactive, 20 0
binde = $mainMod ALT, K, resizeactive, 0 -20
binde = $mainMod ALT, J, resizeactive, 0 20

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Toggle group window
bind = $mainMod CTRL, grave, togglegroup
# Change active window in group with mainMod + Ctrl + [0-9]
bind = $mainMod CTRL, 1, changegroupactive, 1
bind = $mainMod CTRL, 2, changegroupactive, 2
bind = $mainMod CTRL, 3, changegroupactive, 3
bind = $mainMod CTRL, 4, changegroupactive, 4
bind = $mainMod CTRL, 5, changegroupactive, 5
bind = $mainMod CTRL, 6, changegroupactive, 6
bind = $mainMod CTRL, 7, changegroupactive, 7
bind = $mainMod CTRL, 8, changegroupactive, 8
bind = $mainMod CTRL, 9, changegroupactive, 9
bind = $mainMod CTRL, 0, changegroupactive, 10

# Example special workspace (scratchpad)
bind = $mainMod, grave, togglespecialworkspace, magic
bind = $mainMod SHIFT, grave, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + [ / ]
bind = $mainMod, bracketleft, workspace, -1
bind = $mainMod, bracketright, workspace, +1

# Move through existing workspaces with mainMod + SHIFT + [ / ]
bind = $mainMod SHIFT, bracketleft, movetoworkspace, -1
bind = $mainMod SHIFT, bracketright, movetoworkspace, +1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Hyprexpo
# bind = SUPER, tab, hyprexpo:expo, toggle # can be: toggle, off/disable or on/enable

# Brightness controls
binde = , XF86MonBrightnessUp, exec, brightnessctl s 1200+
binde = , XF86MonBrightnessDown, exec, brightnessctl s 1200-

# Volume controls
# binde = , XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5 --unmute
# binde = , XF86AudioLowerVolume, exec, pulsemixer --change-volume -5
# bind = , XF86AudioMicMute, exec, pulsemixer --id source-1 --toggle-mute
# bind = , XF86AudioMute, exec, pulsemixer --toggle-mute
binde = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Media controls
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioStop, exec, playerctl stop
bind = , XF86AudioNext, exec, playerctl previous
bind = , XF86AudioPrev, exec, playerctl next

# Screenshots
bind = , Print, exec, $screenshot

bind = $mainMod, Y, exec, ~/.scripts/hyprPowersaving.sh

    '';
  };
  home.file = {
    ".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
    ".scripts/hyprSwitchWallpaper.sh" = {
      source = ./hyprSwitchWallpaper.sh;
      executable = true;
    };
    ".scripts/hyprPowersaving.sh" = {
      source = ./hyprPowersaving.sh;
      executable = true;
    };
  };
}


