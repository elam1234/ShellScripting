#!/bin/bash

# Define variables
source_dir="DB_folder"
dest_dir="databackups"
retention_period=30

# Create timestamp
TIMESTAMP=$(date +%y%m%d_%H%M%S)

# Delete existing backups
existing_backups=$(find "$dest_dir" -name "backup_*.tar.gz")
if [ -n "$existing_backups" ]; then
    rm -r "$existing_backups"
fi

# Backup the directory
tar -czf "${dest_dir}/backup_${TIMESTAMP}.tar.gz" "$source_dir"
