#!/bin/sh

# Set WLRoots renderer to Vulkan to avoid flickering
# Vulkan backend is not supported by Hyprland.
# export WLR_RENDERER=vulkan
# Required to workaround a bug introduced in Linux 6.9
# https://github.com/hyprwm/Hyprland/issues/6273
export WLR_DRM_DEVICES=/dev/dri/card1
# OpenGL Variables
export GBM_BACKEND=nvidia-drm
export __GL_GSYNC_ALLOWED=1
export __GL_VRR_ALLOWED=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia

/home/arnor/.scripts/run-hyprland.sh
