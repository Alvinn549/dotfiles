#!/bin/bash

# Paths
CONFIG_DIR="$HOME/.config"
REPO_DIR="$HOME/Projects/dotfiles/.config"

# Directories to sync
DIRECTORIES=("sway" "waybar" "alacritty" "neofetch" "qt5ct" "scripts" "swaync" "wlogout" "wofi")

sync_directory() {
  local source_dir="$CONFIG_DIR/$1"
  local target_dir="$REPO_DIR/$1"

  echo "Syncing $source_dir to $target_dir..."

  # Ensure target directory exists
  mkdir -p "$target_dir"

  # Sync files (delete removed files, copy new and modified ones)
  rsync -av --delete "$source_dir/" "$target_dir/"

  echo "$1 synced successfully."
}

echo "Starting config sync..."
for dir in "${DIRECTORIES[@]}"; do
  sync_directory "$dir"
done

# Paths
SOURCE_FILE="$HOME/.config/Code/User/settings.json"
TARGET_FILE="$HOME/Projects/dotfiles/.config/Code/User/settings.json"

# Ensure the target directory exists
TARGET_DIR=$(dirname "$TARGET_FILE")
mkdir -p "$TARGET_DIR"

echo "Syncing $SOURCE_FILE to $TARGET_FILE..."

# Sync the file
rsync -av "$SOURCE_FILE" "$TARGET_FILE"

# Sync ~/.zshrc to Projects/dotfiles/.zshrc
cp ~/.zshrc /home/alvin/Projects/dotfiles/.zshrc

echo "Config sync completed."
