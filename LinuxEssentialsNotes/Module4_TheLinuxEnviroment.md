### Linux Desktop Environment (DE)
The "look and feel" of a Linux system depends on the Desktop Environment.
- **Core vs. UI:** The Kernel (core) handles hardware communication, while the DE handles the user interface.
- **Resource Management:** CLI (Command Line Interface) is the most efficient way to save system resources. However, for a graphical experience, we use a **GUI (Graphical User Interface)**.
- **Modularity:** Unlike Windows and macOS, where the desktop is inseparable from the OS, Linux is **modular**. You can choose your DE based on preference or hardware performance:
    - **GNOME / Unity:** Modern and feature-rich (standard on Ubuntu).
    - **KDE Plasma:** Highly customizable.
    - **XFCE / LXDE:** Lightweight, ideal for older hardware.

### Personalization
Every Linux OS can be personalized through specific settings and the modular nature of its components.

---

### What is the Shell?
The **Shell** is a program that takes commands from the keyboard and gives them to the **Kernel** to execute.
- **BASH (Bourne Again Shell):** The default shell on most Linux distributions. It acts as the command processor within the CLI.
- **Other Shells:** KSH (Korn Shell), TCSH, ZSH.
- **Terminals (Emulators):** GNOME-terminal, xterm, rxvt, Konsole.
- **Shortcut:** `Ctrl + Alt + T` is the standard shortcut to open the terminal.

### Essential Commands
- `ls`: List files and directories in the current folder.
- `cd <directory>`: Change directory.
- `mv <source> <destination>`: Move or rename files/directories.
- `man <command>`: Open the manual/documentation for a specific command.
- `mkdir <name>`: Create a new directory.
- `rmdir <name>`: Remove an **empty** directory.
- `touch <filename.ext>`: Create a new **empty** file.
- `rm <file>` or `rm -r <directory>`: Remove files or non-empty directories.
- `locate <search_term>`: Search for files in the system.
- `clear`: Clear the terminal screen.

---

### Software and Package Management
Most Linux distros come with pre-installed software, but you can manage additional software through **Repositories**.
- **Package:** A compressed file archive containing the app, configurations, and instructions.
- **Dependencies:** Prerequisites required to install a package.
- **Package Managers:** Tools that automate the process of installing, upgrading, and removing software while handling dependencies.
    - **Debian-based (.deb):** `dpkg`, `apt-get`, `apt`.
    - **Red Hat-based (.rpm):** `rpm`, `yum`, `dnf`.
    - **Arch-based: (.tar)** `pacman`.

