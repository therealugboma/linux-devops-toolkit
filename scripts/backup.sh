#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/../backups"
LOG_DIR="$SCRIPT_DIR/../logs"
LOG_FILE="$LOG_DIR/backup.log"

mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

SOURCE_DIR="$1"

if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <directory-to-backup>"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

DATE=$(date "+%Y-%m-%d %H:%M:%S")

tar -czf "$BACKUP_PATH" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "$DATE SUCCESS: Backup created: $BACKUP_PATH" >> "$LOG_FILE"
    echo "Backup successful."
    echo "Created: $BACKUP_PATH"
else
    echo "$DATE ERROR: Backup failed for $SOURCE_DIR" >> "$LOG_FILE"
    echo "Backup failed."
    exit 1
fi
