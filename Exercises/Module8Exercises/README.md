# Module 8 - Lab: Shell Scripting Practice

This repository contains various scripts developed to automate tasks and master conditional logic in a Linux environment. 

## Scripts Developed

### 1. Directory Listing Script (`directorylist.sh`)
A simple automation script to display folder contents.
* **Goal:** Automate the `ls` command within a script.
* **Functionality:** When executed, it provides a clean listing of the current working directory.
* **Key Learning:** Understanding how shell scripts execute standard commands in a subshell environment.

### 2. Backup Automation Script (`backup.sh`)
A script designed to handle file preservation.
* **Goal:** Create copies of important files/directories.
* **Functionality:** Uses `cp` logic to move data to a designated backup location.
* **Key Learning:** Understanding how to do a back up and how to add the date of it

### 3. Conditional Logic Script (`logic.sh`)
The most complex script of this session, focusing on decision-making.
* **Goal:** Create a script that behaves differently based on user input (arguments).
* **The Logic:**
    * If argument is `1`: Acknowledges the specific input.
    * If argument is `2`: Acknowledges the second option.
    * Else: Provides a "Catch-all" response for any other input.
    * Control if there is any input when launching the script

## Debugging & Troubleshooting

During the development of `logic.sh`, I encountered and resolved several common Bash pitfalls:

* **Syntax Spacing:** Adjusted spaces inside `[]` in order to read properly the infos inside of it
* **Unclosed Quotes:** Resolved "unexpected EOF" errors by ensuring every opening quote `'` had a matching closing quote.

## How to Run These Scripts
1. **Set Permissions:**
 	chmod +x logic.sh
2. **Execute**
	./logic.sh `input`
