#!/bin/bash

# check at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

# iterate through list of arguments
for file in "$@"; do
    # check if file exists and is a regular one
    if [ -f "$file" ]; then
        # check if the file is executable
        if [ -x "$file" ]; then
            echo "File $file is executable"
            ls -la "$file"
            echo "File $file's permission is now changing: "
            chmod a-x "$file"
            ls -la "$file"
        fi
        echo "File $file is not executable"
    elif [ -e "$file" ]; then
        echo "File $file is not a regular file"
    else
        echo "File $file does not exist"
    fi
done