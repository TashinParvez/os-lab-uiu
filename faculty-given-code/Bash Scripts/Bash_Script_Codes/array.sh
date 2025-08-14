myArray=("cat" "dog" "mouse" "frog")
myArray[10]="far"

# iterate over values
for str in ${myArray[@]}; do
  echo $str
done

# accessing using indices
for i in ${!myArray[@]}; do
  echo "element $i is ${myArray[$i]}"
done