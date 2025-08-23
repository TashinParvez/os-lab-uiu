#!/bin/bash

for file in *.txt
do 
director=$(tail -n 2 "$file" | head -n 1)
mkdir -p "$director"
mv "$file" "$director"
done


