 


#!/bin/bash

read dir
count=0

find "$dir" -type f -name "*.sh" |  wc -l

echo $count