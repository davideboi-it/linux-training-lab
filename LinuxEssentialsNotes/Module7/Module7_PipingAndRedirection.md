This module covers the essential tools for data manipulation, stream redirection, and basic data analysis in the Linux command line.

## 1. Command Line Piping (`|`)
The pipe operator takes the standard output (stdout) of one command and sends it as standard input (stdin) to another.
* **Core Pagers:**
    * `less`: Modern pager that allows bidirectional scrolling (up and down).
    * `more`: Legacy pager, scrolls forward only.
    * `pg`: An older paging utility, similar to `more` but less common in modern distros.

## 2. Searching with `grep`
The `grep` command searches for specific patterns within files or command output.
* **Syntax:** `grep [options] [pattern] [filename]`
* **Example:** `ls /etc | grep "net"` (Finds all files in /etc containing "net").

## 3. Input and Output Redirection
Redirection allows you to change where data comes from and where it goes.

| Symbol | Action | Description |
| :--- | :--- | :--- |
| `>` | **Redirect Output** | Writes output to a file (Overwrites if file exists). |
| `>>` | **Append Output** | Adds output to the end of an existing file. |
| `2>` | **Redirect Error** | Captures only the Standard Error (stderr) to a file. |
| `2>>` | **Append Error** | Appends error messages to a file. |
| `&>` | **Redirect All** | Sends both stdout and stderr to the same file. |
| `<` | **Input Redirection** | Feeds a file's content into a command. |
| `<<` | **Here Document** | Reads input from the CLI until a specific delimiter is met. |


## 4. The "Black Hole": `/dev/null`
Data sent to `/dev/null` is discarded by the system.
* **Use case:** Use `2> /dev/null` to hide error messages from your terminal output.

## 5. Data Extraction and Analysis Tools
* **`wc` (Word Count):** Counts lines (`-l`), words (`-w`), or bytes (`-c`).
* **`head`:** Displays the first few lines of a file (default: 10).
* **`tail`:** Displays the last few lines of a file.
    * `tail -f`: Follows the file in real-time (essential for monitoring logs).
* **`xargs`:** Reads items from standard input and uses them as arguments for other commands.
