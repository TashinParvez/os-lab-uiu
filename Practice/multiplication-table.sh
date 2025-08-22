#!/bin/bash

myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

echo "Enter which multiplication table you want to see: "
read x

echo "Multiplication table of $x"
for i in ${!myArray[@]}; do
    sum=$((${myArray[$i]}*$x))

    echo "$x * ${myArray[$i]} = $sum"
done
