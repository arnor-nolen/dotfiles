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
# Discord
discord --enable-features=UseOzonePlatform --ozone-platform=wayland &
# Status bar
killall status-text
status-text | dwlb -status-stdin all &

# Screen capture.
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
systemctl --user start wireplumber

