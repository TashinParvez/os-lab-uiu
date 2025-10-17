#!/bin/bash

touch result.csv
echo "student_id,language,matched,missmatched" > result.csv


# ===================================== Main =======================================

find "./targets" -type f \( -name "*.c" -o -name "*.py" -o -name "*.java" \) | while read -r file; 
do

    matched_with_result=0
    missmatched_with_result=0


    path="${file%/*}"      # just path
    folder="${path##*/}"   # last folder name => student id


    echo "===================================================="
    echo "Checking submission of student: "$folder"'s  "$file" file"
    echo ""

    #==================================== c file ====================================
    if [[ "$file" == *.c ]]; then 

        echo "this is a c file."
        language="c"

        gcc -o "$path/main" "$file"  # create executable file

        for i in {1..3};
        do
            output_file="$path/out$i.txt"

            "$path/main" < "./tests/test$i.txt" > "$output_file"

            # ======= Compare output with expected answer =======
            if diff -q "$output_file" "./answers/ans$i.txt" > /dev/null; then
                echo "Test $i: Passed (OK)"
                ((matched_with_result++))
            else
                echo "Test $i: Failed (Not OK)"
                ((missmatched_with_result++))
            fi

        done



    #====================================  py file ====================================
    elif [[ "$file" == *.py ]]; then
    
        echo this is a py file.
        language="py"


        for i in {1..3};
        do
            output_file="$path/out$i.txt"

            python3 "$file" < "tests/test$i.txt" > "$output_file"

            # ======= Compare output with expected answer =======
            if diff -q "$output_file" "./answers/ans$i.txt" > /dev/null; then
                echo "Test $i: Passed (OK)"
                ((matched_with_result++))
            else
                echo "Test $i: Failed (Not OK)"
                ((missmatched_with_result++))
            fi

        done


    #==================================== java file ====================================
    elif [[ "$file" == *.java ]]; then
    
        echo this is a java file.
        language="java"

        javac "$file"

        for i in {1..3};
        do
            output_file="$path/out$i.txt"

            java -cp "$path" "Main" < "./tests/test$i.txt" > "$output_file"

            # ======= Compare output with expected answer =======
            if diff -q "$output_file" "./answers/ans$i.txt" > /dev/null; then
                echo "Test $i: Passed (OK)"
                ((matched_with_result++))
            else
                echo "Test $i: Failed (Not OK)"
                ((missmatched_with_result++))
            fi

        done
    fi


    #================ add data in CSV ================
    echo "$folder","$language","$matched_with_result","$missmatched_with_result" >> result.csv

    echo ""
    echo ""
done



# ============================================================================