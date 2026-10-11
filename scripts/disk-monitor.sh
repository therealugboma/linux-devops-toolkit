#!/bin/bash

THRESHOLD=80
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$SCRIPT_DIR/../logs/disk-monitor.log"

USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

DATE=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "$DATE WARNING: Disk usage is ${USAGE}%." >> "$LOG_FILE"
    echo "WARNING: Disk usage is ${USAGE}%."
else
    echo "$DATE OK: Disk usage is ${USAGE}%." >> "$LOG_FILE"
    echo "Disk usage is normal: ${USAGE}%."
fi
