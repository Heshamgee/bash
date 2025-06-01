#!/bin/bash
# alert by mail if the usage more 80% 
THRESHOLD=80
EMAIL="admin@example.com"

df -h | grep '^/dev/' | while read line; do
  usage=$(echo $line | awk '{print $5}' | tr -d '%')
  mount=$(echo $line | awk '{print $6}')
  
  if [ "$usage" -gt "$THRESHOLD" ]; then
    echo "Disk space on $mount is above $THRESHOLD% ($usage%)" | mail -s "Disk Alert on $(hostname)" $EMAIL
  fi
done
