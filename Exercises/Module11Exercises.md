# Lab Practice: Linux User and Group Management

This document shows the practical terminal exercises performed to learn the user creation, modification, group management, and system auditing.

## 1. Interactive User Creation
Created a new user using the interactive `adduser` tool, which automatically handles the home directory and primary group.

> sudo adduser test1

* **UID/GID Assigned:** 1001
* **GECOS Information Set:** * Full Name: Bip
  * Room Number: Room One
  * Work Phone: 222
  * Home Phone: 111
  * Other: CEO
* **Verification:** Confirmed creation using `grep '^test' /etc/passwd`.

---

## 2. Password Aging Configuration
Configured password expiration policies for the new user using `chage`.

> sudo chage test1

* **Minimum Password Age:** 60 days
* **Maximum Password Age:** 90 days
* **Warning Period:** 7 days

---

## 3. Account Modification & Deletion
Practiced renaming user accounts, updating groups, and safely deleting users.

* **Rename Username:** Changed login name from `test1` to `test`.
> sudo usermod -l test test1

* **Check Home Directory:** Verified that renaming the user does not automatically rename the home directory folder.
> ls -ld /home/test1

* **Rename Primary Group:** Changed the group name to match the new username.
> sudo groupmod -n test test1

* **Delete User:** Removed the user and recursively deleted their home directory and mail spool.
> sudo userdel -r test

---

## 4. Advanced Group Management
Practiced low-level user creation and managing secondary groups.

* **Low-Level User Creation:** Created a new user with a home directory and password flag.
> sudo useradd -m GroupTest -p xxx

* **Create Multiple Groups:**
> sudo groupadd Group11
> sudo groupadd Group12
> sudo groupadd Group13

* **Add User to Secondary Group:** Used the append flag (`-a`) to add the user to `Group12` without losing existing memberships.
> sudo usermod -a -G Group12 GroupTest

* **Rename and Delete Groups:**
> sudo groupmod -n Group111 Group11
> sudo groupdel Group111
> sudo groupdel Group13

---

## 5. System Auditing
Verified administrative actions by reading the authentication logs.

> tail -15 /var/log/auth.log

*Observation: The logs confirmed the execution of `groupmod`, `userdel`, and the subsequent automated updates to `/etc/group` and `/etc/gshadow`.*

---
