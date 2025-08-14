#!/bin/bash

cd movie_data

#loop through all text files in current directory
for file in *.txt
do 
    if [ -f "$file" ]
    then
        director=$(tail -2 "$file" | head -1)

        #create the directory if it does not exist
        if [ ! -d "$director" ]
        then 
            mkdir "$director"
        fi

        #move the file into the director's directory
        mv "$file" "$director/" 
    fi 
done

