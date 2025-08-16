# Week 3 : Bash Scripting Notes

<p align="center">
 
  <img src="https://img.shields.io/badge/Part%201%20—%20Variables%20&%20Math-37474f?style=for-the-badge&logo=none" />
 
  <a href="https://github.com/TashinParvez/os-lab-uiu/blob/main/My%20Class%20Code/Class-03/variables_and_math.sh">
    <img src="https://img.shields.io/badge/Just%20code-💻%20View%20Script-1976d2?style=for-the-badge&logo=none" />
  </a>
  
</p>

---

## 🚨 Script start — Shebang

```bash
#!/bin/bash
```

- **Shebang (`#!`)** tells your OS:
  “Hey, run this file using `/bin/bash`.”
- If you don’t put it, and just run `./script.sh`, the system might try to run it in another shell (like `sh`) which might break some commands.

---

## 🚨 Basic Output

```bash
echo "HI"
```

- `echo` prints text or variable values to the terminal.
- Anything inside quotes `" "` is printed literally.
- Example Output:
  ```
  HI
  ```

---

## 🚨 Variable Declaration

```bash
x=12
echo $x
```

- Variables are **declared without spaces** around `=`.
- `$x` retrieves the value of variable `x`.
- Example output:
  ```
  12
  ```

---

## 🚨 Storing Command Output in a Variable

```bash
today=$(date)
echo "Today's date: $today"
```

- `$(command)` stores the **output of a command** into a variable.
- Here, the current date and time are stored in `today`.
- Example output:
  ```
  Today's date: Wed Aug 14 18:30:00 BDT 2025
  ```

---

## 🚨 User Input

```bash
echo "Give the value of n: " # just for user understand
read n   # main input comand
echo "User Input n = $n"
```

- `read [variable_name]` stores user input into a variable.
- Example:
  ```
  Give the value of n:
  5
  User Input n = 5
  ```

---

## 🚨 Mathematical Expressions

### ✅ Correct Way

```bash
x=22

y=$((x+3))   # look here

echo "x = $x"
echo "y = $y"
```

- `$(( ))` evaluates arithmetic expressions.
- Output:
  ```
  x = 22
  y = 25
  ```

### ❌ Wrong Way

```bash
x=22
y=$x+3    # look here
echo "y = $y"
```

- Without `$(( ))`, Bash treats it as a **string**, not a number.
- Output:
  ```
  y = 22+3
  ```

---

## 🚨 Extra Practice Examples

### ⏩ Multiplication

```bash
a=5
b=4
result=$((a * b))   # look here
echo "$a * $b = $result"
```

- Output:
  ```
  5 * 4 = 20
  ```

### ⏩ Division (Integer division)

```bash
result=$((a / b))   # look here
echo "$a / $b = $result"
```

- Output:
  ```
  5 / 4 = 1
  ```

### ⏩ Modulus (Remainder)

```bash
result=$((a % b))  # look here
echo "$a % $b = $result"
```

- Output:
  ```
  5 % 4 = 1
  ```

### ⏩ Increment & Decrement

```bash
num=10
((num++))   # look here
echo "After increment: $num"

((num--))   # look here
echo "After decrement: $num"
```

- Output:
  ```
  After increment: 11
  After decrement: 10
  ```

### ⏩ Reading Two Numbers and Adding

```bash
echo "Enter first number: "
read num1
echo "Enter second number: "
read num2
sum=$((num1 + num2))   # look here
echo "Sum of ($num1 + $num2) = $sum"
```

- Example run:
  ```
  Enter first number:
  5
  Enter second number:
  7
  Sum of (5 + 7) = 12
  ```

---

## 🚨 Key Takeaways 🚨

- **Variables:** No spaces around `=`.
- **Command substitution:** `$(command)` to store output.
- **User input:** `read variable_name`.
- **Arithmetic:** Always use `$((expression))`.
- **Common mistake:** Using `+` outside `(( ))` treats it as a string.
- **Increment/Decrement:** `((var++))` or `((var--))`.
- **Appending vs Overwriting files:** Use `>` to overwrite and `>>` to append (from Week 2 assignments).

---

<p align="center">
  <img src="https://img.shields.io/badge/Part%202%20—%20Bash%20Conditional%20Statements-37474f?style=for-the-badge&logo=none" />
  <a href="https://github.com/TashinParvez/os-lab-uiu/blob/main/My%20Class%20Code/Class-03/bash_conditionals.sh">
    <img src="https://img.shields.io/badge/Just%20code-💻%20View%20Script-1976d2?style=for-the-badge&logo=none" />
  </a>
</p>

---

## 🚨 **Numeric Comparison**

### Example 1 — Using `[ ]` (test command)

```bash
x=2
if [ $x == 21 ]; then
    echo "Value equals to 2"
else
    echo "Value not equals to 2"
fi
```

- `[ ]` is the **test command**.
- `$x` is replaced with the value of variable `x`.
- `==` tests **equality** for numbers or strings. [In this example it's a string comparison]
- `fi` → end of the if block
- Output:
  ```
  Value not equals to 2
  ```

### ✅ Rule of Thumb

- Always quote variables in [ ] string comparisons: [ "$var1" == "$var2" ]

- Avoids errors when variables are empty or contain spaces.

---

### Example 2 — Using `(( ))` (arithmetic expression)

```bash
x=2
if ((x == 2)); then
    echo "equal to 2"
else
    echo "not equal to 2"
fi
```

- `(( ))` is used for **arithmetic evaluation**.
- Can be simpler for **numeric comparisons**.
- Output:
  ```
  equal to 2
  ```

> ✅ **Tip:** Use `(( ))` for numeric arithmetic, `[ ]` for general tests.

---

## 🚨 File Existence Check

```bash
x="a.text"

if [ -f $x ]; then  # look here
    echo "$x exists"
else
    echo "$x doesn't exist"
fi
```

- `-f` checks if a **file exists and is a regular file**.
- Output (depends if `a.text` exists):

  ```
  a.text exists
  ```

  or

  ```
  a.text doesn't exist
  ```

---

### 🚨 Other useful file tests:

| Test          | Description                          |
| ------------- | ------------------------------------ |
| `-f filename` | True if **file exists**              |
| `-d filename` | True if **directory exists**         |
| `-e filename` | True if **file or directory exists** |
| `-r filename` | True if file is **readable**         |
| `-w filename` | True if file is **writable**         |
| `-x filename` | True if file is **executable**       |

---

<p align="center">
  <img src="https://img.shields.io/badge/Part%203%20—%20grep-37474f?style=for-the-badge&logo=none" />
</p>

---

## 🚨 What is `grep`?

- `grep` stands for **Global Regular Expression Print**.
- It **searches for a pattern in a file or output** and prints the matching lines.
- Extremely useful for logs, code, or any text files.

---

## 🚨 Basic Syntax

```bash
grep "pattern" filename.extension
```

- `"pattern"` → The text or regular expression you want to search.
- `filename` → File(s) to search in.

or

```bash
grep [options] "pattern" filename.extension
```

- `[options]` → Optional flags for additional behavior.

---

## 🚨 Examples

### 1️⃣ Search for a word in a file

```bash
grep "UIU" week01_notes.txt
```

- Finds all lines containing `UIU`.
- Output
  ```bash
  Hello UIU students
  UIU provides great resources
  ```

### 2️⃣ Case-insensitive search

```bash
grep -i "uiu" week01_notes.txt
```

- `-i` stands for “ignore case”.
- Ignores upper/lower case.
- Output

  ```bash
  Hello UIU students
  UIU provides great resources
  ```

### 3️⃣ Show line numbers

```bash
grep -n "UIU" week01_notes.txt
```

- Shows the **line number** along with the matching line.
- Output
  ```bash
  2: This lab is for UIU students
  4: UIU provides great learning resources
  ```

### 4️⃣ Search recursively in a folder

```bash
grep -r "error" /var/log
```

- Searches for `error` in all files inside `/var/log` folder and subfolders.

### 5️⃣ Count number of matches

```bash
grep -c "UIU" week01_notes.txt
```

- Only prints the **number of lines** containing `UIU`.
- Output
  ```bash
  2
  ```

### 6️⃣ Invert match (show lines NOT containing the pattern)

```bash
grep -v "UIU" week01_notes.txt
```

- Prints all lines that **do NOT contain `UIU`**.
- Output

  ```bash
  Welcome to OS Lab
  Errors can happen
  hello world
  This is a test file
  ```

---

## 🚨 `grep` Output to a File

---

### Syntax

```bash
grep "pattern" filename.extension > output.extension
```

or

```bash
grep "pattern" filename.extension >> output.extension
```

- `>` → Creates `output.extension` (or overwrites if it exists) and writes the `grep` output to it.
- `>>` → Appends the `grep` output to the file instead of overwriting.

---

#### **Summary Table**

| Symbol | Behavior            | Use Case                                      |
| ------ | ------------------- | --------------------------------------------- |
| `>`    | Overwrites the file | Save fresh results, don’t care about old data |
| `>>`   | Appends to the file | Keep old results and add new matches          |

---

### Example 1 : Save search results to a new file

```bash
grep "UIU" week01_notes.txt > uiuresults.txt
```

**Explanation:**

- Searches for `UIU` in `week01_notes.txt`.
- Writes **all matching lines** into `uiuresults.txt`.

**Sample Output (uiuresults.txt):**

```
Hello UIU students
UIU provides great resources
```

---

### Example 2 : Append search results to an existing file

```bash
grep "Hello" week01_notes.txt >> uiuresults.txt
```

- Adds all lines containing `Hello` to the **end of `uiuresults.txt`** without overwriting previous content.

**Sample Output: [Updated content of `uiuresults.txt`]:**

```
Hello UIU students               #old line
UIU provides great resources     #old line
Hello world
```

---

### Example 3 : Search recursively and save output

```bash
grep -r "error" /var/log/test_logs > errors.txt
```

- Searches all files in `/var/log/test_logs` for `error`.
- Saves **all matching lines with filenames** into `errors.txt`.

---

## 🚨 What `-w` Means in `grep`

---

### Syntax

```bash
grep -w "pattern" filename.extension
```

- `-w` stands for **“word match”**.
- It searches for the **exact word** you specify, **not as part of another word**.

---

### 🚨 Example

Suppose `week01_notes.txt` contains:

```
UIU students are great
UIU123 is a code
Welcome to UIU
```

#### ⏩ Command without `-w`:

```bash
grep "UIU" week01_notes.txt
```

**Output:**

```
UIU students are great
UIU123 is a code
Welcome to UIU
```

- Matches **all lines containing the pattern**, even if it’s part of another word (`UIU123`).

---

#### ⏩ Command with `-w`:

```bash
grep -w "UIU" week01_notes.txt
```

**Output:**

```
UIU students are great
Welcome to UIU
```

- Only matches `UIU` as a **whole word**.
- Does **not match `UIU123`** because it’s part of a larger string.

---

### ⏩ Combining with other flags

- Case-insensitive exact word match:

```bash
grep -iw "uiu" week01_notes.txt
```

- `-i` → ignore case
- `-w` → whole word match
- ignore upper/lower case and find lines that have exact `uiu` word in it

---

# 🚨 Mixing `head`, `tail`, and `grep`

---

Suppose we have a file `week01_notes.txt` with the following content:

```
1: Introduction to OS Lab
2: Hello UIU students
3: Bash scripting basics
4: Variables and arithmetic
5: Conditional statements
6: Loops in Bash
7: Functions in Bash
8: File operations
9: Text processing
10: Grep, head, and tail
```

---

## 1️⃣ Example: Find lines with `Bash` and show only first 2 matches

```bash
grep "Bash" week01_notes.txt | head -n 2
```

**Output:**

```
3: Bash scripting basics
6: Loops in Bash
```

- `grep "Bash"` → finds lines containing `Bash`.
- `head -n 2` → shows only the **first 2 matches**.

---

## 2️⃣ Example: Show last matching line with `grep` + `tail`

```bash
grep "Bash" week01_notes.txt | tail -n 1
```

**Output:**

```
7: Functions in Bash
```

- `tail -n 1` → shows the **last line** from the `grep` output.

---

## 3️⃣ Example: Show lines 3 to 7 that contain `Bash`

```bash
head -n 7 week01_notes.txt | tail -n 5 | grep "Bash"
```

**Step by Step:**

1. `head -n 7` → first 7 lines of the file
2. `tail -n 5` → lines 3 to 7
3. `grep "Bash"` → filter only lines containing `Bash`

**Output:**

```
3: Bash scripting basics
6: Loops in Bash
7: Functions in Bash
```

---

## 4️⃣ Example: Search for a word in last 5 lines

```bash
tail -n 5 week01_notes.txt | grep "Bash"
```

**Output:**

```
6: Loops in Bash
7: Functions in Bash
10: Grep, head, and tail
```

- `tail -n 5` → last 5 lines of the file
- `grep "Bash"` → shows only lines containing `Bash`.

---

## 🚨 What `-q` Means in `grep`

---

- `-q` stands for **“quiet”** or **“silent”** mode.
- It **does not print any output**, it only sets the **exit status**:

  - `0` → Pattern was found
  - `1` → Pattern was not found
  - `>1` → An error occurred

This is useful when you want to **check if a pattern exists** without cluttering the terminal with matching lines.

---

### ⏩ Example

Suppose `week01_notes.txt` contains:

```
Hello UIU
Welcome to OS Lab
Bash scripting basics
Errors can happen
```

#### Command:

```bash
grep -q "UIU" week01_notes.txt
echo $?
```

**Output:**

```
0
```

- `grep -q` found `UIU` → exit status `0`
- No lines are printed.

---

#### Pattern not found:

```bash
grep -q "Python" week01_notes.txt
echo $?
```

**Output:**

```
1
```

- `Python` was not found → exit status `1`

---

### ⏩ Practical Use Case

You can use `-q` in **if statements** in scripts:

```bash
if grep -q "UIU" week01_notes.txt; then
    echo "Pattern exists!"
else
    echo "Pattern not found."
fi
```

**Output:**

```
Pattern exists!
```

- This is great for **conditional checks in Bash scripts**.

---

## 🚨 What `-e` Means in `grep`

---

- `-e` stands for **“expression”**.
- It allows you to **specify a pattern** to search for.
- Useful when you want to **search for multiple patterns** or when the pattern **starts with a dash (`-`)**, which could be mistaken as an option.

---

### Syntax

```bash
grep -e "pattern1" filename
```

- `-e` stands for **“expression”**.
- You can add multiple `-e` flags:

```bash
grep -e "pattern1" -e "pattern2" filename
```

- Searches for **lines matching pattern1 OR pattern2**.

---

### Example

Suppose `week01_notes.txt` contains:

```
Hello UIU
Welcome to OS Lab
Bash scripting
Errors can happen
```

#### Command:

```bash
grep -e "UIU" -e "Errors" week01_notes.txt
```

**Output:**

```
Hello UIU
Errors can happen
```

- Matches lines containing **either `UIU` or `Errors`**.

---

### Example with pattern starting with dash

Suppose you want to search for `-UIU` literally:

```bash
grep -e "-UIU" week01_notes.txt
```

- Without `-e`, `grep` might treat `-UIU` as an option.

---

## 🚨 `grep -ie` Examples

---

### Command:

```bash
grep -ie "uiu" -e "bash" week01_notes.txt
```

### Explanation:

- `-i` → ignore case (matches `UIU`, `uiu`, `UiU`, etc.)
- `-e "uiu"` → search for `uiu`
- `-e "bash"` → search for `bash`
- `week01_notes.txt` → file being searched

**This searches for lines containing either `uiu` or `bash`, ignoring case.**

- Output:
  ```
  Hello UIU
  bash scripting basics
  UIU provides resources
  ```

---

<p align="center">
  <img src="https://img.shields.io/badge/Part%204%20—%20Loop-37474f?style=for-the-badge&logo=none" />
  <a href="https://github.com/TashinParvez/os-lab-uiu/blob/main/My%20Class%20Code/Class-03/loop.sh">
    <img src="https://img.shields.io/badge/Just%20code-💻%20View%20Script-1976d2?style=for-the-badge&logo=none" />
  </a>
</p>


---

## 🚨 **Iterate Over All Files in Current Directory**

```bash
for file in *
do
    echo "$file"
done
```

- `*` → Matches **all files and directories** in the current folder.
- `$file` → Variable holding the current file name.
- `echo "$file"` → Prints each file name.

**Example Output (folder contains files `a.txt`, `b.sh`, `notes.md`):**

```
a.txt
b.sh
notes.md
```

---

## 🚨 **Iterate Over Specific File Types**

```bash
for file in *.txt
do
    echo "$file"
done
```

- `*.txt` → Matches **only files ending with `.txt`**.
- Prints **only text files** in the current folder.

**Example Output (folder contains `a.txt`, `b.txt`, `script.sh`):**

```
a.txt
b.txt
```

---

## 3️⃣ **C-style Numeric Loop**

```bash
for ((i=0; i<5; i++))
do
    echo $i
done
```

- `((i=0; i<5; i++))` → **C-style loop** with initialization, condition, and increment.
- `$i` → Current loop counter.
- Prints numbers from **0 to 4**.

**Output:**

```
0
1
2
3
4
```

---
