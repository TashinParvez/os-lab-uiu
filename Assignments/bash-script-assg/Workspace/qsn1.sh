#! /bin/bash

# ================== dir make ==================
mkdir -p targets


i=1

for file in submissions/*.zip;
do
    # ================== get only file name without extension ==================
    filename="${file%.*}" 

    # echo "File No : $i"
    # echo "Zip Filename      :$file"
    # echo "without extension :$filename"
    # echo ""

    ## ================== split str by '_' ==================
    IFS='_' read -r part1 part2 part3 part4 part5 <<< "$filename"
    id="$part5" #id

    # echo "Student ID: $id "  # 011221075  (ID)


    ## ================== Unzip ==================
    mkdir -p "$filename"
    unzip "$file" -d "$filename"


    ## ================== Find c / py / java file ==================

    find "$filename" -type f \( -name "*.c" -o -name "*.py" -o -name "*.java" \) | while read -r file;
    do
            # echo "Found: $file"

            ext="${file##*.}"  # extract file extension 

            # ================== create separate folder based on ID and file extension ==================
             
            if [[ "$ext" == "c" ]]; 
            then
                echo "This is a C file. "

                mkdir -p "targets/c/$id"
                cp "$file"   "targets/c/$id/main.c"

            elif [[ "$ext" == "py" ]]; 
            then
                echo "This is a Python file."

                mkdir -p "targets/py/$id"
                cp "$file"   "targets/py/$id/main.py"

            else
                echo "This is a Java file."

                mkdir -p "targets/java/$id"
                cp "$file"   "targets/java/$id/main.java"
            fi
    done

    # echo "Done one zip file"

    i=$(($i+1))
done


