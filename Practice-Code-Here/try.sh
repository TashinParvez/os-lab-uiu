#!/bin/bash

for file in *.txt
do
    country=$(head -n 2 "$file" | tail -n 1)
    role=$(head -n 4 "$file" | tail -n 1)
    name=$(head -n 1 "$file")

    mkdir -p "$country/$role"

    mv "$file" "$country/$role/$name.txt" 
done



# ===========




