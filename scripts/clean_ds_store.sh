#!/bin/bash
#
# clean_ds_store.sh - Remove all .DS_Store files from the project
#
# Usage: ./clean_ds_store.sh [project_dir]
#
# Parameters:
#   project_dir - Root directory of the project (default: ..)
#
# Example:
#   ./clean_ds_store.sh ..
#
# Copyright © 2025 Sligh Games. All Rights Reserved.

set -e

# Default parameters
PROJECT_DIR=${1:-".."}

echo "Removing .DS_Store files from $PROJECT_DIR..."

# Find and remove all .DS_Store files
find "$PROJECT_DIR" -name ".DS_Store" -delete

echo "All .DS_Store files have been removed."

# Check if .gitignore exists
GITIGNORE_PATH="$PROJECT_DIR/.gitignore"
if [ -f "$GITIGNORE_PATH" ]; then
    # Check if .DS_Store is already in .gitignore
    if grep -q ".DS_Store" "$GITIGNORE_PATH"; then
        echo ".DS_Store is already in .gitignore"
    else
        echo "Adding .DS_Store to .gitignore..."
        echo -e "\n# macOS system files\n.DS_Store\n.DS_Store?\n._*\n.Spotlight-V100\n.Trashes" >> "$GITIGNORE_PATH"
        echo ".DS_Store added to .gitignore"
    fi
else
    echo "Creating .gitignore file..."
    echo -e "# macOS system files\n.DS_Store\n.DS_Store?\n._*\n.Spotlight-V100\n.Trashes" > "$GITIGNORE_PATH"
    echo ".gitignore file created with .DS_Store entries"
fi

echo "Cleanup complete."
