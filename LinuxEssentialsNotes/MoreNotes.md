# More Notes From LPI

# Open Source Software and Licensing

Understanding licensing is crucial for the Linux Essentials exam. You must know the difference between Copyleft (strict) and Permissive licenses.

## 1. FOSS vs. OSS
* **FOSS (Free and Open Source Software):** Focuses on the "freedom" of the user to run, copy, distribute, study, change, and improve the software. ("Free as in speech, not as in beer").
* **OSS (Open Source Software):** Focuses on the practical benefits of sharing the source code.

## 2. Copyleft Licenses (Strict)
If you modify and distribute software under a Copyleft license, you **must** release your modified source code under the exact same license.
* **GPLv2 (GNU General Public License version 2):** Used by the Linux Kernel. Very strict.
* **GPLv3:** An updated version that includes protections against hardware restrictions (Tivoization) and patent claims.

## 3. Permissive Licenses (Lenient)
These allow you to modify the code, use it in closed-source proprietary software, and you are **not** forced to share your modifications.
* **MIT License:** Extremely short and permissive. Do whatever you want, just include the original copyright notice.
* **BSD License:** Similar to MIT. (Common in networking tools and macOS core).

## 4. Creative Commons (CC)
Used for **content** (videos, audio, text, images, documentation), *not* for software code.
* **CC BY (Attribution):** You can use it, but must credit the author.
* **CC NC (Non-Commercial):** You cannot make money from it.
* **CC ND (No Derivatives):** You can share it, but cannot alter it.
* **CC SA (Share-Alike):** Similar to copyleft; derivative works must use the same license.

## 5. Business Models in Open Source
How do companies make money if the software is free?
* **Red Hat / SUSE:** They give the OS for free (CentOS/Fedora or openSUSE), but sell **Enterprise Support, Training, and Certification** (RHEL, SUSE Enterprise).

---

# The Linux Filesystem Hierarchy Standard (FHS)

Linux organizes files in a single inverted tree structure, starting from the root directory (`/`).

## Core Directories and Their Purpose
* `/` **(Root):** The top of the filesystem. Everything starts here. (Do not confuse with the root user).
* `/bin` **(Binaries):** Essential user command executables (e.g., `ls`, `cp`, `cat`). Available to all users.
* `/sbin` **(System Binaries):** Essential administrative commands (e.g., `fdisk`, `reboot`). Usually restricted to the root user.
* `/etc` **(Etcetera):** System-wide **configuration files** (e.g., `/etc/passwd`, `/etc/fstab`). No executable programs are here.
* `/var` **(Variable):** Data that changes frequently. Crucial for system admins.
    * `/var/log`: System and application logs.
    * `/var/spool`: Print queues and mail.
* `/home`: Personal directories for normal users (e.g., `/home/davide`).
* `/root`: The personal home directory for the root user.
* `/tmp` **(Temporary):** Temporary files created by programs. Automatically cleared upon reboot. Everyone has write access, but it uses the **Sticky Bit**.
* `/dev` **(Devices):** Contains special device files representing hardware (e.g., `/dev/sda` for the hard drive, `/dev/null` for the black hole).
* `/usr` **(User System Resources):** Secondary hierarchy for read-only user data and programs not strictly required for booting.
* `/boot`: Contains the Linux kernel, the bootloader (GRUB), and initial RAM disk (initramfs).
* `/opt` **(Optional):** Used for installing third-party proprietary add-on software.

---

# Searching for Files

Linux provides different tools to find files, each with a specific behavior.

## 1. `locate` (Fast, Database-driven)
* Searches an internal database, so it is extremely fast.
* **Drawback:** It won't find files created 5 minutes ago.
* You must update its database manually (or wait for the daily cron job) using the command: `sudo updatedb`.

## 2. `find` (Slow, Real-time, Powerful)
* Searches the actual live filesystem starting from a specific directory.
* Can search by name, size, owner, permissions, and modification time.
* **Examples:**
    * `find /etc -name "passwd"` (Searches for a file named passwd inside /etc).
    * `find /var/log -size +10M` (Finds files larger than 10 Megabytes).
    * `find / -user davide` (Finds all files owned by user davide).

## 3. `whereis` vs. `which` vs. `type`
* `which <command>`: Shows the exact path of the executable that will run if you type the command (e.g., `/usr/bin/python3`).
* `whereis <command>`: Shows the executable path, the source code path, and the manual page path.
* `type <command>`: Tells you if a command is a built-in shell command, an alias, or a binary file.

---

# Exam Cheat Sheet: Essential Commands

## File Viewing
* `cat`: Displays the entire file content at once.
* `less`: Views file content page by page (allows scrolling backward).
* `head -n 10`: Shows the first 10 lines of a file.
* `tail -n 10`: Shows the last 10 lines.
* `tail -f`: Follows a file in real-time (essential for reading live logs in `/var/log`).

## Archiving and Compression
Linux usually bundles files first (`tar`), then compresses the bundle (`gzip`, `bzip2`, `xz`).
* `tar -cvf archive.tar folder/`: **C**reates an archive.
* `tar -xvf archive.tar`: e**X**tracts an archive.
* Compression tools (from fastest/least compressed to slowest/most compressed):
    1. `gzip` (.gz) -> Unzip with `gunzip`
    2. `bzip2` (.bz2) -> Unzip with `bunzip2`
    3. `xz` (.xz) -> Unzip with `unxz`
* *Exam Trick:* `tar -czvf` creates AND zips the file in one command.

## Processes & Resources
* `top`: Real-time dynamic view of running processes (CPU/RAM usage).
* `ps aux`: Static snapshot of all running processes.
* `free -m`: Shows available and used RAM in Megabytes.
* `kill <PID>`: Sends a signal to stop a specific Process ID.
* `killall <name>`: Kills all processes with a specific name (e.g., `killall firefox`).

## Networking Basics
* `ping -c 4 <ip>`: Checks connectivity by sending 4 packets.
* `ip a`: Shows IP addresses assigned to network interfaces (replaces the old `ifconfig`).
* `ip r`: Shows the routing table (Default Gateway).
* `dig <domain>` or `host <domain>`: Resolves a domain name (like google.com) to an IP address (DNS).

---

# Bash Quoting and Exit Status

## 1. Quoting in Bash
Linux uses different types of quotes to determine how text and variables are interpreted by the shell.

* **Single Quotes (` ' ' `): Strict Literal**
  Everything inside single quotes is treated exactly as written. No variables are expanded.
  * *Example:* `echo 'My user is $USER'`
  * *Output:* `My user is $USER`

* **Double Quotes (` " " `): Variable Expansion**
  Variables inside double quotes are evaluated and replaced with their actual values.
  * *Example:* `echo "My user is $USER"`
  * *Output:* `My user is davide` *(Assuming 'davide' is the logged-in user)*

* **Backticks (`` ` ` ``) or `$()`: Command Substitution**
  Executes the command inside and returns its output as a string. Both methods do the same thing, but `$()` is the modern and preferred standard.
  * *Example:* `echo "Today is $(date)"` or `echo "Today is \`date\`"`
  * *Output:* `Today is Wed Apr 22 11:40:23 WEST 2026`

## 2. The Exit Status (`$?`)
Every time a command finishes executing in Linux, it leaves behind an invisible "exit code" (or return code) that tells the system if it was successful or if it failed.

* You can view the exit status of the *very last* command run by typing:
  > `echo $?`

* **Status `0` (Zero):**
  Means **SUCCESS**. The command executed perfectly without any errors.
 
* **Status `> 0` (Non-Zero):**
  Means **FAILURE**. An error occurred. Different numbers mean different errors (e.g., `1` is a general error, `127` usually means "command not found").

---


