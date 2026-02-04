#!/bin/bash
# Hourly navinote sync for tmux status-right
# Only runs if NAVINOTE_ZET_DIR is set and an hour has passed

[ -z "$NAVINOTE_ZET_DIR" ] && exit 0

TIMESTAMP_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/navinote-last-sync"
mkdir -p "$(dirname "$TIMESTAMP_FILE")"

# Check if an hour (3600 seconds) has passed
if [ -f "$TIMESTAMP_FILE" ]; then
    last_sync=$(cat "$TIMESTAMP_FILE")
    now=$(date +%s)
    elapsed=$((now - last_sync))
    [ "$elapsed" -lt 3600 ] && exit 0
fi

# Update timestamp first to prevent concurrent runs
date +%s > "$TIMESTAMP_FILE"

# Run sync in background
navinote-sync >/dev/null 2>&1 &
