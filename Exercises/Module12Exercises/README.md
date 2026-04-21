# Lab Practice: Linux File Ownership and Permissions

This README shows the practical terminal exercises performed to learn file ownership (`chown`) and permissions (`chmod`), including troubleshooting common access errors.

## 1. Modifying File and Directory Ownership
Practiced changing the owner and the group of files and directories using `chown`.

* **Check Initial State:** Used `ls -la` to verify that `file1.txt`, `file2.txt`, and `dir` were initially owned by user `boi` and group `boi`.
* **Change User Owner:** Assigned ownership of a file to another user.
> sudo chown second file1.txt

* **Change User and Group Owner:** Changed the owner to `boi` and the group to `second` for a directory.
> sudo chown boi:second dir

* **Verification:** Used `ls -la` to confirm that `file1.txt` is now owned by `second`, and `dir` is owned by `boi` and group `second`.

---

## 2. Modifying Permissions (chmod) and Troubleshooting
Practiced changing file permissions using octal notation and encountered standard system security protections.

* **Permission Denied Error:** Attempted to grant full permissions to `file1.txt`.
> chmod 777 file1.txt
*Observation: The system returned `Operation not permitted`. This occurred because the current user (`boi`) is no longer the owner of `file1.txt` (it is now owned by `second`), and the command was run without `sudo`.*

* **Successful Octal Permission Change:** Granted full permissions to a file still owned by the current user.
> chmod 777 file2.txt
*Observation: `ls -la` confirmed the permissions changed to `-rwxrwxrwx`.*

* **Syntax Error Check:** Attempted to use the output string format directly as an input.
> chmod rw-rw-r-- file2.txt
*Observation: Returned `invalid mode`. To set permissions this way, either octal numbers (e.g., 644) or proper symbolic notation (e.g., u=rw,g=rw,o=r) must be used.*

* **Setting Specific Octal Permissions:**
> chmod 642 file2.txt
*Observation: `ls -la` confirmed the file permissions changed exactly to `-rw-r---w-`.*

---

## 3. Applying Special Permissions
Practiced setting advanced security bits using the 4-digit octal format.

* **Setting the Sticky Bit:**
> chmod 1644 file2.txt

* **Verification & Observation:**
> ls -la
*The permission string for `file2.txt` changed to `-rw-r--r-T`. The capital `T` at the end indicates that the Sticky Bit is set, but the underlying execute (`x`) permission for "others" is not present (if it were, it would be a lowercase `t`).*

---
