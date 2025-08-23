#!/bin/bash

mkdir -p Rootkits

# Loop through all text files
for file in *.txt; do

    if grep -q "rootkit" "$file"; 
    then
        # Get the rootkit name from the last line
        rootkit_name=$(tail -n 1 "$file")

        # Move and rename the file
        mv "$file" "Rootkits/$rootkit_name.txt"
        echo "$file moved and renamed to Rootkits/$rootkit_name.txt"
    fi

done
