#!/bin/sh

# Screen capture.
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
systemctl --user start wireplumber
# Notifications
dunst &
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
# Set volume to 75 for all sinks, 100 for inputs
sleep 3 && pulsemixer --list-sinks | awk '{print substr($3, 0, length($3) - 1)}' | xargs -I {} pulsemixer --id {} --set-volume 75 && kill -37 $(pidof status-text) & 
sleep 3 && pulsemixer --list-sources | awk '{print substr($3, 0, length($3) - 1)}' | xargs -I {} pulsemixer --id {} --set-volume 100 && kill -37 $(pidof status-text) &
# Status bar
killall status-text
status-text | dwlb -status-stdin all &

# Set cursor theme for GTK applications.
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface cursor-theme Phinger
