#!/bin/bash

# Threshold for disk utilization
THRESHOLD=50

# Get disk usage information
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is above the threshold. Sending email notification..."

    # Email details
    SUBJECT="Disk space utilization alert from application server"
    EMAIL="parithie053@gmail.com"
    MESSAGE="Disk usage is currently $DISK_USAGE%, which is above the threshold of $THRESHOLD%."

    # Send email notification
    echo "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
else
    echo "Disk usage is within the threshold: $DISK_USAGE%"
fi
