#!/bin/bash

# check exactly two arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number> <string>"
    exit 1
fi

# check if first argument is a number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "First argument is not a number"
    exit 1
fi

# $1: file name
# $2: line number
# $3: string
function delete_if_nth_line_contains_string {
    if grep -q -w "$3" <(sed -n "$2"p "$1"); then
        rm -f "$1"
        echo "File $1 deleted"
    fi
}

# iterate through *.txt files in current directory
for file in *.txt; do
    delete_if_nth_line_contains_string "$file" "$1" "$2"
done