#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Store the filename provided as argument
filename="$1"

# Check if the file exists and is readable
if [ ! -r "$filename" ]; then
    echo "Error: File '$filename' not found or not readable."
    exit 1
fi

# Extract IP addresses using grep and store them in a temporary variable
tmp_ips=$(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$filename")

# Count occurrences of each unique IP address and print the results
echo "$tmp_ips" | sort | uniq -c
