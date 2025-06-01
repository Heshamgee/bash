#!/bin/bash
# this script archive log files older than 7 days.

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
MAX_DAYS=7

mkdir -p "$ARCHIVE_DIR"

# Rotate logs older than MAX_DAYS
find "$LOG_DIR" -type f -name "*.log" -mtime +$MAX_DAYS -exec gzip {} \; -exec mv {}.gz "$ARCHIVE_DIR" \;

echo "Log rotation complete: $(date)"
