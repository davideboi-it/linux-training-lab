# Module 7 - Part 1: Redirection and Data Processing Labs

## Exercises Performed

### 1. Output Redirection (`>` and `>>`)
* **Standard Output:** I practiced saving the directory listing into a file using `ls > myoutput`.
* **Appending Data:** I used `wc -l myoutput >> myoutput` to count the lines and append the result to the end of the same file without overwriting it.

### 2. Input Redirection (`<`)
* Used `wc -l < myoutput` to feed the file content directly into the word count command.
* Practiced complex redirection like `wc -l < myoutput > bob`, which reads from one file and saves the count into another.

### 3. Error Handling and Advanced Streams (`2>` and `2>&1`)
* **Redirecting Errors:** I tested `ls video.mpeg buuu 2> errors.txt`. Since "buuu" does not exist, the error message was successfully captured in `errors.txt`.
* **Merging Streams:** I experimented with `2>&1` to merge Standard Error into Standard Output, ensuring all command results (successes and failures) are sent to the same destination.

### 4. Surgical Filtering with Pipes
* Practiced complex piping: `ls | head -5 | tail -1 > firstfile`.
* **Logic:** This command lists files, takes the first 5, then isolates the last one of that subset, and saves it.

## Key Observations
* **File Overwriting:** confirmed that `>` wipes the file, while `>>` preserves existing data.
* **Standard Error:** Learned that `2>` is essential for logging system errors without cluttering the main output.
* **Syntax Precision:** Encountered and fixed Bash syntax errors regarding the placement of redirection tokens like `&`.
