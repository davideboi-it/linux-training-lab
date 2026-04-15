### Anatomy of an Operation
Any operation on a PC follows a three-step process:
1. **Input:** The user performs an action.
2. **Command:** Input is sent via mouse or keyboard.
3. **Execute:** The system performs the task.

### Command Syntax
A command is a sequence of characters ending with the **Enter** key. It is evaluated by the shell (Bash shows your username, directory, and the `$` dollar sign prompt). 
To make the shell understand your input, you must follow a specific syntax:

`Command Name` + `Space` + `Options` + `Arguments`

- **Options:** Modify how a command behaves. Usually preceded by a single dash `-` (short options) or two dashes `--` (long options).
- **Arguments:** Parameters that the command acts upon (e.g., a file name or path).

### Automation and Scripting
The PC and Shell are designed to simplify repetitive tasks for the user.
- **Scripts:** A file containing a series of commands to automate tasks.
- **Variables:** Areas of memory used to store information, referred to by a name. 
    - Using variables makes code more readable and flexible.
    - In Bash, a variable is assigned without spaces and accessed using the `$` sign (e.g., `$NAME`).

### Variable Rules
To ensure the shell correctly interprets your data, follow these naming conventions:
- **Starting Character:** Variable names must always start with a letter.
- **Spaces:** Do NOT use spaces within a name. Use underscores `_` or dashes `-` for readability (e.g., `MY_VARIABLE`).
- **Punctuation:** No punctuation marks or special symbols are allowed in the name.
- **Environment Variables:** Use the `printenv` command to see all active environment variables in your current session.

### Shell Meta-Characters
Meta-characters are symbols that have a special meaning to the shell rather than being treated as simple text.
- **Common Meta-characters:** `Space` (syntax divider), `$`, `*`, `;`, `>`, `?`, `&`, `|`.

### Quoting and Escaping
**Quoting** is the act of protecting shell meta-characters from being interpreted specially by the shell. It allows you to treat special characters as normal text.

**Methods:**
1. **Double Quotes `" "`:** Protects most symbols but **permits variable expansion** (the shell will still read `$VARIABLE`).
2. **Single Quotes `' '`:** Protects everything. All characters inside are treated as **literal text**.
3. **Backslash `\`:** Used for a **single character escape**. It cancels the special meaning of the character immediately following it.

---

### Navigation and Manuals
- **Home Directory:** The tilde symbol `~` represents the current user's home directory.
- **Manual Pages (`man`):** A built-in documentation system.
- **Keyword Search:** If you don't know the exact command, use `man -k <keyword>` to search through the manual summaries.

### Command Variations
Commands in Linux often have two versions to balance readability and speed:
- **Long-hand:** Human-friendly and easier to memorize (e.g., `--directory`).
- **Short-hand:** Faster to type during active terminal sessions (e.g., `-d`).

### Documentation and Info
Beyond `man` pages, you can use the `info` command for more detailed documentation.
- **Navigation in `info`:** - `P`: Previous page.
    - `N`: Next page.
    - `Q`: Quit the documentation.
