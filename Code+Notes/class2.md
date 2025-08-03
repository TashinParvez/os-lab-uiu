# 🧠 Week 2 : Linux Basic Commands + Comparison with C

## 💻 1. **Create a New Folder**

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

## 📍 2. **Print Current Directory Path / Print working directory**

```bash
pwd
```

- `pwd` → This stands for **"print working directory"**

##### Output Example:

```bash
/home/tashin/os-lab-uiu
```

---

## 📝 3. **Create a New File**

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

## 📂 4. **Navigate Between Folders**

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

#### Know Which Files and folders are in the current directory

```bash
ls
```

- `ls` stands for → `list`

### 🔧 Popular `ls` Variants:

| Command      | Meaning                                                        |
| ------------ | -------------------------------------------------------------- |
| `ls`         | show list [ only names of the folders and files ]              |
| `ls -l`      | Long format with details (permissions, size, date)             |
| `ls -a`      | Show **all files**, including hidden (those starting with `.`) |
| `ls -la`     | Show **detailed + all files**                                  |
| `ls folder/` | List contents of a specific folder                             |



#### ➤ `Ls -l`



#### 🧪 Sample Output:

```bash
$ ls -l
-rw-r--r--  1 tashin  tashin   1024 Aug  3 10:30 notes.txt
drwxr-xr-x  2 tashin  tashin   4096 Aug  2 18:00 project
```
#### 🧠 Let’s Break This Down:

```
-rw-r--r--  1  tashin  tashin   1024  Aug  3 10:30  notes.txt
│ │        │   │       │         │      │           └── File name
│ │        │   │       │         │      └── Date & time modified
│ │        │   │       │         └── File size (in bytes)
│ │        │   │       └── Group name
│ │        │   └── Owner name
│ │        └── Number of hard links
│ └── File type and permissions
└── - means file (d = directory)
```














#### Go to another folder:

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

### Example:

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

<!-------------------- TASHIN HERE --------------------->
<!-------------------- TASHIN HERE --------------------->
<!-------------------- TASHIN HERE --------------------->
<!-------------------- TASHIN HERE --------------------->

## 🔄 4. **Move a File to Another Folder**

```bash
mv source_file target_folder/
```

### Example:

Move `Assignment-01.c` to the `Assignments/Assignment-01/` folder:

```bash
mv Assignment-01.c Assignments/Assignment-01/
```

### Rename while moving:

```bash
mv old_name.c Assignments/Assignment-01/new_name.c
```

# ======================================

## ✅ Summary Cheat Sheet

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
