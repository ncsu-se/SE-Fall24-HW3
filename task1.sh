#!/bin/bash

# Find all PIDs of infinite.sh
PIDS=$(pgrep -f infinite.sh)

# Check if any PIDs were found
if [ -z "$PIDS" ]; then
    echo "infinite.sh is not running."
else
    # Loop through each PID and kill the process
    for PID in $PIDS; do
        kill "$PID"
        echo "Killed infinite.sh with PID: $PID"
    done
fi