## **1️⃣ Script start — Shebang**

```bash
#!/bin/bash
```

* **Shebang (`#!`)** tells your OS:
  “Hey, run this file using `/bin/bash`.”
* If you don’t put it, and just run `./script.sh`, the system might try to run it in another shell (like `sh`) which might break some commands.

---

## **2️⃣ Printing text**

```bash
echo "HI"
```

* `echo` prints to the terminal.
* Always put text in **quotes** (double quotes `" "` or single `' '`) to avoid errors if there are spaces.

---

## **3️⃣ Variables**

```bash
x=12
echo $x
```

* **No spaces** before/after `=` when assigning values in bash.
* `$x` → This is how you **use** the variable. Without `$`, you’d just get the word “x”.
* You can also write `${x}` — this is useful when variables are next to other text, like `echo "${x}abc"`.

---

## **4️⃣ Storing command output in a variable**

```bash
today=$(date)
echo $today
echo "Todays date: $today"
```

* `$(command)` → runs the command inside and stores its output in the variable.
* Here `date` prints the current date/time.
* `$today` now holds that string.

---

## **5️⃣ Reading input from the user**

```bash
# read x
```

* `read x` → waits for user to type something, stores it in `x`.
* Example:

```bash
read name
echo "Hello $name!"
```

* In your script, you commented it out with `#`, so it won’t run.

---

## **6️⃣ Showing input**

```bash
echo "User Input: $x"
```

* This would show whatever was stored in `$x`.
* If you didn’t run `read x` earlier, `$x` will still hold the old value (`12` in your script).

---

## **7️⃣ Math in Bash**

```bash
x=22
y=$((x+3))
```

* `$(( ... ))` → tells bash to treat values as **numbers**, not strings.
* Without `$(( ))`, bash won’t do math — it’ll just store the text.
* Example:

```bash
x=10
y=$((x*2))
echo $y   # Output: 20
```

---

## **8️⃣ Why `$(( ))` matters**

```bash
x=22
y=$x+3
echo $y
```

* This will output: `22+3`
  Because bash just glued together the variable `$x` and the string `+3` — it never calculated anything.

---

## **🔥 Pro Tips for Your OS Lab**

* **Always** use `$(command)` for capturing command output.
* **Always** use `$((expression))` for math.
* Use `"${var}"` when printing — prevents problems with spaces.
* Test scripts step-by-step using `bash -x script.sh` — it shows every line as it runs (useful for debugging in lab tests).

---

✅ If you want, I can now make you a **Bash Math + Variables mini-cheat sheet**
with examples like addition, subtraction, multiplication, division, modulus, and storing command outputs —
so you’ll never forget the syntax during lab or viva.

Do you want me to prepare that next?
It’ll be 1 page and super quick to memorize.
