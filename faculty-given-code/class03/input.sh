#!/bin/bash

for ((i=0; i<10; i++))
do
    touch "$i.txt"
    if ((i%3==0))
    then
        echo "virus is a computer malware..." >> "$i.txt"
    elif ((i%5==0))
    then
        echo "worm is a computer malware..." >> "$i.txt"
    else
        echo "OS Lab class..." >> "$i.txt"
    fi
done