#!/bin/bash

# Paths
CONFIG_DIR="$HOME/.config"
REPO_DIR="$HOME/Projects/dotfiles/.config"
ROOT_REPO="$HOME/Projects/dotfiles"
WALLPAPER_SOURCE_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER_TARGET_DIR="$ROOT_REPO/Wallpapers"

# Config directories to sync
DIRECTORIES=("sway" "waybar" "alacritty" "neofetch" "qt5ct" "scripts" "swaync" "wlogout" "wofi")

sync_directory() {
  local source_dir="$1"
  local target_dir="$2"

  echo "Syncing $source_dir to $target_dir..."

  # Ensure target directory exists
  mkdir -p "$target_dir"

  # Sync files (delete removed files, copy new and modified ones)
  rsync -av --delete "$source_dir/" "$target_dir/"

  echo "$(basename "$source_dir") synced successfully."
}

sync_file() {
  local source_file="$1"
  local target_file="$2"

  echo "Syncing $source_file to $target_file..."

  # Ensure the target directory exists
  mkdir -p "$(dirname "$target_file")"

  # Sync the file
  rsync -av "$source_file" "$target_file"

  echo "$(basename "$source_file") synced successfully."
}

echo "Starting config sync..."

for dir in "${DIRECTORIES[@]}"; do
  sync_directory "$CONFIG_DIR/$dir" "$REPO_DIR/$dir"
done

# Sync additional files
sync_file "$HOME/.config/Code/User/settings.json" "$ROOT_REPO/.config/Code/User/settings.json"
sync_file "$HOME/.zshrc" "$ROOT_REPO/.zshrc"

# Sync Wallpapers
echo "Syncing Wallpapers..."
sync_directory "$WALLPAPER_SOURCE_DIR" "$WALLPAPER_TARGET_DIR"

echo "Config and Wallpaper sync completed."

# Check for changes in the Git repository
cd "$ROOT_REPO" || { echo "Failed to change directory to $ROOT_REPO"; exit 1; }

if git diff-index --quiet HEAD --; then
  echo "No changes detected. Exiting."
else
  echo "Changes detected. Preparing to commit."
  git status

  # Prompt user for commit message
  read -rp "Enter your commit message: " COMMIT_MSG

  # Stage, commit, and push changes
  git add .
  git commit -m "$COMMIT_MSG"
  git push origin main

  echo "Changes pushed successfully."
fi
