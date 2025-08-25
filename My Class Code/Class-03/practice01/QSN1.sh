#!/bin/bash

# =========================== Part 1 ===========================
#Question: Write a Bash script that creates 10 text files. Depending on the file number:
#If divisible by 3, write “Virus is a computer malware…”
#If divisible by 5, write “Worm is a computer malware…”
#Otherwise, write “This is OS Lab Class…”

for ((i=1; i<=10; i++))
do
    
    # Create the file
    touch "$i.txt"
    
    # Check if file was created successfully
    if((i%3==0))
    then
        echo "Virus is a computer mallware..." >> "$i.txt"
    elif(($i%5==0))
    then
        echo "Worm is a computer mallware..." >> "$i.txt"
    else
        echo "This is OS Lab Class..." >> "$i.txt"
    fi

done



# =========================== Part 2 ===========================
#Question: Extend the previous script to move any file containing the words “Virus” or “Worm” into a folder named Qurantine.

# mkdir Qurantine
# for file in *.txt
# do
#     if grep -q -ie "virus" -ie "Worm" $file
#     then
#     mv $file Qurantine/
#     fi
# done



# =========================== Part 3 ===========================
#Question: Modify the script to rename files according to their content: append _virus.txt for files containing “Virus” and _Worm.txt for files containing “Worm”.

# for file in *.txt
# do
#     if grep -q -i "virus" $file
#         then
#         mv $file $file\_virus.txt

#     elif grep -q -i "Worm" $file
#         then
#         mv $file $file\_Worm.txt

#     fi
# done

