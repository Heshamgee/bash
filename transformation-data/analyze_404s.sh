#!/bin/bash

# Define log file
echo "USAGE analyze_404s.sh [log_file]"
LOG_FILE=${1}

# Check if log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

echo "Top 5 IPs causing 404 errors:"

# Process the log
grep " 404 " "$LOG_FILE" | \
awk '{print $1, $7}' | \
sed 's|//|/|g' | \
awk '{ips[$1]++} END {for (ip in ips) print ips[ip], ip}' | \
sort -rn | head -n 5
