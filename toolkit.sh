#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

while true
do
    clear

    echo "=================================="
    echo " Linux DevOps Automation Toolkit"
    echo "=================================="
    echo
    echo "1. System Information"
    echo "2. Disk Monitor"
    echo "3. Memory Monitor"
    echo "4. Service Monitor"
    echo "5. Log Analyzer"
    echo "6. Backup Directory"
    echo "7. Exit"
    echo

    read -p "Choose an option: " CHOICE

    case "$CHOICE" in

        1)
            "$SCRIPT_DIR/scripts/system-info.sh"
            ;;

        2)
            "$SCRIPT_DIR/scripts/disk-monitor.sh"
            ;;

        3)
            "$SCRIPT_DIR/scripts/memory-monitor.sh"
            ;;

        4)
            "$SCRIPT_DIR/scripts/service-monitor.sh"
            ;;

        5)
            read -p "Enter log file path: " LOG_FILE
            "$SCRIPT_DIR/scripts/log-analyzer.sh" "$LOG_FILE"
            ;;

        6)
            read -p "Enter directory to backup: " BACKUP_SOURCE
            "$SCRIPT_DIR/scripts/backup.sh" "$BACKUP_SOURCE"
            ;;

        7)
            echo "Exiting toolkit..."
            exit 0
            ;;

        *)
            echo "Invalid option."
            ;;
    esac

    echo
    read -p "Press Enter to continue..."
done


