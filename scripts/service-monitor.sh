#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../config/services.conf"
LOG_FILE="$SCRIPT_DIR/../logs/service-monitor.log"

DATE=$(date "+%Y-%m-%d %H:%M:%S")

while read -r SERVICE
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$DATE OK: $SERVICE is running." >> "$LOG_FILE"
        echo "$SERVICE is running."
    else
        echo "$DATE WARNING: $SERVICE is NOT running." >> "$LOG_FILE"
        echo "WARNING: $SERVICE is NOT running."
    fi
done < "$CONFIG_FILE"
