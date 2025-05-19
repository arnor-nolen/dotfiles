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

# Jira
if [ -e ~/jira-token.txt ]
then
    export JIRA_API_TOKEN=$(cat ~/jira-token.txt)
fi

dwl
