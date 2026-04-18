# Module 7 (Part 2): Regular Expressions and Archiving

## 1. Regular Expressions (Regex)
Regular Expressions are patterns used to search for specific text strings inside files. Unlike Wildcards (used for filenames), Regex is used for data content.

### Basic Regex Syntax:
* `[abc]`: Matches any single character inside the brackets (e.g., 'a', 'b', or 'c').
* `[2-4]`: Matches a range of characters (e.g., 2, 3, or 4).
* `.` (Dot): Matches exactly one character of any type.
* `^`: Matches the **start** of a new line.
* `$`: Matches the **end** of a line.
* `*`: Matches zero or more repetitions of the preceding character.
* `\`: The **Escape Character**. Used to search for special characters literally (e.g., `\.` searches for an actual period).

### Grep with Regex:
* `grep -n`: Shows the line number of the results.
* `grep -E`: Enables **Extended Regular Expressions** (allows using advanced symbols like `|`, `+`, or `?`).

---

## 2. File Archiving and Compression
Archiving collects multiple files into one, while compression reduces the file size.

### Archiving with `tar` (Tape Archiver):
* Used to group files into a single ".tar" package (often called a "tarball").
* The original files remain on the disk.

### Compression Tools:
To reduce size, we use different algorithms. Each has a specific decompression command:

| Tool | Extension | Decompression |
| :--- | :--- | :--- |
| **Gzip** | `.gz` | `gunzip` |
| **Bzip2** | `.bz2` | `bunzip2` |
| **XZ** | `.xz` | `unxz` |

### Compressed Tarballs (The "All-in-One" approach):
`tar` can archive and compress at the same time:
* `tar` + **Gzip** = `.tgz` or `.tar.gz`
* `tar` + **Bzip2** = `.tbz`, `.tbz2`, or `.tar.bz2`
* `tar` + **XZ** = `.txz` or `.tar.xz`

---

## 3. Shell Productivity Tip
* **TAB Completion:** Always press the **TAB** key on the shell. It will auto-complete filenames and commands, saving time and preventing typos.
