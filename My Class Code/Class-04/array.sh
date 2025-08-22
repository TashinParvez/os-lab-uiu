
#!/bin/bash

myArray=("cat" "dog" "mouse" "frog") # separeted by => space 
myArray[10]="far"

# now array index -> 0 1 2 3 10
echo ${!myArray[2]}


# ================== iterate over values  (only value) ==================
for str in ${myArray[@]};  # @ => array index
do
  echo $str
done



#==================  accessing using indices (with index) ==================

for i in ${!myArray[@]};   # ! for the index access
do
  # echo "element $i is ${myArray[$i]}"
  echo $i
done



