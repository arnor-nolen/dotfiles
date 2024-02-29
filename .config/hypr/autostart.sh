#!/bin/sh
# Notifications
dunst &
# Disk mounter
udiskie &
# Wayland bar
waybar &
# Wallpaper
hyprpaper &
# Foot terminal server
foot --server &
# Discord
discord --enable-features=UseOzonePlatform --ozone-platform=wayland &
# Set volume to 75 for all sinks, 100 for inputs
pulsemixer --list-sinks | awk '{print substr($3, 0, length($3) - 1)}' | xargs -I {} pulsemixer --id {} --set-volume 75
pulsemixer --list-sources | awk '{print substr($3, 0, length($3) - 1)}' | xargs -I {} pulsemixer --id {} --set-volume 100
