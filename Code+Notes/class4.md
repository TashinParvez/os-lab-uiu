# Week 4 : Array & Function

---

<p align="center">
  <img src="https://img.shields.io/badge/Part%201%20—%20Array-37474f?style=for-the-badge&logo=none" />
  <a href="">
  </a>
</p>

---

## 📌 Arrays in Bash

```bash
myArray=("cat" "dog" "mouse" "frog") # Elements separated by space
myArray[10]="far"  # Adding element at index 10

# Current indices -> 0 1 2 3 10
```

Here’s what happens:

1. `myArray` initially has elements at indices `0,1,2,3`.
2. Assign a value to index `10`, skipping indices `4` through `9`.
3. Bash allows this, so the array becomes **sparse**:

✅ Key points about Bash sparse arrays:

- Indices **don’t need to be continuous**.
- Missing indices simply **don’t exist**; they are not automatically filled.

---

### 📌 Iterate Over Values Only / Array Print

```bash
for str in ${myArray[@]};  # @ => all values
do
  echo $str
done
```

- `${myArray[@]}` expands to **all the values** in the array.
- The `for` loop iterates **over each word/value** in the list provided.
- In the first iteration, `str="cat"`.
- In the second iteration, `str="dog"`, and so on.
- Simply prints the current value of `str`.
- So the output will be:
  ```
  cat
  dog
  mouse
  frog
  far
  ```

---

### 📌 Access Array Indices

```bash
for i in ${!myArray[@]};   # ! => access indices
do
  echo "Index $i has value ${myArray[$i]}"
done
```

- If you want to **see indices as well**, using `${myArray[@]}` won’t show the indices. Instead, you can use `${!myArray[@]}`

* The `!` before the array name tells Bash: **“Give me the indices of the array, not the values.”**

✅ Imp: `${myArray[$i]}`

- This accesses the **value stored at index `i`**.
- For example:
  - `${myArray[0]}` → `cat`
  - `${myArray[10]}` → `far`

* Output:

  ```
  Index 0 has value cat
  Index 1 has value dog
  Index 2 has value mouse
  Index 3 has value frog
  Index 10 has value far
  ```

✅ Key Takeaways:

1. `${!myArray[@]}` = **all indices**
2. `${myArray[$i]}` = **value at index \$i**

---

<p align="center">
 
  <img src="https://img.shields.io/badge/Part%202%20—%20Function in Bash-37474f?style=for-the-badge&logo=none" />
  <a href="">
  </a>

</p>

---

### 📌 Define the function

```bash
myFunction() {
    echo "Hello World OS lab"
}
```

- `myFunction()` declares a **function** named `myFunction`.
- The `{ ... }` block contains the commands that run when the function is called.

---

### 📌 Call the function

```bash
myFunction
```

- This executes the function you just defined.
- Output:

  ```
  Hello World OS lab
  ```

---

### 📌 Function with Arguments

---

```bash
add_two_num() {
    local sum=$(($1 + $2)) # exists only inside the function.
    echo "Sum of $1 and $2 is $sum"
}
```

1. `add_two_num()` declares a function named `add_two_num`.

2. `local sum=$(($1 + $2))`:

   - `$1` = first argument (`2`)
   - `$2` = second argument (`3`)
   - `$(($1 + $2))` = Bash arithmetic expansion → calculates `2 + 3 = 5`
   - `local` makes the variable `sum` **local to the function**, so it doesn’t affect variables outside the function.

3. `echo "Sum of $1 and $2 is $sum"` prints:

   ```
   Sum of 2 and 3 is 5
   ```

---

### 📌 Call the Function have Arguments

---

```bash
add_two_num 2 3
```

- `$1 = 2`, `$2 = 3`
- Output:

  ```
  Sum of 2 and 3 is 5
  ```

---

### 📌 Function Returning Integer (return a value from a function)

---

### ⏩Function definition

```bash
fun() {
    return 5
}
```

- `return 5` **does NOT return a value like in C/Python**.
- In Bash, `return` in a function sets the **exit status** of the function.
- Valid exit statuses are integers **0–255**.

  - `0` = success
  - Non-zero = usually indicates an error, but you can use it to return small numbers.

#### ⏩ Call the function

```bash
fun
```

- The function runs and sets the **return code** to `5`.

---

### ⏩ Access the return value

```bash
echo "Return value from function is: $?"
```

- `$?` always stores the **exit status of the last executed command** (or function).
- Output:

  ```
  Return value from function is: 5
  ```

or

```bash
result=$?
echo "Return value from function is: $result"
```

---

### ⏩ Use the return value

```bash
echo $((5 + $?))
```

- `$?` is still `5` (from the last function call).
- `5 + 5 = 10` → Output:

  ```
  10
  ```

---

### ✅ Key Points:

1. **Functions can be called before or after they are defined** in Bash, as long as they are defined in the same script.
2. `return` in Bash functions **only gives an integer exit status**, not general data.
3. `$?` is how you access the last command or function's return value.

---

## 📌 Variable Scope in Functions

```bash
var1="Apple"  # Global variable

myfun() {
    local var2="Banana"  # Local variable [exists only inside the function]
    var3="Cherry"        # Global variable
    echo "First fruit: $var1"
    echo "Second fruit: $var2"
}

myfun

echo "First fruit: $var1"
echo "Second fruit: $var2"  # Will not print (local)
echo "Third fruit: $var3"   # Will print (global)
```

---

## 📌 Returning Strings from Functions

```bash
function get_result() {
    local string="Hello, I am using Ubuntu. Returning from get_result()"
    echo $string  # Return string via stdout
}

# Store return value
result=$(get_result)
echo "$result"
```

---

# 📌📌 Class 04 - Summary Table 📌📌

---

| Concept                             | Syntax / Example                               | Description                                    | Notes                                        |
| ----------------------------------- | ---------------------------------------------- | ---------------------------------------------- | -------------------------------------------- |
| **Indexed Array**                   | `myArray=("cat" "dog")`                        | Stores multiple values in numeric indices      | Supports sparse arrays                       |
| **Sparse Array**                    | `myArray[10]="far"`                            | Non-continuous indices are allowed             | Missing indices are ignored                  |
| **Iterate over values**             | `for val in ${myArray[@]}; do echo $val; done` | Loops over all array values                    | `[@]` = all values                           |
| **Iterate over indices**            | `for i in ${!myArray[@]}; do echo $i; done`    | Loops over array indices                       | `!` gives indices, useful for sparse arrays  |
| **Function Definition**             | `myFunction() { echo "Hello"; }`               | Defines a reusable block of code               | Can be called anywhere in the script         |
| **Function Arguments**              | `myFunc() { echo $1 $2; }`                     | `$1`, `$2` refer to first and second arguments | Arguments are positional                     |
| **Local Variable**                  | `local var="value"`                            | Exists only inside the function                | Prevents overwriting global variables        |
| **Global Variable inside function** | `var="value"`                                  | Accessible inside & outside function           | Use carefully to avoid conflicts             |
| **Return integer**                  | `return 5`                                     | Sets exit status of function                   | Access with `$?` (0–255 only)                |
| **Capture return code**             | `result=$?`                                    | Stores last function/command exit code         | Must capture immediately after function call |
| **Return string**                   | `echo "Hello"`                                 | Prints value, captured with `result=$(func)`   | Use `local` for temp variables               |
| **Using captured string**           | `result=$(get_result); echo "$result"`         | Stores function output in variable             | Essential for string “return” in Bash        |

---
