#!/bin/bash                       

submission_folder="submission"     # Folder containing the student scripts

files=("$submission_folder"/*.sh)  # Create an array of all .sh files in the folder

num_files=0
for file in *.txt
do
    ((num_files++))
done
echo $num_files  # total num of .sh files


for ((i=0; i<num_files; i++)); do          # Loop over each file as the first file in the pair
    for ((j=i+1; j<num_files; j++)); do    # Loop over subsequent files as the second file in the pair
        
        file1="${files[i]}"                # Assign the first file to a variable
        file2="${files[j]}"                # Assign the second file to a variable

        if diff -w -B "$file1" "$file2" >/dev/null; then   # Compare files ignoring whitespace and blank lines
            echo "$(basename "$file1") and $(basename "$file2") are same"  # Print message if files are identical
        fi                                   
    done                                    
done                                         

 