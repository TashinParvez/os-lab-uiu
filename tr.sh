#!/bin/bash

var1="Apple" 

myfun() {
    local var1="Banana"  
    local var2="AAAA"   
    var3="Cherry"  
    echo "First fruit: $var1" 
}

myfun

echo "First fruit: $var1"
echo "Second fruit: $var2"  # Will not print  
echo "Third fruit: $var3" 