#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist."
    exit 1
fi

# Count the number of files and matching lines
num_files=$(find "$filesdir" -type f | wc -l)
num_matches=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"
exit 0
