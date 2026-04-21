# Module 11 - Users and Groups

## 1. Concepts
* **Groups:** A collection of users that can be assigned specific tasks and permissions.
* **Root:** The "Superuser" with full administrative power on the system.
* **User Accounts:** Used to track who is using system resources and to allow secure file sharing between users.

---

## 2. Main Configuration Files

### /etc/passwd
This file stores essential user account information. It is a **colon-separated** (not comma) text file.
Each line contains 7 fields:
1.  **Username**
2.  **Password:** Usually an `x`, meaning the encrypted password is stored in `/etc/shadow`.
3.  **UID (User ID):** Root always has UID `0`.
4.  **GID (Group ID):** The ID of the user's primary group.
5.  **Comment Field:** Usually contains the user's full name or contact info.
6.  **Home Directory:** The path to the user's personal folder (e.g., `/home/username`).
7.  **Default Shell:** The command interpreter for the user (usually `/bin/bash`).

### /etc/shadow
Contains encrypted passwords and account expiration information. **Accessible only by Root.**
It uses a **Salted Hash** (mathematical functions) to hide passwords from humans.
Fields include:
1.  **Username**
2.  **Hashed Password:** If you see `*` or `!`, the account is locked/disabled.
3.  **Last Password Change:** Number of days since Jan 1, 1970 (Epoch).
4.  **Min Days:** Minimum days required between password changes.
5.  **Max Days:** Maximum days after which a password change is required.
6.  **Warn Days:** Days of warning before the password expires.
7.  **Inactivity Days:** Days between password expiration and account deactivation.
8.  **Expiration Date:** Date when the account will be disabled.
9.  **Special Flag:** Reserved for future use.

### /etc/group
Defines the groups available on the system.
Fields include:
1.  **Group Name**
2.  **Group Password:** Usually empty or `x`.
3.  **GID:** Group ID.
4.  **User List:** Secondary users belonging to this group (comma-separated).

---

## 3. User Identification Commands
* `whoami`: Tells you the current username.
* `id`: Shows UID, GID, and the names of the groups the user belongs to.
* `id <username>`: Shows the ID information for a specific user.
* **Multi-user Access:** Users can access the system via **SSH** (Secure Shell) for remote access or **V-T** (Virtual Terminals) locally.
* `who`: Shows who is currently logged in (Username, Terminal, Login date/time, Remote Host).
* `w`: A more verbose version of `who`. Shows idle time, JCPU (total CPU time used by all processes on that terminal), and what command they are currently running.

---

## 4. User & Group Management Commands
*Note: Most of these require `sudo` privileges.*

### User Management
* `sudo adduser <username>`: Interactive command to create a user, their home directory (copying files from `/etc/skel`), and setting their password.
* `sudo useradd <username>`: Low-level command to create a user (requires more manual options).
* `sudo passwd <username>`: Set or change a user's password.
* `sudo passwd -S <username>`: Shows the status of the user's password.
* `sudo chage -l <username>`: Lists password aging information in a human-readable format.
* `sudo usermod -l <new_name> <old_name>`: Changes the username.
* `sudo userdel -r <username>`: Deletes the user and their home directory.

### Group Management
* `sudo groupadd <groupname>`: Creates a new group.
* `sudo usermod -aG <groupname> <username>`: Adds an existing user to a specific group (**-a** for append, **-G** for secondary group).
* `sudo groupmod -n <new_name> <old_name>`: Changes the name of a group.

### System Logs
* **Authentication Logs:** The system keeps track of user creation, logins, and deletions in `/var/log/auth.log` (on Debian/Ubuntu systems).

---

## 5. Root Privileges (Superuser)
The Root user is the most powerful account. You need root access to install software, modify system files, or manage users.

### 3 Ways to Gain Root Access:
1.  **Login as Root:** Often disabled by default for security on many distributions.
2.  **`su` command:** Switches the current shell to Root (requires the Root password). Use `exit` to return to your user.
3.  **`sudo` command:** Allows an authorized user to run a specific command with root privileges. This is generally **safer** than using `su`.

### Security Precautions:
* Always verify a command before running it as root.
* Never run suspicious programs/scripts with `sudo`.
* Avoid leaving a root shell unattended.
* **Never share the Root password.**

---
