mkdir -p folder9/folder1

pwd 
cd .. 
cd folder02

rm notes.txt  // remove
rm -r folder1  
rm -rf folder1  // force remove folder 

ls
ls -1    // separate line
ls -l    // deails


user-group-other(NGO) or all
r-w-x
chmod u-r tasin.txt // change access

mv old.c   new_folder/new_name.c  
mv a.txt b.txt

cp source_file destination_file
cp -r folder1/ folder2/


cat file1.txt file2.txt
cat file1.txt file2.txt > combined.txt
cat -n file.txt   // line number 



echo Hello, World!
echo -e "Line1\nLine2"   // -e enables 
echo "Another line" >> message.txt

echo '$name' 
echo "$name"   


head -n 20 filename.txt | tail -n 10


read n  

========================  if else ========================

if(($x == 12)); then 
    echo "tashin"
else
    echo "Parvez"
fi


x="README.md"
if [ -f $x ]; then

========================  grep  ========================

grep "UIU" week01_notes.txt

-i    # Ignores case.
-n    # line number 
-r    # recursive
-c    # Count matches
-v    # Prints all lines that do NOT contain UIU
-w    # searches for the exact word
-e "pattern1" -e "pattern2" filename  # multiple Searche


============  Loop =============


for file in *
do
    echo "$file"
done


for file in *.txt 
for ((i=0; i<5; i++)) 


================ FIND ================


find . -type f -name "*.txt" | while read -r file; do
    echo "Found: $file"
done


================= ARRAY ==============

myArray=("cat" "dog" "mouse" "frog")  
for str in ${myArray[@]};  # @ => all values
for i in ${!myArray[@]};   # ! => access indices



================= function ==============

add_two_num() {
    local sum=$(($1 + $2)) 
    return sum
}


add_two_num 2 3
result=$?


local var1="Banana"


function get_result() { 
    echo "Hello"  # Return string via stdout
} 
result=$(get_result)  # string





-gt 
-le 





