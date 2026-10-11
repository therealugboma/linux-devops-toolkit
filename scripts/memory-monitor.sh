#!/bin/bash

THRESHOLD=80

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$SCRIPT_DIR/../logs/memory-monitor.log"

TOTAL=$(free -m | awk '/Mem:/ {print $2}')
USED=$(free -m | awk '/Mem:/ {print $3}')

USAGE=$(( USED * 100 / TOTAL ))

DATE=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "$DATE WARNING: Memory usage is ${USAGE}%." >> "$LOG_FILE"
    echo "WARNING: Memory usage is ${USAGE}%."
else
    echo "$DATE OK: Memory usage is ${USAGE}%." >> "$LOG_FILE"
    echo "Memory usage is normal: ${USAGE}%."
fi
