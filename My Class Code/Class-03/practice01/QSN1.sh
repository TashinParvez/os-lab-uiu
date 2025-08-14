#!/bin/bash

# =========================== Part 1 ===========================

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

# mkdir Qurantine
# for file in *.txt
# do
#     if grep -q -ie "virus" -ie "Worm" $file
#     then
#     mv $file Qurantine/
#     fi
# done



# =========================== Part 3 ===========================

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

