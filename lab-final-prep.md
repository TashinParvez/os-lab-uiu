**4.** Which command shows details like permissions, owner, and size?
A) ls
B) ls -a
C) ls -l
D) ls -p

✅ **Answer:** **C**
📘 _Explanation:_ `ls -l` lists files in long format (permissions, owner, size, etc.).

---

**5.** Which command creates multiple nested folders in one step?
A) mkdir folder1 folder2
B) mkdir -p folder1/folder2
C) mkdir folder1/folder2
D) mkdir -rf folder1/folder2

✅ **Answer:** **B**

---

**6.** Which of the following checks if a file named `notes.txt` exists?
A) if [ notes.txt ]; then
B) if [ -f notes.txt ]; then
C) if (notes.txt); then
D) if file notes.txt; then

✅ **Answer:** **B**

---

**7.** Which command removes a directory and all its contents without asking?
A) rm folder1
B) rm -r folder1
C) rm -rf folder1
D) rmdir folder1

✅ **Answer:** **C**

---

**8.** Which loop correctly prints all `.txt` files?
A) `for file in *.txt; do echo $file; done`
B) `for file in *.txt; echo $file; done`
C) `for *.txt in file; do echo file; done`
D) `for (file in *.txt); do echo $file; done`

✅ **Answer:** **A**

---

**9.** What will `grep -n "UIU" week01_notes.txt` show?
A) All lines without “UIU”
B) Line numbers where “UIU” appears
C) Only the count of “UIU”
D) Nothing

✅ **Answer:** **B**

---

**10.** What does `head -n 20 file.txt | tail -n 10` do?
A) Shows first 10 lines
B) Shows lines 1–20
C) Shows lines 11–20
D) Shows last 10 of the first 20 lines

✅ **Answer:** **D**

---

### 💻 **Part 2: Predict the Output**

---

**11.** Predict the Output

```bash
x=10
if [ $x -gt 5 ]; then
  echo "Big"
else
  echo "Small"
fi
```

✅ **Output:** `Big`

---

**12.** Predict the Output

```bash
for i in 1 2 3
do
  echo "Number $i"
done
```

✅ **Output:**

```
Number 1
Number 2
Number 3
```

---

**13.** Predict the Output

```bash
arr=("cat" "dog" "mouse")
echo ${arr[1]}
```

✅ **Output:** `dog`

---

**14.** Predict the Output

```bash
echo "Hello $USER"
```

✅ **Output:**
`Hello tashin` _(or your system username)_

---

**15.** Predict the Output

```bash
greeting() {
  echo "Hi $1"
}
result=$(greeting "UIU")
echo $result
```

✅ **Output:**
`Hi UIU`

---

### ⚙️ **Part 3: Find and Fix the Error**

---

**16.** Find and Fix the Error

```bash
if [ $x > 10 ]; then
  echo "Greater"
fi
```

❌ **Error:** String comparison used instead of numeric.
✅ **Fix:**

```bash
if [ $x -gt 10 ]; then
  echo "Greater"
fi
```

---

**17.** Find and Fix the Error

```bash
y=(1 2 3)
for i in $y; do
  echo $i
done
```

❌ **Error:** `$y` expands to one string, not multiple values.
✅ **Fix:**

```bash
for i in ${y[@]}; do
  echo $i
done
```

---

**1.** Which command lists all files, including hidden ones?
A) `ls -a`
B) `ls -h`
C) `ls -1`
D) `ls -z`

✅ **Answer:** A
🧠 _`ls -a` lists all files, including hidden ones (starting with `.`)._

---

**2.** What does `rm -r folder1` do?
A) Removes only files inside folder1
B) Removes folder1 and its contents recursively
C) Renames folder1
D) Removes only empty folders

✅ **Answer:** B
🧠 _`-r` = recursive deletion._

---

**3.** What will `cat -n file.txt` do?
A) Show first 10 lines
B) Show line numbers with file content
C) Show only last 10 lines
D) Combine multiple files

✅ **Answer:** B

---

**4.** The command `cp -r folderA folderB` will:
A) Copy only files from folderA
B) Copy folderA recursively into folderB
C) Copy files but not subfolders
D) Move folderA into folderB

✅ **Answer:** B

---

**5.** The command `mv report.txt archive/` will:
A) Delete report.txt
B) Copy report.txt to archive
C) Move report.txt into archive
D) Rename archive to report.txt

✅ **Answer:** C

---

### 🔐 **Section B: Permissions**

---

**7.** How to remove write permission for group users on `data.txt`?
A) `chmod g+w data.txt`
B) `chmod g-w data.txt`
C) `chmod g=r data.txt`
D) `chmod g+x data.txt`

✅ **Answer:** B

---

### 💡 **Section C: Variables**

---

**9.** What does the following print? [***IMP***]

```bash
name="UIU"
echo '$name'
```

A) UIU
B) $name
C) "UIU"
D) Error

✅ **Answer:** B
🧠 _Single quotes prevent variable expansion._

---

**10.** What will this print?

```bash
name="UIU"
echo "$name"
```

✅ **Answer:** `UIU`

---

### 🧭 **Section D: Conditionals**

---

**11.**

```bash
x=5
if [ $x -le 10 ]; then
  echo "Small"
else
  echo "Big"
fi
```

✅ **Output:** `Small`

---

**12.**

```bash
str="UIU"
if [ "$str" == "UIU" ]; then
  echo "Match"
else
  echo "No match"
fi
```

✅ **Output:** `Match`

---

**13.**

```bash
file="hello.txt"
if [ -f $file ]; then
  echo "Exists"
else
  echo "Missing"
fi
```

✅ **Output:** Depends — shows `Exists` if file exists, otherwise `Missing`.

---

### 🔁 **Section E: Loops**

---

**14.**

```bash
for i in 1 2 3 4; do
  echo $i
done
```

✅ **Output:**

```
1
2
3
4
```

---

**15.**

```bash
for ((i=1; i<=3; i++))
do
  echo "Loop $i"
done
```

✅ **Output:**

```
Loop 1
Loop 2
Loop 3
```

---

**16.** Which loop prints every `.sh` file?
A) `for file in *.sh; do echo $file; done`
B) `for *.sh in file; echo $file; done`
C) `foreach *.sh; do echo $file; done`
D) `for file *.sh; echo $file`

✅ **Answer:** A

---

### 📂 **Section F: Arrays**

---

**17.**

```bash
arr=("UIU" "CSE" "Tashin")
echo ${arr[0]}
```

✅ **Output:** `UIU`

---

**18.**

```bash
myArray=("apple" "banana" "cherry")
echo ${#myArray[@]}
```

✅ **Output:** `3`
🧠 _`${#array[@]}` gives total number of elements._

---

**19.**

```bash
arr=("A" "B" "C")
for item in ${arr[@]}; do
  echo $item
done
```

✅ **Output:**

```
A
B
C
```

---

### 🔍 **Section G: grep / find**

---

**20.** Which command counts lines containing “UIU”?
A) `grep "UIU" file.txt`
B) `grep -n "UIU" file.txt`
C) `grep -c "UIU" file.txt`
D) `grep -v "UIU" file.txt`

✅ **Answer:** C

---

**21.** Which command finds all `.txt` files in current directory and subdirectories?
A) `grep -r "*.txt" .`
B) `find . -name "*.txt"`
C) `ls -r "*.txt"`
D) `cat *.txt`

✅ **Answer:** B

---

**22.**

```bash
grep -v "Error" log.txt
```

✅ **Output:** _Prints all lines that do **not** contain the word “Error”._

---

**23.**

```bash
find . -type f -name "*.c"
```

✅ **Output:** _List of all `.c` files recursively._

---

### ⚙️ **Section H: Functions**

---

**24.**

```bash
add() {
  echo $(($1 + $2))
}
result=$(add 5 3)
echo $result
```

✅ **Output:** `8`

---

**25.**

```bash
function say_hello() {
  echo "Hello $1"
}
say_hello "UIU"
```

✅ **Output:** `Hello UIU`

---

---

## 💬 **Mini Challenge (Lab-style)**

Predict the output:

**Q1.**

```bash
#!/bin/bash
x=3
y=7
if [ $x -lt $y ]; then
  echo "Smaller"
else
  echo "Greater"
fi
```

✅ **Output:** `Smaller`

---

**Q2.**

```bash
#!/bin/bash
name="Tashin"
if [ -n "$name" ]; then
  echo "Not Empty"
else
  echo "Empty"
fi
```

✅ **Output:** `Not Empty`

---

**3.**

```bash
echo "Hello" > greet.txt
echo "World" >> greet.txt
cat greet.txt
```

✅ **Output:**

```
Hello
World
```

🧠 _`>` overwrites; `>>` appends._

---

**4.** What will `rm -rf folder1` do?
✅ **Answer:** _Forcefully removes `folder1` and all its contents recursively (no confirmation)._

---

**5.**

```bash
ls -l
```

✅ **Answer:** _Displays files with detailed info (permissions, owner, size, date)._

---

### 🔐 **Section B: Permissions**

---

**7.**

```bash
chmod a+x script.sh
```

✅ **Answer:** _Adds execute permission for all users._

---

**8.** To remove execute permission for others:
✅ **Answer:** `chmod o-x filename`

---

### 🧮 **Section C: Variables and Echo**

---

**12.**

```bash
name="UIU"
echo "Welcome, ${name}!"
```

✅ **Output:** `Welcome, UIU!`

---

### ⚙️ **Section D: Conditional Statements**

---

**13.**

```bash
num=5
if [ $num -gt 3 ]; then
  echo "Big"
else
  echo "Small"
fi
```

✅ **Output:** `Big`

---

**14.**

```bash
file="myfile.txt"
if [ -f $file ]; then
  echo "File exists"
else
  echo "Not found"
fi
```

✅ **Output:** depends on file presence.

---

**15.**

```bash
str=""
if [ -z "$str" ]; then
  echo "Empty"
else
  echo "Not Empty"
fi
```

✅ **Output:** `Empty`

---

**16.**

```bash
a=10
b=20
if [ $a -eq $b ]; then
  echo "Equal"
else
  echo "Not equal"
fi
```

✅ **Output:** `Not equal`

---

**19.**

```bash
files=$(ls)
for f in $files
do
  echo $f
done
```

✅ **Output:** _Prints all files in the current directory._

---

**20.**

```bash
for i in *.txt
do
  echo "Found: $i"
done
```

✅ **Output:** _Lists all .txt files._

---

### 📦 **Section F: Arrays**

---

**21.**

```bash
arr=("A" "B" "C")
echo ${arr[1]}
```

✅ **Output:** `B`

---

**22.**

```bash
arr=("Tashin" "Mahbub" "Noman")
for name in ${arr[@]}
do
  echo $name
done
```

✅ **Output:**

```
Tashin
Mahbub
Noman
```

---

**23.**

```bash
arr=("one" "two" "three")
echo ${#arr[@]}
```

✅ **Output:** `3`

---

### 🔍 **Section G: grep and find**

---

**24.**

```bash
grep -n "main" file.c
```

✅ **Answer:** _Shows all lines containing "main" with line numbers._

---

**26.**

```bash
find . -type f -name "*.sh"
```

✅ **Answer:** _Finds all shell script files recursively._

---

**27.**

```bash
grep -c "function" script.sh
```

✅ **Answer:** _Counts how many lines contain “function”._

---

## 🎯 **Mini Debugging Section**

---

**Q1. Find the bug**

```bash
#!/bin/bash
x=5
if [ $x > 3 ]; then
  echo "Big"
fi
```

❌ **Bug:** `>` is for string comparison.
✅ **Fix:** `if [ $x -gt 3 ]; then`

---

**Q2. Find the bug**

```bash
y=(10 20 30)
echo $y[1]
```

❌ **Bug:** Wrong array syntax.
✅ **Fix:** `echo ${y[1]}`

---

**Q3.**

```bash
echo "Today is $(date)"
```

✅ **Output:** _Prints today’s date using command substitution._

---

---

## Type 2

---

---

### **Q1.**

Write a script that takes a directory path as input and prints the number of `.sh` files inside it.
If there are none, print `"No shell scripts found"`.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

read -p "Enter directory: " dir

count=$(find "$dir" -type f -name "*.sh" | wc -l)

if [ $count -gt 0 ]; then
    echo "Total .sh files: $count"
else
    echo "No shell scripts found"
fi
```

---

### **Q2.**

Write a script that reads a number from the user and checks if it’s **even or odd**.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

read -p "Enter a number: " num

if (( num % 2 == 0 )); then
    echo "Even"
else
    echo "Odd"
fi
```

---

### **Q3.**

Write a script that prints the **first 5 lines** of `data.txt` only if the file exists. Otherwise, print `"File not found"`.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

file="data.txt"

if [ -f "$file" ]; then
    head -n 5 "$file"
else
    echo "File not found"
fi
```

---

### **Q4.**

Write a script that **searches for the word “error”** in all `.log` files in the current directory (case insensitive) and prints the filenames that contain it.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

for file in *.log; do
    if grep -iq "error" "$file"; then
        echo "$file"
    fi
done
```

---

### **Q5.**

Write a Bash script that checks if `students.txt` has **at least 10 lines**.
If yes, print `"Enough data"`, otherwise `"Insufficient data"`.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

lines=$(wc -l < students.txt)

if [ $lines -ge 10 ]; then
    echo "Enough data"
else
    echo "Insufficient data"
fi
```

---

### **Q6.**

Write a script that loops through all `.txt` files and adds the line `"End of File"` at the end of each one.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

for file in *.txt; do
    echo "End of File" >> "$file"
done
```

---

### **Q7.**

Write a Bash script that defines a function called `add` which takes two arguments and prints their sum.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

add() {
    echo $(($1 + $2))
}

read -p "Enter first number: " a
read -p "Enter second number: " b

add $a $b
```

---

### **Q8.**

Write a script that asks for a filename and checks whether it has **read and write permissions**.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

read -p "Enter filename: " file

if [ -r "$file" ] && [ -w "$file" ]; then
    echo "File has read and write permissions"
else
    echo "File is missing some permissions"
fi
```

---

### **Q9.**

Write a script that counts how many `.c` files exist in the current directory and subdirectories.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

count=$(find . -type f -name "*.c" | wc -l)
echo "C files found: $count"
```

---

### **Q10.**

Write a script that defines an array of 4 animals and prints each one in a new line using a loop.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

animals=("Cat" "Dog" "Cow" "Tiger")

for a in "${animals[@]}"; do
    echo "$a"
done
```

---

## 🧩 Bonus: Mixed-Logic Questions

---

### **Q11.**

Write a script that reads a word and checks if it exists in a file named `dictionary.txt`.
Print `"Word found"` or `"Not found"`.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

read -p "Enter a word: " word

if grep -qw "$word" dictionary.txt; then
    echo "Word found"
else
    echo "Not found"
fi
```

---

### **Q12.**

Write a script that reads 3 numbers and prints the largest one.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

read -p "Enter 3 numbers: " a b c

if (( a >= b && a >= c )); then
    echo "$a is largest"
elif (( b >= a && b >= c )); then
    echo "$b is largest"
else
    echo "$c is largest"
fi
```

---

### **Q13.**

Write a script that checks if today is **Friday**, and if yes, prints `"Weekend is near!"`.
**[2.5 Marks]**

**✅ Solution:**

```bash
#!/bin/bash

day=$(date +%A)

if [ "$day" == "Friday" ]; then
    echo "Weekend is near!"
else
    echo "Today is $day"
fi
```
