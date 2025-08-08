## 📄 **Week 2 Assignments — Basic Shell Commands & Bash Scripting**

---

### **Part A — Linux Commands Practice**

**1. File and Directory Operations**

- Create a directory named `UIU_OS_Lab`.

  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  mkdir UIU_OS_Lab
  ```

- Inside it, create three empty text files: `week1.txt`, `week2.txt`, and `week3.txt`.

  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  touch week1.txt week2.txt week3.txt
  ```

- Rename `week1.txt` → `week01_notes.txt`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  mv week1.txt week01_notes.txt
  ```

- Copy `week2.txt` to a new file called `week2_copy.txt`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  cp week2.txt week2_copy.txt
  ```

- Move `week3.txt` into a subfolder named `backup`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  mkdir backup
  mv week3.txt backup/
  ```

  or

  ```bash
  mkdir backup && mv week3.txt backup/
  ```

---

**2. Viewing Files**

- Add the text `Hello, UIU!` to `week01_notes.txt` using `echo` with `>`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  echo "Hello, UIU!" >> week01_notes.txt
  ```

- Append the text `This is Week 2.` to the same file using `>>`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  echo "This is Week 2." >> week01_notes.txt
  ```

- Use `cat` to view the contents of the file.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  cat week01_notes.txt
  ```

- Show the first 3 lines of `week01_notes.txt` using `head`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  head -n 3 week01_notes.txt
  ```

- Show the last 2 lines of `week01_notes.txt` using `tail`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  tail -n 2 week01_notes.txt
  ```

---

**3. Permissions**

- Check the permissions of `week01_notes.txt` using `ls -l`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
   ls -l week01_notes.txt
  ```

- Give the owner **read, write, and execute** permissions.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  chmod u+rwx week01_notes.txt
  ```

- Remove **write** permission for "others".
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  chmod o-w week01_notes.txt
  ```

- Verify changes using `ls -l`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
   ls -l week01_notes.txt
  ```

---

**4. Navigation**

- Go back to your home directory using `cd`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  cd ~
  ```

  or

  ```bash
  cd
  ```

- Navigate to `UIU_OS_Lab/backup` using a **relative path**.
   <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  cd UIU_OS_Lab/backup
  ```

- Navigate to `UIU_OS_Lab` using an **absolute path**.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  cd ~/UIU_OS_Lab
  ```

---

### **Part B — Combining Commands**

**5. Using `head` and `tail` Together**

- Create a file `numbers.txt` containing numbers from 1 to 20 (one per line).
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  echo -e "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20" > numbers.txt
  ```

- Show only lines 6 to 10 using `head` and `tail`.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  head -n 10 numbers.txt | tail -n 5
  ```

- Show only lines 11 to 15.
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  head -n 15 numbers.txt | tail -n 5
  ```
