# Summer 2025 - CSE 4510 - CT 01 - sec:B – on Bash Scripting

---

## 📝 Problem Statement

Time: 30 minutes

After finishing graduation from CSE, UIU, you joined NSI. You are on a mission in our enemy country C. There you luckily got access to a directory with many sub-directories, where there are many files. These files are very confidential as they contain information about their evil bioweapon developed using various viruses. You are particularly interested in some viruses listed in virus.txt Copy those files that contain the name of any of the viruses listed in virus.txt.
Do it fast, or else the owner will know about your deeds, and both your life and our country will be in danger.

#### Output

Files should be copied in the output folder.

#### Instructions

- Please note that any usage of the internet is strictly prohibited during the assignment. Use of any unfair means will be duly punished.
- Please submit the source code in elms. Failure to submit in the elms will result in a mark deduction.

---

## Given Zip File : [Online 1 - click here to Download](./Online%201.zip)

---

## My Solution

```bash
#!/bin/bash

mkdir -p "output"

find . -type f | while read -r file; do

    if grep -qi -e "corona" -e "rabice" -e "pox" "$file";
    then
        echo "Virus found in $file"
        cp "$file" "output/"
    fi

done
```
