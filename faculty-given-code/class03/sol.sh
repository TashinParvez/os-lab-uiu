#!/bin/bash

for file in *.txt
do
    if grep -qi "virus" $file
    then
        mv $file "$file\_virus.txt"
    elif grep -qi "worm" $file
    then
        mv $file "$file\_worm.txt"
    fi 
done