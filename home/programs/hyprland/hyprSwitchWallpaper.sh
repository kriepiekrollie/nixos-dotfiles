((ls ~/Pictures/Wallpapers | grep -f ~/.current_wallpaper -A1 | (cat ; (ls ~/Pictures/Wallpapers | head -n 1)) | (sed '2q;d' > ~/.next_wallpaper)) && mv ~/.next_wallpaper ~/.current_wallpaper && hyprctl hyprpaper wallpaper "eDP-1,~/Pictures/Wallpapers/$(cat ~/.current_wallpaper)") || (ls ~/Pictures/Wallpapers | head -n 1 > ~/.current_wallpaper)

