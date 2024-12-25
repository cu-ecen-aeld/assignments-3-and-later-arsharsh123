#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")" || {
    echo "Error: Could not create directory."
    exit 1
}

# Write the string to the file
echo "$writestr" > "$writefile" || {
    echo "Error: Could not write to file $writefile."
    exit 1
}

exit 0
