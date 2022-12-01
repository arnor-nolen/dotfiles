#!/bin/sh
# Source .Xresources (for some DMs)
xrdb -merge ~/.Xresources
# Numlock on
numlockx &
# Notifications
dunst &
# Set background image
~/.fehbg
# Compositor
picom &
# Set volume to 50 for headphones and speakers
pulsemixer --id sink-1 --set-volume 75 --id sink-3 --set-volume 75
# Disk mounter
udiskie &
# Statusbar loop
dwmblocks &
# Set keyboard layouts
setxkbmap -layout us,ru,fi -option grp:win_space_toggle
# Start discord
discord &
# Check pacman updates
pacman -Sy &

