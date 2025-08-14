#!/bin/bash

#==================== Iterate over all files in the current directory ====================

for file in *
do
    echo "$file"
done


# #==================== Find only .txt files ====================
for file in *.txt
do 
    echo "$file"
done 


# #==================== C-style numeric loop ====================

for ((i=0; i<5; i++))   #  run while i<5
do 
    echo $i
done


