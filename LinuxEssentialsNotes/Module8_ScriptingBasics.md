# Module 8 : Scripting baics

## 1 Text Files and Editors
Configuration files and shell scripts are typically **text files**. In order to elaborate a `.txt` file, you need an editor like **Pico**, **Nano**, or **Vi**, which lets you edit documents stored in plain-text format.

The `.txt` files include:
* Human language files
* Programming language files
* Formatted text files
* Program and system configuration files
* Log files

### Comparison of Editors
| Editor | Characteristics |
| :--- | :--- |
| **Vi** | Usually already installed; more difficult to use. |
| **Emacs** | Really well furnished, but not all distros have it pre-installed. |
| **Pico** | Few functions (simpler version of Emacs); very light. |
| **Nano** | Similar to Pico but with more functions. |

> **Note:** Usually, none of them have "Autosave" like Microsoft Word.

### Vi Editor
* Originates from the '70s and '80s.
* A `~` symbol means a line is empty.
* You must enter **Insert Mode** by pressing `i`.
* After putting text, you have to press `ESC` in order to use arrows to move via editor.

### Shortcuts & Navigation
* `^`: Go to the beginning of a line.
* `3w`: Go to the 3rd word of a row.
* `2b`: Go back 2 words.
* `1G`: Move to the first line.
* `:set nu`: Show line numbers.
* `u`: (In Edit Mode) Undo the last operation.

### Saving and Quitting
* `:w`: Save.
* `:wq`: Save and Quit.
* `:q!`: Quit without saving.

### Nano Editor
* Much simpler than Vi.
* Info and operations are displayed at the bottom.
* Commands use `CTRL + [Button]`.
* Supports Copy-Paste.

---

## 2 Shell Scripting Fundamentals
A script is an **interpreted language**, typically associated with a Shell or a compiled program. The main use is letting the PC perform repetitive or complex tasks.

### The Shebang (`#!`)
A Bash script is a text file that starts with:
`#!/bin/bash`
* `#!`: Tells Linux that it is a script.
* `/bin/bash`: Defines which program has to run the script.
* `/bin/sh`: Usually a symbolic link that points to a specific shell.

### Execution & Commands
* **Permissions:** In order to execute a script, you must change the file permissions using the `chmod` command.
* **GUI Editors:** You can use `kwrite` or `gedit` if you have a GUI.
* **External Commands:** Most commands entered into a shell prompt are external.
* **Internal Commands:** Commands executed inside a program that will call the program itself.

### Scripting Best Practices
* Use **absolute paths** instead of relative paths; if you move the script, the command might stop working.
* The `&` allows you to launch multiple programs within one script without waiting for the previous instruction to end (background execution).

---

## 3 Variables and Arguments
Variables and arguments are used to expand the use of a script. A **Variable** is a placeholder for a value determined when the script runs. It can be:
1.  Passed as parameters to a script.
2.  Generated internally to a script.
3.  Extracted from a script's environment.

**Environment:** Can be a group of variables, position of directory, the actual one.

### Arguments (Parameters)
Represented by:
* `$0`: Name of the script.
* `$1`: First parameter (and so on...).
* `$VAR`: A variable is usually identified by `$` followed by a name.
* Variables can be the result of a command.

---

## 4 Conditional Expressions
Enable a script to perform one of several actions relying on a particular condition or value of a variable (`if` command).

### Logical Operators
* `&&`: AND
* `||`: OR

### Syntax
`If (condition)`
`then`
    `(operation)`
`else`
    `(operation on false)`
`fi (end of condition)`

### Case Statement
If you need more cases, you can nest the **if/then/else clauses**, but is better to use case / esac:

`case $VAR in`
    `pattern1)`
        `'command1' ;;`
    `pattern2)`
        `'command2' ;;`
`esac`

### Loops and Functions
Loops tell to the script to perform the same task repeatedly.

* **SEQ**: Generates a list of numbers starting from its first argument and continuing to its last one.

`seq 1 10`: Increase 1 to 10 (ending).

`seq 1 2 10`: Start from 1, increase by 2, until 10.

* **WHILE**: Executes for as long as its condition is true.

`while (condition)`
`do`
    `'commands'`
`done`

* **UNTIL**: Similar to while but it will execute until true (runs while false).

### Functions
Used to do specific tasks and help to create modular script.

`function MYFC() {`
    `'commands'`
`}`
Note: Sometimes keyword function may optionally precede the function names.

### Exit Part (Value)
A script's return value is the same as the last command the script called.

`exit` causes immediately to close the script ($?).

An exit value can be from 0 to 255 (to show code error of a script).

---
