#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
AREA_DIR="$DIR/Area-Screenshots"
FULLSCREEN_DIR="$DIR/Fullscreen-Screenshots"

mkdir -p "$AREA_DIR" "$FULLSCREEN_DIR"

timestamp=$(date +"%Y%m%d%H%M%S%N")

case "$1" in
  --area)
    FILE="$AREA_DIR/area-$timestamp.png"
    grim -g "$(slurp)" "$FILE"
    ;;
  --fullscreen)
    FILE="$FULLSCREEN_DIR/full-$timestamp.png"
    grim "$FILE"
    ;;
  *)
    echo "Usage: $0 [--area | --fullscreen]"
    exit 1
    ;;
esac

if [[ -f "$FILE" ]]; then
  notify-send -i "$HOME/.config/swaync/icons/screenshot.png" "Screenshot Saved" "File: $(basename "$FILE")" > /dev/null 2>&1
else
  notify-send -u critical "Screenshot Failed" "File not created"
fi
