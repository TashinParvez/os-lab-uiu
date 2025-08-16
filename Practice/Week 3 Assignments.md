# 📝 Week 3 : Assignments

---

## **Assignment 1 – Count `.txt` Files in Current Folder**

**Task:** Write a Bash script to **count all `.txt` files** in the current directory and print the number.

### **Solution:**

```bash
#!/bin/bash
for file in *.txt
do
((x++))
done
echo "num of text file $x"
```

---

## **Assignment 2 (Important) – Rename `.txt` Files to `.bak`**

**Task:** Rename all `.txt` files to `.bak`.

### **Solution:**

- You need to remove `.txt` from the variable before renaming.

```bash
for file in *.txt
do
    basename="${file%.txt}"  # remove .txt from the end
    mv "$file" "$basename.bak"  # a.txt ➡ basename(a) ➡ a.bak
done
```

### Explanation:

- `"notes.txt"` → basename = `"notes"`
- `"mv notes.txt notes.bak"` → works perfectly.

or

```bash
#!/bin/bash

for file in *.txt
do
    mv "$file" "${file%.txt}.bak"
done
```

**Explanation:**

- `${file%.txt}` → Removes `.txt` extension.
- `${file%.txt}.bak` → Adds `.bak` extension.
- `mv` → Renames the file.

### **❌ Wrong way**

```bash
#!/bin/bash

for file in *.txt
do
    mv $file.txt $file.bak   ❌
    or
    mv $file.txt "$file.bak" ❌
done
```

- Because it becomes something like:
  ```bash
  mv notes.txt.txt "notes.txt.bak"
  ```
  which obviously doesn’t match your actual files.

---

## **Assignment 3 – Sum of First N Numbers**

**Task:** Ask the user for a number `N` and print the sum from 1 to N.

### **Solution:**

```bash
#!/bin/bash

echo "Enter a number:"
read N

sum=0
for ((i=1; i<=N; i++))
do
    # sum=$((sum+i))  # or
    ((sum+=i))
done

echo "Sum of numbers from 1 to $N = $sum"
```

---

## **Assignment 4 – Search a Word in All `.txt` Files**

**Task:** Ask the user for a word and search for it in all `.txt` files. Save output to `result.txt`.

### **Solution:**

```bash
#!/bin/bash

echo "Enter a word to search:"
read w

for file in *.txt
do
    grep -r "$w" "$file" >> result.txt
done
```

**Explanation:**

- `-i` → ignore case
- `-r` → recursive (useful if subfolders exist)
- `> result.txt` → saves output to a file

---
