Linux is a multi-user environment, meaning multiple users can access the same folders and terminals simultaneously from different locations or desktops.

### Types of Users:
1. **Root User (Super User):** The system administrator with full access to all parts of the system and the ability to execute any task.
2. **Normal User:** Operates with restricted privileges. Each user has their own personal home folder and private file system area.

---

### Filesystem Structure
Linux organizes all files in a **Tree-like structure**.
- **Root Directory (`/`):** The principal directory and the starting point of the entire system (equivalent to `C:\` in Windows).
- **Paths:** Linux uses **Front Slashes** (`/`) to separate directories, unlike Windows which uses backslashes (`\`).

### Mounting Partitions
Linux handles storage differently than Windows:
- **Mounting:** The process of attaching a partition or device to a specific directory in the filesystem tree.
- **Access:** Data on an unmounted partition is inaccessible. It must be "mounted" into the filesystem (e.g., under `/mnt` or `/media`) to be read or written.
- **Windows vs. Linux:** Windows automatically assigns letters (C:, D:) at boot. Linux requires initialization (mount), though removable drives are often handled automatically by modern desktop environments.

### File Characteristics
- **Case Sensitivity:** Linux is case-sensitive. `File.txt` and `file.txt` are two completely different files.
- **Extensions:** File extensions are not mandatory. A file's type is determined by its content/header, not just its name.
- **Hidden Files:** Any file or folder starting with a dot `.` is hidden by default (e.g., `.bashrc`).

---

### Permissions and Ownership
Every user has a personal folder, but the **Root** user has total permission over the entire system.

**The 3 Types of Permissions:**
1. **Read (r):** Ability to view the contents of a file or list a directory.
2. **Write (w):** Ability to modify a file or create/delete files within a directory.
3. **Execute (x):** Ability to run a file as a program or enter a directory.

**Management:**
Permissions can be modified via the Shell (using `chmod`) or the Filesystem Manager.

---

### Filesystem Hierarchy Standard (FHS)
Linux follows the **FHS** to maintain organization. It distinguishes between:
- **Sharable vs. Unsharable:** Data that can be accessed over a network vs. data local to a specific machine.
- **Static vs. Variable:** - **Static:** Files that do not change (e.g., executable programs, libraries).
    - **Variable:** Files that change frequently (e.g., log files, spool files, temporary data).

### Exploring the Filesystem
- `ls`: Standard command to list files.
- `ls -a`: List **all** files, including hidden ones (those starting with a dot `.`).
- `ls -la`: Provides a detailed list with permissions, creation date, and size for all files.
- `pwd` (Print Working Directory): Shows the full path of the directory you are currently in.
- `cd`: Command used to move between different folders.

### Types of Path References
Understanding your position in the "Tree" is vital for execution:
- **Absolute Path:** The full path relative to the **Root** directory (e.g., `/home/user`). Always begins with a `/`.
- **Home Directory:** Represented by the tilde `~` symbol, indicating the current user's personal directory.
- **Relative Path:** Locates a file based on your **current** directory.
    - `..` (Double dot): Represents the **parent** directory (one level up).
    - `.` (Single dot): Represents the **current** directory.

### File Operations
- `touch <filename>`: Creates a new, empty file.
- `cp <source> <destination>`: Copies a file. (Consult `man cp` for advanced options).
- `mv <source> <destination>`: Moves a file to a new location or renames it if the destination path remains the same.

---

### Understanding Links
Sometimes it is more efficient to use a different name to refer to the same file rather than copying it. This is done using the `ln` command.
- **Hard Link:** Creates a duplicate directory entry where both names point to the exact same data on the disk.
    - **Syntax:** `ln <original_name> <link_name>`

### Symbolic Links (Symlinks)
A **Symbolic Link** is a special type of file that points to another file or directory by its name. 
- Unlike Hard Links, if the original file is deleted, the Symlink becomes "broken" because it no longer points to a valid name.
- **Syntax:** `ln -s <original_name> <link_name>`

---

### Wildcards (Globbing)
Wildcards are symbols used to represent one or more characters, allowing you to perform actions on multiple files at once. 
**Note:** Bash is case-sensitive, so wildcards must be used carefully.

**Common Wildcard Classes:**
1. `?` **(Single Character):** Matches exactly one character.
    - Example: `b??l` matches `bull`, `ball`, `bowl`.
2. `*` **(Multiple Characters):** Matches zero or more characters.
    - Example: `b*l` matches `bl`, `bel`, `bell`, `brawl`.
3. `[ ]` **(Character Sets):** Matches only the characters defined inside the brackets.
    - Example: `b[ao][lw]l` matches `bowl`, `ball`, but **not** `bull`.

> **Warning:** Be cautious when using wildcards on external drives (FAT/NTFS) as they might not support Linux-style case sensitivity.

---

### Directory Management from Bash
You can create, remove, and organize directories directly from the terminal:

- `mkdir <name>`: Creates a new directory.
- `rmdir <name>`: Removes an **empty** directory.
- `rmdir -p <path>`: Removes a directory and its parent directories (only if they are all empty).
- `rm -r <name>`: Recursively removes a directory and **all** its contents (files and subfolders). **Use with extreme caution!**

### The "Everything is a File" Concept
In Linux, directories are treated as a special type of file.
- **Directories:** A special file that acts as a container for other file names and their metadata.
- **Modification:** While you can edit the content of a regular file, you can only modify a directory's metadata (like its timestamp) through specific commands.

### Advanced Command Usage
- `touch <directory_name>`: When used on an existing directory, it updates its **Access and Modification timestamps** without changing the contents inside.
- `cp -p -r <source_dir> <destination_dir>`: 
    - `-p` (Preserve): Copies the directory while keeping the original attributes (owner, group, permissions, and timestamps).
    - `-r` (Recursive): Copies the directory and everything it contains (subdirectories and files).
