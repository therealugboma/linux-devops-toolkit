#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="$SCRIPT_DIR/../logs"
REPORT_FILE="$LOG_DIR/log-analysis-report.txt"

mkdir -p "$LOG_DIR"

INPUT_LOG="$1"

if [ -z "$INPUT_LOG" ]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

if [ ! -f "$INPUT_LOG" ]; then
    echo "Error: Log file not found."
    exit 1
fi

ERROR_COUNT=$(grep -i -c "error" "$INPUT_LOG")
FAILED_COUNT=$(grep -i -c "failed" "$INPUT_LOG")
WARNING_COUNT=$(grep -i -c "warning" "$INPUT_LOG")
CRITICAL_COUNT=$(grep -i -c "critical" "$INPUT_LOG")

{
    echo "=============================="
    echo " Log Analysis Report"
    echo "=============================="
    echo "File: $INPUT_LOG"
    echo "Date: $(date)"
    echo
    echo "Errors: $ERROR_COUNT"
    echo "Failed: $FAILED_COUNT"
    echo "Warnings: $WARNING_COUNT"
    echo "Critical: $CRITICAL_COUNT"
    echo "=============================="
} > "$REPORT_FILE"

cat "$REPORT_FILE"
