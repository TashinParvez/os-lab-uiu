#--------- conditional statement ---------


# x=2

# if [ $x == 21 ];
# then
# echo "Value equals to 2"
# else
#     echo "Value not equals to 2"
# fi



# x=2
# if((x==2))
# then 
# echo "equal to 2"
# else 
# echo "not equal to 2"
# fi





#====================================

x="a.text"

if [ -f $x ];
then 
echo "$x exist"
else 
echo "$x doesnt exist"
fi 

