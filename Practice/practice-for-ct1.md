# 📝 CT-Style Practice Questions with Solutions

---

## Q1: 📂 Organize by File Extension

Suppose you have a directory with files of different types: `.txt`, `.pdf`, `.sh`, `.jpg`.
Write a script `organize.sh` that organizes files into folders named after their **extensions**.
For example:

```
a.txt, b.txt → txt/
c.pdf → pdf/
hello.sh → sh/
```

### ✅ Solution

```bash
#!/bin/bash

for file in *;
do
    [ -f "$file" ] || continue  # Skip dirs

    ext="${file##*.}"  # Extract extension
    mkdir -p "$ext"
    mv "$file" "$ext/"
done
```

### 📌 Example

**Before:**

```
a.txt  b.txt  c.pdf  hello.sh  img.jpg
```

**After:**

```
txt/   pdf/   sh/   jpg/
```

---

## Q2: 📊 Count Lines, Words, and Characters

Write a script `analyze.sh` that:

- Takes a filename as input.
- Prints number of lines, words, and characters in the file using `wc`.

### ✅ Solution

```bash
#!/bin/bash

echo "Enter file name: "
read file

if [ -f "$file" ]; then
    wc "$file"
else
    echo "File does not exist!"
fi
```

### 📌 Example

```
$ ./analyze.sh
Enter file name:
story.txt
10  50  300 story.txt
```

---

## Q3: 🔍 Search for a Word in All Files

Write a script `search.sh` that:

- Asks the user for a word.
- Searches that word inside all `.txt` files in the current directory.
- Prints filenames where the word exists.

### ✅ Solution

```bash
#!/bin/bash

echo "Enter word to search: "
read word

for file in *.txt; do
    if grep -q -w "$word" "$file";
    then
        echo "$word found in $file"
    fi
done
```

### 📌 Example

```
$ ./search.sh
Enter word to search:
Nolan
Nolan found in Inception.txt
Nolan found in Interstellar.txt
```

---

## Q4: 📑 Find the Top N Lines

Write a script `toplines.sh` that:

- Asks the user for a number `n` and a filename.
- Prints the **first `n` lines** of the file.

### ✅ Solution

```bash
#!/bin/bash

echo "Enter filename: "
read file
echo "Enter number of lines: "
read n

if [ -f "$file" ]; then
    head -n $n "$file"
else
    echo "File not found!"
fi
```

### 📌 Example

```
$ ./toplines.sh
Enter filename:
story.txt
Enter number of lines:
5
(line1)
(line2)
(line3)
(line4)
(line5)
```

---

## Q5: 🛑 Copy Checker (Mini Version of Your Offline)

You are given two files. Write a script `compare.sh` that checks if they are **exactly the same** (ignoring blank lines and trailing spaces).
If same → print `"File1 and File2 are same"`.
Else → print nothing.

### ✅ Solution

```bash
#!/bin/bash

echo "Enter first file: "
read f1
echo "Enter second file: "
read f2

if diff -wB "$f1" "$f2" > /dev/null; then
    echo "$f1 and $f2 are same"
fi
```

### 📌 Example

```
$ ./compare.sh
Enter first file:
a.txt
Enter second file:
b.txt
a.txt and b.txt are same
```

---
