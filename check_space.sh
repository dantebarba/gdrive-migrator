#!/bin/sh
set -e

# Function to calculate remaining space and exit with an error if it's less than the threshold
# Get the directory path from the function argument
directory="$1"

# Get the threshold size from the function argument
threshold="$2"

# Get the remaining space in the specified directory
remaining_space=$(df -B1 "$directory" | awk 'NR==2 {print $4}')

# Convert the threshold to bytes for comparison
suffix=$(echo "$threshold" | sed 's/[0-9]//g')
value=$(echo "$threshold" | sed 's/[^0-9]//g')

case "$suffix" in
"K")
    threshold_bytes=$(( value * 1024 ))
    ;;
"M")
    threshold_bytes=$(( value * 1024 * 1024 ))
    ;;
"G")
    threshold_bytes=$(( value * 1024 * 1024 * 1024 ))
    ;;
"T")
    threshold_bytes=$(( value * 1024 * 1024 * 1024 * 1024 ))
    ;;
*)
    echo "Invalid threshold format. Please use one of the following formats: 10M, 1G, 1T, 100K."
    exit 1
    ;;
esac

# Check if remaining space is less than the threshold
if [ "$remaining_space" -lt "$threshold_bytes" ]; then
echo "Error: Insufficient remaining space in '$directory'."
exit 1
else
echo "Remaining space in '$directory' is sufficient: $remaining_space bytes."
fi
