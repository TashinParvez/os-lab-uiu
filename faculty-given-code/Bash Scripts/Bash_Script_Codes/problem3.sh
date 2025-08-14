#!/bin/bash

# iterate through all files in directory
for file in *; do
    # check if file exists and is a regular one
    if ! [ -f "$file" ]; then
        continue
    fi
    # check if file name contains at least one digit
    if [[ "$file" =~ [0-9] ]]; then
        # rm -f "$file"
        echo "File $file deleted"
    fi
done