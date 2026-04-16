# Module 6 Practice: File and Directory Management

This directory contains hands-on exercises focused on navigating the Linux filesystem and performing file operations using the command line.

## Concepts and Skills Practiced

### 1. Navigation & Path Types
* **Absolute Paths:** Navigating using the full path from the root (`/`).
* **Relative Paths:** Moving between directories using `.` (current directory) and `..` (parent directory).
* **Home Shortcut:** Using `~` to quickly return to the user's home directory.

### 2. Wildcard Operations
I practiced using wildcards to perform bulk operations on files with similar naming patterns:
* **`?` (Question Mark):** Matches exactly one character. 
    * *Example:* `mv ../folder1/b??l.txt .` (Moved files like `bowl.txt` and `bull.txt`).
* **`[]` (Square Brackets):** Matches any one character contained within the brackets.
    * *Example:* `mv b[ou][wl]l.txt ../folder1` (Specific selection of characters).

### 3. Directory Manipulation
* **Creation:** Used `mkdir` to create multiple folders and nested structures.
* **Removal:** Practiced deleting directories using `rm -r` (recursive) to ensure all contents, including hidden files, were removed.   #CAREFUL OPERATION!#

### 4. File Discovery
* **`ls -la`**: Used to list all files, including hidden ones (files starting with a `.`).
* **`ls -F`**: Used to visually distinguish between files and directories by adding a trailing slash `/` to folder names.

## Key Commands Used
```bash
# Move specific files using wildcards
mv ../folder1/b??l.txt .

# Create and remove directories
mkdir folder1 folder2
rm -r old_folder

# Inspect directory content including hidden files
ls -la
