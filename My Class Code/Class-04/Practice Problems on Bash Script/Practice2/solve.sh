# =========================  type 1 =========================


#!/bin/bash

for file in *.txt
do
    name=$(head -n 1 "$file")
    country=$(head -n 2 "$file" | tail -n 1)
    role=$(head -n 4 "$file" | tail -n 1)

    mkdir -p "$country/$role"

    mv "$file" "$country/$role/$name.txt" 
done



# =========================  type 2 =========================

#!/bin/bash


find . -type f -name "*.txt" | while read -r file;

    name=$(head -n 1 "$file")
    country=$(head -n 2 "$file" | tail -n 1)
    role=$(head -n 4 "$file" | tail -n 1)

    mkdir -p "$country/$role"

    mv "$file" "$country/$role/$name.txt"

done 



# ========================= Part 2: Remove empty directories (bottom-up)  =========================
find . -type d -empty -delete

