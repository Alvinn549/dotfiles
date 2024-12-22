#!/bin/bash

# Paths
SOURCE_FILE="$HOME/.config/Code/User/settings.json"
TARGET_FILE="$HOME/Projects/dotfiles/.config/Code/User/settings.json"

# Ensure the target directory exists
TARGET_DIR=$(dirname "$TARGET_FILE")
mkdir -p "$TARGET_DIR"

echo "Syncing $SOURCE_FILE to $TARGET_FILE..."

# Sync the file
rsync -av "$SOURCE_FILE" "$TARGET_FILE"

echo "File synced successfully."
