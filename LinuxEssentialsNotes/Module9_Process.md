# Module 9: Process Data & Package Management

## 1 Package Management Fundamentals
Package Management involves the lifecycle of software: **installing**, **uninstalling**, and **updating**.

* **Processes**: A program in execution is called a **process**.
* **Log Files**: Plaintext files located in `/var/log` that record the operations and errors of running programs (daemons).
* **Package Characteristics**:
    1.  Each package is a **single compressed file** (e.g., .deb, .rpm).
    2.  **Dependencies**: Packages often rely on other software libraries to function.
    3.  **Metadata**: Packages contain info on dependencies, versioning, and target **Architecture** (e.g., x86_64, ARM).
    4.  **Binary vs Source**: Binary packages are pre-compiled for specific CPUs, while source packages must be built manually.

---

## 2 Package Managers & Repositories
Modern Linux uses **Repositories** (online servers) to automate software installation, solving the "dependency hell" of manual downloads.

### The Installation Workflow:
1.  **Command**: User issues an install command (requires **Root/sudo** access).
2.  **Dependency Resolution**: The manager automatically identifies and fetches required libraries.
3.  **Download & Check**: Packages are downloaded and verified.
4.  **Execution**: The manager extracts files to system directories (like `/usr/bin`).

> **Note**: Always use **Native Packages** (e.g., `.deb` for Debian/Ubuntu, `.rpm` for Fedora) to ensure system stability.

---

## 3 Command Reference (DNF vs APT)

### DNF (Fedora, RHEL, CentOS)
* `dnf check-update`: Checks for available updates without installing.
* `sudo dnf upgrade`: Downloads and installs all available updates.
* `dnf search <name>`: Searches the repositories for a package.
* `sudo dnf install <name>`: Installs a package and its dependencies.
* `sudo dnf remove`: Uninstalls a package (similar to `erase`).

### APT (Debian, Ubuntu, Linux Mint)
* `sudo apt update`: **Crucial**: Refreshes the local index of available packages (does NOT install updates).
* `sudo apt upgrade`: Actually installs the newer versions of software found by `update`.
* `sudo apt full-upgrade`: Advanced version that handles changing dependencies.
* `sudo apt autoremove`: Cleans up orphan dependencies no longer needed.
* `sudo apt purge`: Removes a program **plus** its configuration files.

---

## 4 Process Hierarchy & Memory
Linux organizes processes in a **Tree Hierarchy**.

### Process Identification
* **PID 1**: The first process started by the Kernel. Historically `/sbin/init`, now typically **systemd** on modern distros.
* **Parent/Child**: Every process (except PID 1) is launched by a Parent (**PPID**).

### Process Identification
Each process has its own **PID** (Process ID) and it starts always with **'1'**.
Each process has also its **PPID** (Parent Process ID) pointing back to the parent.

### How to identify them?
Using commands `ps`, `top` or `free`.

* **ps**: Showing you a process list (`ps ax` or `ps aux`).
    * You can pipe it with `grep` to receive info of a specific process.
    * `ps` can only provide info in a specific time (snapshot).
* **top**: An interactive version of `ps` (similar to Task Manager on Windows).
    * It is like using `ps` multiple times; it gives you a **CPU load average**.
    * While using `top`, if you click the **'m'** key, it will give you the memory used.
* **Memory Leak**: A program with a memory leak can consume increasing amounts of memory (bug).

---

## 5 Memory Status
* **free**: Generates a detailed report on the computer's total memory status.
    * **Mem**: This line reveals total RAM stats.
    * **Buffer/Cache**: Lines showing the RAM used by the programs/system.
* **Swap**: Line that reveals how much swap space Linux is using (disk space set aside as an adjunct to memory).
    * Means that when RAM is full, it will use an allocated part of the HD as virtual memory.
    * **Performance Issue**: Swap is much more slow, so performance issues occur.

---

## 6 Log Files
Many programs running in the background are called **Daemons** and they write info of the operation inside a log file. Most of the log files are inside `/var/log`.

### Common Log Files:
* **boot.log**: Summarizes services and process info during boot.
* **cups/**: Directory for the printing system of Linux.
* **gdm/**: Directory of Gnome Display Manager.
* **messages** or **syslog**: General purpose log of daemons.
* **secure**: Security related messages (like `sudo` usage).
* **Xorg.0.log**: Info of X Window System (for GUI).

> **Log Rotation**: Log files are frequently rotated, meaning old ones are going to be erased or archived. Otherwise, they can fill your storage/memory. They are usually plaintext files.

---

## 7 Kernel Ring Buffer (KRB)
* **klog / klogd**: Handles logging messages from the kernel separately from ordinary programs.
* **syslog config**: Usually ending with `.conf` like `/etc/rsyslog.conf`.
* **System Messaging**: Technique wherein a log daemon accepts messages from other processes.

### Kernel Ring Buffer Details
Similar to a log but inside the **RAM** and not the HD.
* Check it with the command: `dmesg`.
    * Use `dmesg | less` to see one page at a time.
    * Use `dmesg | grep` for specific strings.
* Kernel buffer messages are invaluable in diagnosing hardware and driver problems.

**Storage and Copy:**
* Some distros put a copy of KRB inside `/var/log/dmesg`.
* Some distros don't create a buffer at boot, so you can do it manually in `/etc/rc.d/rc.local`.
* To make a copy of KRB manually: `dmesg > /var/log/dmesg`.
