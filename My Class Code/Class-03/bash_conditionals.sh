#!/bin/bash

#==================== conditional statement ====================

#==================== COMPARISON USING [ ] ====================
x=2
if [ $x == 21 ];
then
echo "Value equals to 2"
else
    echo "Value not equals to 2"
fi


#==================== COMPARISON USING (( )) ====================
x=2
if((x==2))
then 
echo "equal to 2"
else 
echo "not equal to 2"
fi


#==================== FILE CHECK ====================

x="a.text"

if [ -f $x ];
then 
echo "$x exist"
else 
echo "$x doesnt exist"
fi 



#==================== EXTRA PRACTICE EXAMPLES ====================

# ⏩ Example 1: Directory check

dir="my_folder"
if [ -d "$dir" ]; then
    echo "Directory $dir exists"
else
    echo "Directory $dir does not exist"
fi


# ⏩ Example 2: String comparison

str1="Hello"
str2="World"
if [ "$str1" == "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi


