#!/bin/bash

#================= It is a function
myFunction () 
{
    echo Hello World OS lab
}


#================= function call
myFunction
echo "tashin"



# ================= function call with arguments
add_two_num(){
    local sum=$(($1+$2))
    echo "sum of $1 and $2 is $sum"
}

add_two_num 2 3
echo $sum;   # if not use local in inner var in functions then var become global else it become local



#================= function call with return value
fun()
{
    return 5  # int return
}

fun 
echo "Return value from function is: $?"  # '$?' store the return value of a func / comand call

echo $((5+$?))  # ask sir


# ================ variable scope in function

# var1="Apple" #global variable
# myfun(){
#     local var2="Banana" #local variable
#     var3="Cherry" #global variable
#     echo "The name of first fruit is $var1"
#     echo "The name of second fruit is $var2"
# }
# myfun #calling function

# echo "The name of first fruit is $var1"
# #trying to access local variable
# echo "The name of second fruit is $var2"
# echo "The name of third fruit is $var3"


# returning string from function


function get_result() {
  local string="Hello, I am using Ubuntu. returning form get_result()"
  echo $string  # returning the string
}

# get_result   # it will print the return value
result=$(get_result) # store the return value 
echo "$result"  


