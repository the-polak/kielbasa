#!/bin/bash

# @darthkielbasa
# learning shell scripting... Use cautiously!
echo "Proceed with caution..."

# Backup destination
BACKUP_DIR="$HOME/kde-backups"
BACKUP_FILE="kde-settings-backup-$(date +%Y%m%d).tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# List of KDE Plasma settings to backup
FILES_TO_BACKUP=(
    "$HOME/.config/plasma*"
    "$HOME/.config/kdeglobals"
    "$HOME/.config/kwinrc"
    "$HOME/.config/dolphinrc"
    "$HOME/.local/share/plasma/"
    "$HOME/.local/share/icons/"
    "$HOME/.local/share/aurorae/"
    "$HOME/.local/share/desktopthemes/"
    "$HOME/.local/share/color-schemes/"
    "$HOME/.config/kglobalshortcutsrc"
    "$HOME/.config/khotkeysrc"
    "$HOME/.config/autostart/"
)

# Compress the settings into a tar.gz archive
echo "Creating backup of KDE Plasma settings..."
tar -czvf "$BACKUP_DIR/$BACKUP_FILE" ${FILES_TO_BACKUP[@]}

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $BACKUP_DIR/$BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
