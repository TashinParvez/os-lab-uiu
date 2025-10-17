 


#!/bin/bash

# Extract the 3rd line from users.txt and check if it contains 'admin'
if head -n 3 users.txt | tail -n 1 | grep -q "admin"; then
    echo "Admin exists"
else
    echo "No admin"
fi


