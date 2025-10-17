# ! /bin/bash

# ====================  9 NO  =======================

# x="global"
# function myfunc {
# local x="local"
# echo $x
# }
# myfunc
# echo $x 


# ====================  10 NO  =======================
 
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


# txt_files=(*.txt)
 
# count=0
 
# for file in "${txt_files[@]}"; do
#     if grep -q "TODO" "$file"; then
#         ((count++))
#     fi
# done
 
# echo "Number of .txt files containing 'TODO': $count"





# ====================   22  NO  =======================

# Write a Bash script that checks if a file named users.txt 
# contains the line "admin" in the 3rd line and prints "Admin 
# exists" if it does, or "No admin" if it doesn't.  
# [2.5] 

 
 
# if [ "$(sed -n '3p' users.txt)" = "admin" ]; then
#     echo "Admin exists"
# else
#     echo "No admin"
# fi


# ====================   22  NO  =======================



