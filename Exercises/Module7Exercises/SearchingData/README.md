## Exercises Performed

### 1. Basic and Extended Grep
* **Line Numbering:** Used `grep -n 'melon' fruitstand.txt` to find matches along with their specific line numbers in the file.
* **Extended Regex (`-E`):** Used the `-E` flag to enable advanced operators like `|` (OR) and `{}` (quantifiers).
    * *Example:* `grep -E 'is|or|go' fruitstand.txt` to find lines containing any of those three strings.

### 2. Regex Pattern Matching
I practiced various Regex anchors and character classes:
* **Character Sets:** `grep -E '[aeiou]{2,}'` to find lines with at least two consecutive vowels.
* **Wildcard inside file:** `grep -E '2.+'` to find lines starting with '2' followed by any other characters.
* **Anchors:** * `grep -E '2$'`: Finds lines that end specifically with the character '2'.
    * `grep -E '^[^FLT]'`: A complex one! Finds lines that **do not** start with the letters F, L, or T.

### 3. Combining Redirection and Pipes
* **Fixing the Pipe:** I practiced sending filtered results into new files using `grep -E ... > piping.txt`.
* **Appending results:** Used `>>` to add new filtered data to the end of `piping.txt` without deleting previous work.

## Key Observations
* **Regex vs Wildcards:** Confirmed that Regex is much more surgical for searching *inside* a file compared to standard shell wildcards.
* **The Importance of Quotes:** Using single quotes `'` around Regex patterns is vital to prevent the shell from misinterpreting special characters like `$` or `*`.
