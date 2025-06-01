#!/bin/bash

SRC_DIR="/home/username/data"
BACKUP_DIR="/mnt/backups"
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
FILENAME="backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$FILENAME" "$SRC_DIR"

echo "Backup created at $BACKUP_DIR/$FILENAME"


