#!/bin/bash

#!/bin/bash

# Find all text files in the current working directory (including subdirectories)
find . -type f -name "*.txt" | while read -r file; do
    # Extract the necessary lines using head and tail commands
    player_name=$(head -n 1 "$file")  # Player name (1st line)
    country=$(head -n 2 "$file" | tail -n 1)  # Country (2nd line)
    role=$(head -n 4 "$file" | tail -n 1)     # Role (4th line)
    
    # Construct the destination directory path
    destination="./$country/$role"
    mkdir -p "$destination"                     # Create the directory if it doesn't exist
    
    # Move and rename the file
    mv "$file" "$destination/$player_name.txt"
done


# Loop through all directories in the current working directory (recursive)
for dir in $(find . -type d); do
    # Check if the directory is empty
    if [ "$(ls -A "$dir")" == "" ]; then
        # Remove the empty directory
        rmdir "$dir"
    fi
done

# # Remove empty directories in a bottom-up fashion
# find . -type d -empty -delete
