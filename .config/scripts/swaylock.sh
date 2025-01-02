#!/bin/bash

# Set the directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/low-brightness"

# Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Catppuccin Darck color palette
COLOR_BG="#1e1e2f"         # Background color
COLOR_IN="#a0a1c0"         # Inside color
COLOR_RING="#c6a0f6"       # Ring color
COLOR_CLEAR_IN="#b5e3d8"   # Inside clear color
COLOR_CLEAR_RING="#6bd6c9" # Ring clear color
COLOR_VER_IN="#b6c6ff"     # Inside verify color
COLOR_VER_RING="#9b6fdf"   # Ring verify color
COLOR_WRONG_IN="#ff3f3f"   # Inside wrong color
COLOR_WRONG_RING="#f14c4c" # Ring wrong color

# Run swaylock with the desired options
swaylock --ignore-empty-password \
    --clock \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 7x5 \
    --effect-vignette 0.5:0.5 \
    --fade-in 0.2 \
    --indicator-caps-lock \
    --inside-color 00000088 \
    --ring-color "$COLOR_RING" \
    --inside-clear-color "$COLOR_CLEAR_IN" \
    --ring-clear-color "$COLOR_CLEAR_RING" \
    --inside-ver-color "$COLOR_VER_IN" \
    --ring-ver-color "$COLOR_VER_RING" \
    --inside-wrong-color "$COLOR_WRONG_IN" \
    --ring-wrong-color "$COLOR_WRONG_RING" \
    --image "$WALLPAPER"
