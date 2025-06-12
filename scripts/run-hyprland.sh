#!/bin/sh

# Hardware cursors not yet working on wlroots
export WLR_NO_HARDWARE_CURSORS=1

# General wayland environment variables
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Firefox wayland environment variable
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

# Set cursor theme for legacy applications.
# GTK cursor settings are set from autostart.sh.
export XCURSOR_THEME=Phinger
export XCURSOR_SIZE=24

# Enable mangohud for games.
export MANGOHUD=1
export MANGOHUD_CONFIG=no_display

# Jira
if [ -e ~/jira-token.txt ]
then
    export JIRA_API_TOKEN=$(cat ~/jira-token.txt)
fi

Hyprland
