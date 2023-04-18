#!/bin/sh

# Notifications
dunst &
# Set volume to 50 for headphones and speakers
pulsemixer --id sink-1 --set-volume 75 --id sink-3 --set-volume 75
# Disk mounter
udiskie &
# Wallpaper
hyprpaper &
# Foot terminal server
foot --server &
# Check pacman updates
pacman -Sy &
# dwlb bar
dwlb -ipc &
# Wayland resolution
/home/arnor/.scripts/wl-resolution.sh
