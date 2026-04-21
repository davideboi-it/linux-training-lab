# Module 12 - File Ownership and Permissions

In order to protect files and directories, Linux uses two primary security mechanisms: **Ownership** and **Permissions**.

## 1. Core Concepts
* **Ownership:** Correlates to the owner (or creator) of a file or directory and its associated group. Every single file and program must have an owner.
* **Permissions:** Define what every user can do with a file or directory. 
* There are 3 permission sets: **UGO (User, Group, Other)**.
* Inside every file, there is a UID and GID, and permissions are treated separately.
* **Root Power:** The root user can change ownership and permissions for everything. A normal user can only change permissions for files they own (and can only change the group to a group they already belong to).

### Ownership Commands:
* `chown`: Change ownership (User).
* `chgrp`: Change group ownership. *(Note: Must be executed as root or by the file owner if changing to a group they belong to).*

---

## 2. How to Read Permissions (`ls -l`)
When running the `ls -l` command, the output displays several pieces of information in this exact order:
1. Permissions (10 characters)
2. Number of hard links
3. Owner name
4. Group owner name
5. File size
6. Timestamp (Last modified)
7. File name & format

### The File Type Code (First Character)
The very first character of the 10-character permission string indicates the file type:
* `-` : Normal data file
* `d` : Directory
* `l` : Symbolic link
* `p` : Named pipe
* `s` : Socket
* `b` : Block device
* `c` : Character device

### The Permission String (UGO)
The remaining 9 characters are divided into 3 sets of 3:
* **User (Owner) Permissions:** 2nd, 3rd, and 4th characters. What the owner can do.
* **Group Permissions:** 5th, 6th, and 7th characters. What the group members can do.
* **Other Permissions:** 8th, 9th, and 10th characters. What everyone else can do.

---

## 3. Setting Permissions

### The 3 Basic Permissions
* **Read (`r`)**: To read a file.
* **Write (`w`)**: To modify a file.
* **Execute (`x`)**: To run a file as a program, or to enter a directory (`cd`).
* If a permission is absent, it is represented by a `-`.

### Octal Notation (3-Digit Code)
Permissions can be calculated using numbers:
* `4` : Read
* `2` : Write
* `1` : Execute
* `0` : None
*(Adding them together gives the specific permission, e.g., 4+2+1 = 7).*

### Important Exceptions & Rules
1. **Directory Execute Bit:** Must be turned on to permit a user to search/enter the directory.
2. **Directory Write Permission:** If you have write permission (`2`) on a directory, you can create, modify, or delete files *inside* it, regardless of the files' individual permissions.
3. **Symbolic Links:** Permissions on a symbolic link always appear as `777`, but they do not affect the original target file's permissions.

### Default Permissions & Umask
Many of these standard permission rules do not restrict the Root user.
* **Umask (User Mask):** Determines the default permissions for new files and directories by subtracting from the system maximums.
    * Max for files: `666`
    * Max for directories: `777`
* Use the `umask` command to view or change this setting.

---

## 5. Special Permissions (Advanced)

### The Sticky Bit
If a directory has `777` permissions, anyone can delete any file inside it. To prevent this, Linux uses the **Sticky Bit**. When set, a user may only delete files they personally own within that directory (e.g., the `/tmp` folder).
* **Octal:** Adds `1` to the thousands place (e.g., `1755`).
* **Symbolic:** Uses the character `t`.
    * `chmod +t <directory>` (Add sticky bit)
    * `chmod -t <directory>` (Remove sticky bit)

### SUID & SGID Bits
Used to temporarily elevate privileges, allowing a user to run a program with the permissions of the file owner or group (e.g., the `passwd` command needs root access to change passwords).
* **SUID (Set User ID):** Runs the program with the permissions of the file owner. Indicated by an `s` in the owner's execute position (e.g., `rws------`).
* **SGID (Set Group ID):** Sets the group of the running program to the group of the file. Indicated by an `s` in the group's execute position.

**Changing Special Bits with `chmod`:**
* **Octal:**
    * `4` : Set SUID bit (e.g., `4755`)
    * `2` : Set SGID bit (e.g., `2755`)
    * `6` : Set both bits
* **Symbolic:**
    * `chmod u+s <file>` : Set SUID bit (`-` to remove)
    * `chmod g+s <file>` : Set SGID bit (`-` to remove)
    * `chmod ug+s <file>` : Set both

---

## 6. Hiding Files and Directories
* **How to hide:** Rename the file or directory so it starts with a dot `.` using the `mv` command (e.g., `mv file.txt .file.txt`).
* **Note:** Hiding a file does *not* make it inaccessible to programs that know its exact path; it only hides it from the standard `ls` output.
* Use `ls -a` to view hidden files.
* *(Note: The `ls -d` command is used to list directories themselves, not their contents).*

---
