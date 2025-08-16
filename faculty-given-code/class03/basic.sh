#!/bin/bash

#variable
x=12

#print value of variable
# echo $x

# Store output of a command in a variable
x=$(date)

# Show the output
# echo "Ouput of date command: $x"

# Read input from user
# read x

# Show the input
# echo "User input: $x"

# Mathematical Expressions
# x=22
# y=$((x+3))
# echo "y = $y"

# String Concatenation
# x=22
# y=$x+3
# echo "Now y = $y"

# ----------Conditional Statements------------
# x=2
# if [ $x == 2 ];
# then
#     echo "Value equal to 2"
# else
#     echo "Value not equal to 2"
# fi

# Another conditional syntax (like the C program)
# x=2
# if ((x==2))
# then
#     echo "x is equal to 2"
# else
#     echo "x is not equal to 2"
# fi

# Conditional Statements for other purposes

# 1. Check if a file exist or not
x="bb.txt"
if [ -f $x ];
then
    echo "$x file exists"
else
    echo "$x file does not exist"
fi