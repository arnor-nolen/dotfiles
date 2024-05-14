#!/bin/sh

# Set WLRoots renderer to Vulkan to avoid flickering
# Vulkan backend is not supported by Hyprland.
# export WLR_RENDERER=vulkan
# OpenGL Variables
export GBM_BACKEND=nvidia-drm
export __GL_GSYNC_ALLOWED=1
export __GL_VRR_ALLOWED=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia

/home/arnor/.scripts/run-hyprland.sh
