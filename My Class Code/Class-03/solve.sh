# mkdir Qurantine

# touch Qurantine/a.txt Qurantine/b.txt Qurantine/c.txt Qurantine/d.txt



# # for file in *.txt
# # do
# #    echo "virus or worm" 
# # done



#!/bin/bash


# ------------------ file create ------------------
for((i=0; i<10;i++))
do
    touch '$i.txt'
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




# for file in *.txt
# do
#     if grep -q -ie "virus" -ie "Worm" $file
#     then
#     mv $file Qurantine/
#     fi
# done



for file in *.txt
do
    if grep -q -i "virus" $file
    then
    mv $file $file\_virus.txt 
    elif grep -q -i "Worm" $file
    then
    mv $file $file\_Worm.txt 
    fi
done





