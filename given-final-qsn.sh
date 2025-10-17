# ! /bin/bash

# ====================  9 NO  =======================
# 9. What is the output of the following code snippet? 

# x="global"
# function myfunc {
# local x="local"
# echo $x
# }
# myfunc
# echo $x 


# ====================  10 NO  =======================
#  Analyze the following Bash script and determine its output: 


# stringl="foo"
# string2="foo "

# if [ "$stringl" = "$string2" ] ; then
# echo "Yes"
# elif [ "$stringl" = "${string2// }" ] ;
# then
# echo "Maybe"
# else
# echo "No"
# fi


# ====================  21 NO  =======================
# Write a script that lists all .txt files in the current 
# directory and counts how many of them contain the word 
# "TODO".[2.5] 



#!/bin/bash  
# cnt=0
# for file in *.txt; do
#     if grep -c "TODO" "$file"; then
#         ((cnt++))
#     fi
# done

# echo "Number of .txt files containing 'TODO': $cnt"
 


# ====================   22  NO  =======================

# Write a Bash script that checks if a file named users.txt 
# contains the line "admin" in the 3rd line and prints "Admin 
# exists" if it does, or "No admin" if it doesn't.  
# [2.5] 

 
 
#!/bin/bash

# if head -n 3 users.txt | tail -n 1 | grep -q "admin"; then
#     echo "Admin exists"
# else
#     echo "No admin"
# fi






