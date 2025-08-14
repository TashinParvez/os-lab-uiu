#!/bin/bash
# A simple Bash script demonstrating variables, input, and arithmetic

#==================== BASIC OUTPUT ====================

echo "HI"  # Print a simple message

#==================== VARIABLE DECLARATION ====================

x=12  # Assign value 12 to variable x
echo $x  # Print variable value

#==================== STORE COMMAND OUTPUT ====================

today=$(date)  # Store the output of the 'date' command into 'today'

echo $today
echo "Today's date: $today"

#==================== USER INPUT ====================

echo "Give the value of n : "
read n  # Read user input into variable x

echo "User Input n = $n"  # Show the input
echo ""

#==================== MATHEMATICAL EXPRESSION ====================

x=22
y=$((x+3))  # Double parentheses treat the value as a number, not a string
# '$' is used to get the value of the variable

echo "x = $x"
echo "y = $y"
echo ""

#==================== WRONG WAY EXAMPLE ====================

x=22
y=$x+3  # ❌ Without double parentheses, this is treated as a string
echo "x = $x"
echo "y = $y"  # Will print "22+3" instead of 25
echo ""

#====================== ==================== ======================
#==================== EXTRA PRACTICE EXAMPLES =====================
#====================== ==================== ======================

# Example 1: Multiplication
a=5
b=4
result=$((a * b))
echo "$a * $b = $result"
echo ""

# Example 2: Division
result=$((a / b))
echo "$a / $b = $result"  # Integer division (no decimals in Bash by default)
echo ""

# Example 3: Modulus (Remainder)
result=$((a % b))
echo "$a % $b = $result"
echo ""

# Example 4: Increment & Decrement
num=10
((num++))  # Increment by 1
echo "After increment: $num"
echo ""

((num--))  # Decrement by 1
echo "After decrement: $num"
echo ""

# Example 5: Reading two numbers and adding them
echo "Enter first number: "
read num1
echo "Enter second number: "
read num2
sum=$((num1 + num2))
echo "Sum of ($num1 + $num2) = $sum"


