# Week 2 : Linux Basic Commands

---

## 🚨 **Create a New Folder**

---

To create a folder in the current directory:

```bash
mkdir folder_name
```

- `mkdir` → stands for **make directory**

#### Example:

```bash
mkdir Assignments           # Create Assignments folder
```

- `Assignments` → is the **name of the new folder** you want to create

You can also create **nested folders**:

```
Assignments/
└── Assignment-01/
```

```bash
mkdir -p Assignments/Assignment-01
```

- `-p` → means **"create parent folders if they don’t exist"**

or

```bash
mkdir Assignments           # Create the parent folder
cd Assignments              # Move into it
mkdir Assignment-01         # Create the subfolder inside it
```

---

## 🚨 **Print Current Directory Path / Print working directory**

---

```bash
pwd
```

- `pwd` → This stands for **"print working directory"**

##### Output Example:

```bash
/home/tashin/os-lab-uiu
```

---

## 🚨 **Create a New File**

---

#### ➤ Using `touch` (creates an empty file):

```bash
touch file_name.file_extention
```

Example:

```bash
touch Assignment-01.c       # create c file name Assignment-01
```

#### ➤ Create 3 files: `file1.txt`, `file2.txt`, `file3.txt`

```bash
touch file1.txt file2.txt file3.txt  # same type of files
touch tashin.txt parvez.c   # 2 diff type of files
```

#### ➤ Or with a loop:

```bash
for i in {1..3}; do
  touch "file$i.txt"
done
```

This loop creates `file1.txt`, `file2.txt`, and `file3.txt`.

---

## 🚨 **Navigate Between Folders**

---

#### Know Current position:

```bash
pwd
```

#### Go back `one level` from current position:

```bash
cd ..
```

- `cd` means `Change Directory`
- `cd ..` Go one level up
- Prev Pos `tashin/os/os-lab/` → run `cd ..` → Curr Pos `tashin/os/`

---

## 🚨 Know Which Files and folders are in the current directory

---

```bash
ls
```

- `ls` stands for → `list`

### 🔧 Popular `ls` Variants:

| Command      | Meaning (in Easy English)                                                        |
| ------------ | -------------------------------------------------------------------------------- |
| `ls`         | Shows the names of files and folders in the current folder                       |
| `ls -1`      | Shows each file/folder on a **separate line** (good for clean view or scripting) |
| `ls -l`      | Shows **details** like size, permissions, and date of each file/folder           |
| `ls -a`      | Shows **all files**, including **hidden files** (names start with `.`)           |
| `ls -la`     | Shows **all files** with **details**                                             |
| `ls folder/` | Shows what's inside a specific folder                                            |

#### ➤ `Ls -l`

#### 🧪 Sample Output:

```bash
$ ls -l
-rw-r--r--  1 tashin  tashin   1024 Aug  3 10:30 notes.txt
drwxr-xr-x  2 tashin  tashin   4096 Aug  2 18:00 project
```

#### 🧠 Let’s Break This Down:

```
-rw-r--r-- 1 tashin tashin 1024 Aug 3 10:30 notes.txt
│          │     │      │     │         │
│          │     │      │     │         └── 📄 File name
│          │     │      │     └── 🕐 Last modification date & time
│          │     │      └── 📏 File size (in bytes)
│          │     └── 👥 Group name (group ownership)
│          └── 👤 Owner (user who created or owns the file)
└── 🔒 File type & permissions
```

#### 🔐 Breakdown of the First Field

```
-rw-r--r--
│││ ││ ││
│││ ││ │└── 10th: Other users — Execute permission
│││ ││ └── 9th: Other users — Write permission
│││ ││ └── 8th: Other users — Read permission
│││ └└─── 5th–7th: Group permissions (r-- = read only)
│└─────── 2nd–4th: Owner permissions (rw- = read and write)
└──────── 1st: File type (`-` = file, `d` = directory, `l` = link)
```

### Table Summary of Permission Bits:

| Position     | Meaning                  | Possible Values | Explanation                             |
| ------------ | ------------------------ | --------------- | --------------------------------------- |
| 1st          | File Type                | `-`, `d`, `l`   | `-` = file, `d` = directory, `l` = link |
| 2nd,3rd,4th  | Owner (User) Permissions | `r`, `w`, `x`   | Read, Write, eXecute                    |
| 5th,6th,7th  | Group Permissions        | `r`, `w`, `x`   | Applied to members of the file’s group  |
| 8th,9th,10th | Others (Everyone else)   | `r`, `w`, `x`   | Permissions for all other users         |

🧠 **Mnemonic**: `User-Group-Other` (UGO)

### 🪟 Linux vs Windows File Permission: (Comparison)

| Feature                 | Linux (Unix-style)             | Windows (NTFS ACL-based)             |
| ----------------------- | ------------------------------ | ------------------------------------ |
| Permissions Model       | UGO (User, Group, Others)      | ACL (Access Control Lists)           |
| Command Line Control    | `chmod`, `chown`, `ls -l`      | `icacls`, `attrib`, GUI properties   |
| Granularity             | Simpler, 3 sets of permissions | More complex, per-user/group rights  |
| Default Security Layer  | Strong multi-user model        | GUI-based, per-account custom rules  |
| Symbolic representation | `-rw-r--r--`                   | No symbolic, usually GUI or ACL list |

## 🎯 **Understanding Linux File Permissions**

permissions apply to **three groups of users**:

| Position | User Type              |
| -------- | ---------------------- |
| 1–3      | Owner (user)           |
| 4–6      | Group                  |
| 7–9      | Others (everyone else) |

### 🧠 Example:

```
-rwxr--r-- 1 tashin tashin 1024 Aug 3 10:30 notes.txt
```

Here:

- Owner (`tashin`) has: `rwx`
- Group has: `r--`
- Others have: `r--`

---

## 🚨 **Changing Permissions with `chmod`**

---

```bash
chmod [permissions] [file_name]
```

- `chmod` stands for **change mode**
- It is used to change the permissions of a **file or directory**.

#### **Symbolic Method**

| Symbol | Meaning           |
| ------ | ----------------- |
| `u`    | User (owner)      |
| `g`    | Group             |
| `o`    | Others            |
| `a`    | All (u+g+o)       |
| `+`    | Add permission    |
| `-`    | Remove permission |
| `=`    | Set exact perms   |

#### Examples:

```bash
chmod u+x myfile.txt      # Add execute for user
chmod g-w myfile.txt      # Remove write from group
chmod o=r myfile.txt      # Set only read for others
chmod a+rw file.txt       # Give read+write to everyone
```

---

## 🚨 Go to another folder:

---

```bash
cd folder_name   # Go into [folder_name]
```

```bash
cd folder1/folder2   # Go into folder1, then inside it go into folder2
```

### Go to root (home directory):

```bash
cd ~
```

##### Example:

```bash
/home/tashin/project/
├── folder01/
├── folder02/
```

```
current pos:   /home/tashin/project/folder01/
Need to Go :   /home/tashin/project/folder02/
```

```
Solution
------------------------
cd ../folder02
```

### 🔧 Related `cd` Commands:

| Command          | Meaning                                  |
| ---------------- | ---------------------------------------- |
| `cd ..`          | Go one level up                          |
| `cd ../folder02` | Go up, then into `folder02`              |
| `cd ../../`      | Go up **two levels**                     |
| `cd ~/Desktop`   | Go to the Desktop in your home directory |
| `cd`             | Go to home directory                     |

---

## 🚨 **Move a File to Another Folder**

---

```bash
mv source_file target_folder
```

#### Example:

Move `Assignment-01.c` to the `Assignments/Assignment01/` folder:

```bash
mv Assignment-01.c Assignments/Assignment01
```

#### Rename while moving:

```bash
mv old_name.c Assignments/Assignment-01/new_name.c
```

---

## 🚨 How to Rename a File

---

```bash
mv old_filename new_filename
```

- `mv` stands for **move**.
- It moves the file from `old_filename` to `new_filename`.

#### Rename directories:

- To rename directories, the same `mv` command works:

```bash
mv old_folder_name new_folder_name
```

- It simply changes the folder’s name without moving it anywhere else.
- The structure inside the folder remains unchanged.
- Works the same way as renaming files.

- To avoid overwriting existing files, use `-i` (interactive mode):

```bash
mv -i file1.txt file2.txt
```

- This will ask before overwriting.

---

## 🚨 Copying Files or folder with `cp` Command

---

```bash
cp source_file destination_file
```

- Copies the **source file** to the **destination file or folder**.
- If the destination is a **file name**, it creates a copy with that name.
- If the destination is a **folder**, it copies the file into that folder with the same name.

### Examples:

#### 1. Copy `file1.txt` to `file2.txt` (in the same folder)

```bash
cp file1.txt file2.txt
```

### 2. Copy `file1.txt` into the folder `backup/`

```bash
cp file1.txt backup/
```

- Now `backup/file1.txt` exists.

### 3. Copy directory (folder) with contents (recursively)

```bash
cp -r folder1/ folder2/
```

- `-r` means **recursive** (copy folder + all its contents). (MUST)

---

#### ✅ Additional tips:

- Use `cp -i` to ask before overwriting files.
- Use `cp -v` to see what’s being copied (verbose).

---

## 🚨 What is the `cat` command?

---

- `cat` stands for **"concatenate"**.

It’s mainly used to:

- **Display** the content of files on the terminal.
- **Concatenate** multiple files into one.
- **Create** new files by redirecting output.

```bash
cat filename.file_extention
```

This will **print the contents** of the file on the terminal.

### Examples:

#### 1. Display file content:

```bash
cat notes.txt
```

Output:

```
This is my notes file.
It contains important information.
```

### 2. Concatenate two files:

```bash
cat file1.txt file2.txt
```

- This will **combine** `file1.txt` and `file2.txt` and show in terminal.

or

```bash
cat file1.txt file2.txt > combined.txt
```

- This will **combine** `file1.txt` and `file2.txt` into a new file `combined.txt`.

### 3. Create a new file:

```bash
cat > newfile.txt
```

Type your text, then press **Ctrl + D** to save and exit.

### 4. Show line numbers:

```bash
cat -n file.txt
```

Prints file content with line numbers.

---

## 🚨 What is `echo`?

---

The `echo` command is used to **print a line of text or value of a variable** to the terminal or output.

```bash
echo [string]
```

##### Examples:

#### 1. **Print plain text**

```bash
echo Hello, World!
```

✅ Output:

```
Hello, World!
```

###### Example 01:

```bash
echo "tashin        parvex"
```

- This **preserves the extra spaces** between `tashin` and `parvex` **because the text is inside quotes**.

🖨️ Output:

```
tashin        parvex
```

###### Example 02:

```bash
echo tashin    parvez
```

- **does not preserve** the extra spaces because the shell **treats multiple spaces as one** when not using quotes.

🖨️ Output:

```
tashin parvez
```

#### 2. **Print a variable**

```bash
name="Tashin"
echo My name is $name
```

✅ Output:

```
My name is Tashin
```

#### 3. **Echo with double vs. single quotes**

```bash
echo "$name"    # Prints value of the $name variable
echo '$name'    # Print ➡ '$name'
```

### 4. **Add new line and tab with escape sequences**

```bash
echo -e "Line1\nLine2"   # \n for new line
echo -e "Name:\tTashin"  # \t for tab
```

- `-e` enables interpretation of backslash escapes in the echo command (like \n, \t, \\, etc.).

### 5. **Redirect output to a file**

```bash
echo "Hello, UIU!" > message.txt
```

- This creates a file `message.txt` with the content `Hello, UIU!`
- Overwrites the file message.txt with the text `Hello, UIU!`.

### 6. **Append to an existing file**

```bash
echo "Another line" >> message.txt
```

- does not Overwrites

### 7. **Exercise using `-e`**

- Create a file `numbers.txt` containing numbers from 1 to 5 (one per line).
  <p style="color:green; font-weight:bolder">Solve:</p>

  ```bash
  echo -e "1\n2\n3\n4\n5" > numbers.txt
  ```

- `-e` enables interpretation of backslash escapes in the echo command (like \n, \t, \\, etc.).

---

## 🚨 `head` Command

---

- Shows the **first N lines** of a file (default is 10 lines).

```bash
head filename.txt
```

###### 🔹 Example:

```bash
head message.txt
```

- Shows the **first 10 lines** of `message.txt`.

#### 🔹 Custom lines:

```bash
head -n5 message.txt
```

- Shows the **first 5 lines**.

- `-n` flag stands for "number"
- it specifies how many lines you want to show from the start (head) or the end (tail) of a file.

---

## 🚨 `tail` Command

---

- Shows the **last N lines** of a file (default is 10 lines).

```bash
tail filename.txt
```

###### 🔹 Example:

```bash
tail message.txt
```

✅ Shows the **last 10 lines** of `message.txt`.

#### 🔹 Custom lines:

```bash
tail -n 3 message.txt
```

- Shows the **last 3 lines**.

---

### 🔄 Summary:

| Command | Shows               | Default Lines | Custom Line Count Example |
| ------- | ------------------- | ------------- | ------------------------- |
| `head`  | First lines of file | 10            | `head -n5 filename.txt`   |
| `tail`  | Last lines of file  | 10            | `tail -n5 filename.txt`   |

---

## 🚨 Combining `head` and `tail`

---

- Sometimes you want a **specific part** of a file.

For example, lines 11–20:

```bash
head -n 20 filename.txt | tail -n 10
```

- `head -n 20` gives first 20 lines.
- Then `tail -n 10` extracts the last 10 of those lines (lines 11–20).

### 🔰 Examples

##### Example 1: Check first 5 lines of a student list:

```bash
head -n 5 students.txt
```

##### Example 2: Get lines 11 to 20 from `file.txt`

```bash
head -n 20 file.txt | tail -n 10
```

- `head -n 20 file.txt` — gets the first 20 lines.
- `tail -n 10` — from those 20 lines, gets the last 10 lines (lines 11 to 20).

##### Example 3: Get lines 5 to 15 from `log.txt`

```bash
head -n15 log.txt | tail -n 11
```

- `head -n 15` gets first 15 lines.
- `tail -n 11` extracts lines 5 to 15 (because 15 - 5 + 1 = 11).

##### Example 4: Get lines 100 to 120 from a huge file `data.csv`

```bash
head -n 120 data.csv | tail -n 21
```

- Get first 120 lines.
- Then extract last 21 lines (lines 100 to 120).

---

## ✅ Summary Cheat Sheet

---

| Task                | Command                          |
| ------------------- | -------------------------------- |
| Make folder         | `mkdir folder_name`              |
| Make nested folders | `mkdir -p path/to/folder`        |
| Show current path   | `pwd`                            |
| Create file         | `touch filename.ext`             |
| Move file to folder | `mv file folder/`                |
| Rename and move     | `mv old.c new_folder/new_name.c` |
| Change directory    | `cd folder_name`                 |
| Go back one level   | `cd ..`                          |

---

# Week 2: Linux Basic Commands — Summary Table

---

| **Topic**                   | **Command(s)**                               | **Description / Notes**                                                      | **Example**                                                                      |                       |                            |
| --------------------------- | -------------------------------------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------- | -------------------------- |
| **Create Folder**           | `mkdir folder_name`                          | Create a new directory                                                       | `mkdir Assignments`                                                              |                       |                            |
|                             | `mkdir -p path/to/folder`                    | Create nested folders (parents if needed)                                    | `mkdir -p Assignments/Assignment-01`                                             |                       |                            |
| **Print Current Directory** | `pwd`                                        | Show full path of current directory                                          | `/home/tashin/os-lab-uiu`                                                        |                       |                            |
| **Create File**             | `touch file_name`                            | Create empty file(s)                                                         | `touch file1.txt file2.txt`                                                      |                       |                            |
|                             | `for i in {1..3}; do touch file$i.txt; done` | Create multiple files with a loop                                            |                                                                                  |                       |                            |
| **Navigate Folders**        | `cd folder_name`                             | Change directory                                                             | `cd Assignments`                                                                 |                       |                            |
|                             | `cd ..`                                      | Go up one directory level                                                    |                                                                                  |                       |                            |
|                             | `cd ~/Desktop`                               | Go to home/Desktop                                                           |                                                                                  |                       |                            |
| **List Files & Details**    | `ls`                                         | List files/folders                                                           |                                                                                  |                       |                            |
|                             | `ls -l`                                      | List with detailed info (permissions, owner, size, date)                     |                                                                                  |                       |                            |
|                             | `ls -a`                                      | Show all files including hidden (starting with `.`)                          |                                                                                  |                       |                            |
|                             | `ls -la`                                     | Detailed + hidden                                                            |                                                                                  |                       |                            |
| **File Permissions**        | `-rw-r--r--` (example)                       | Permissions broken into User-Group-Others; r=read, w=write, x=execute        |                                                                                  |                       |                            |
| **Change Permissions**      | `chmod [options] file`                       | Modify file permissions                                                      | `chmod u+x file.txt` (add execute for user)                                      |                       |                            |
|                             |                                              | `u`=user, `g`=group, `o`=others, `a`=all; `+`=add, `-`=remove, `=`=set exact |                                                                                  |                       |                            |
| **Move / Rename Files**     | `mv source target`                           | Move or rename files/folders                                                 | `mv old.txt new.txt` or `mv file.txt folder/`                                    |                       |                            |
|                             | `mv -i`                                      | Interactive (ask before overwrite)                                           |                                                                                  |                       |                            |
| **Copy Files / Folders**    | `cp source dest`                             | Copy file(s)                                                                 | `cp file1.txt backup/`                                                           |                       |                            |
|                             | `cp -r folder1 folder2`                      | Copy folder recursively                                                      |                                                                                  |                       |                            |
|                             | `cp -i` / `cp -v`                            | Interactive / verbose copy                                                   |                                                                                  |                       |                            |
| **View File Content**       | `cat filename`                               | Show file content                                                            |                                                                                  |                       |                            |
|                             | `cat file1 file2 > combined`                 | Concatenate files                                                            |                                                                                  |                       |                            |
|                             | `cat > newfile`                              | Create file with input                                                       |                                                                                  |                       |                            |
|                             | `cat -n file`                                | Show with line numbers                                                       |                                                                                  |                       |                            |
| **Print Text / Variables**  | `echo [text]`                                | Print string or variable value                                               | `echo "Hello, World!"`                                                           |                       |                            |
|                             | `echo $var`                                  | Show variable content                                                        |                                                                                  |                       |                            |
|                             | `echo -e "Line1\nLine2"`                     | Enable escape sequences (`\n` newline, `\t` tab)                             |                                                                                  |                       |                            |
|                             | `echo "text" > file`                         | Write text to file (overwrite)                                               |                                                                                  |                       |                            |
|                             | `echo "text" >> file`                        | Append text to file                                                          |                                                                                  |                       |                            |
| **View File Head**          | `head filename`                              | Show first 10 lines (default)                                                |                                                                                  |                       |                            |
|                             | `head -n N filename`                         | Show first N lines                                                           | `head -n 5 file.txt`                                                             |                       |                            |
| **View File Tail**          | `tail filename`                              | Show last 10 lines (default)                                                 |                                                                                  |                       |                            |
|                             | `tail -n N filename`                         | Show last N lines                                                            | `tail -n 3 file.txt`                                                             |                       |                            |
| **Head + Tail Combo**       | \`head -n X file                             | tail -n Y\`                                                                  | Extract lines from specific range: first get X lines, then last Y lines of those | \`head -n 20 file.txt | tail -n 10\` (lines 11–20) |

---
