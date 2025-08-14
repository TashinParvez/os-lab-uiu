#!/bin/bash

x=10

if [ $x -lt 50 -a $x -gt 0 ]
then
    echo "$x is less than 50 and greater than 0"
elif [ $x -le 100 ]
then 
    echo "$x is less than or equal to 100"
fi

