#!/bin/bash

# Configuration
DEVICE="/dev/nvme0n1"
STATE_FILE="$HOME/.nvme_smart_error_count"
LOG_FILE="$HOME/nvme_smart_monitor.log"

# Get current error count
CURRENT_COUNT=$(sudo smartctl -a "$DEVICE" | awk '/Error Information Log Entries:/ {print $NF}')

# If the state file doesn't exist, create it
if [ ! -f "$STATE_FILE" ]; then
    echo "$CURRENT_COUNT" > "$STATE_FILE"
    echo "$(date): Initial SMART error count recorded: $CURRENT_COUNT" >> "$LOG_FILE"
    exit 0
fi

# Read previous error count
PREV_COUNT=$(cat "$STATE_FILE")

# Compare and alert if increased
if [ "$CURRENT_COUNT" -gt "$PREV_COUNT" ]; then
    MSG="NVMe SMART error count increased: $PREV_COUNT → $CURRENT_COUNT"
    echo "$(date): $MSG" >> "$LOG_FILE"

    # Send desktop notification (if using GUI)
    if command -v notify-send &> /dev/null; then
        notify-send "⚠️ NVMe SMART Alert" "$MSG"
    fi
fi

# Update stored value
echo "$CURRENT_COUNT" > "$STATE_FILE"
