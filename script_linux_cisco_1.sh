#BLOCK 1
# General Syntax: command [options] [arguments]
# command: The action (ls = list)
# [options]: Flags that modify the output (usually start with -)
# [arguments]: The target (files or directories)

# Basic listing of a specific directory
ls Documents

# Options (Flags):
# -l (long) = Displays detailed information (permissions, owner, size, date).
ls -l 

# -r (reverse) = Reverses the sorting order (usually alphabetical).
ls -r 

# Combining Options:
# I can write them separately or join them under a single dash.
ls -l -r
ls -rl
ls -lr
# All three commands do exactly the same: a detailed list in reverse order.

#BLOCK 2
# In order to execute the 'aptitude' commands from the course, 
# the package must be installed first.

# Update the package list
sudo apt update

# Install aptitude (using -y to automatically say "yes" to prompts)
sudo apt install aptitude -y

# Exploring the "moo" Easter Egg:
# aptitude moo        -> The program denies there is an Easter Egg.
# aptitude -v moo     -> '-v' (verbose) Increases the detail of the response.
# aptitude -vv moo    -> The program asks you to stop.
# aptitude -vvv moo   -> The program gets annoyed.

#BLOCK 3
# pwd (Print Working Directory) = Shows your current location.
pwd

# cd (Change Directory) = Moves you to a different folder.
cd [options] [path]

# --- PATH TYPES ---

# Absolute Path: Always starts from the root (/). 
# It works no matter where you are currently located.
cd /home/sysadmin

# Relative Path: Starts from your current directory (does NOT start with /).
# To go to 'Art' inside 'School' while being in 'Documents':
cd School/Art

# You can also do it step by step:
cd School
cd Art

# --- SPECIAL CHARACTERS ---

# .. (Double dot) = Represents the parent directory (one level up).
cd ..

# . (Single dot) = Represents the current directory.

# ~ (Tilde) = Represents the current user's HOME directory.
cd ~

#BLOCK 4
# General Syntax: ls [OPTIONS] [FILE/DIRECTORY]
# Example: ls -l /var/log/

# --- FILE TYPES (First Character) ---
# d = Directory (A file used to contain other files).
# - = Regular file (Text, images, binaries, compressed files).
# l = Symbolic link (Points to another file).
# s = Socket (Used for inter-process communication).
# p = Pipe (Used for inter-process communication).
# b = Block device (Hardware communication like hard drives).
# c = Character device (Hardware communication like terminals).

# --- UNDERSTANDING THE OUTPUT COLUMNS ---
# Example: -rw-r----- 1 syslog adm 1346 Oct 2 22:17 auth.log

# 1. Permissions (-rw-r-----): Defines who can read, write, or execute.
# 2. Hard link count (1): Number of hard links pointing to this file.
# 3. Owner (syslog): The user who owns the file.
# 4. Group (adm): The group that owns the file.
# 5. Size (1346): File size in bytes (use -h for human-readable KB/MB).
# 6. Timestamp (Oct 2 22:17): Date and time of the last modification.
# 7. Name (auth.log): The name of the file or directory.

# --- SYMBOLIC LINKS ---
# For symbolic links, the output shows an arrow pointing to the original path.
# lrwxrwxrwx 1 root root 22 Nov 6 2012 /etc/grub.conf -> ../boot/grub/grub.conf

# --- SORTING OPTIONS ---
# By default, 'ls' sorts alphabetically. You can change this behavior:

# -t (time): Sorts by modification time (newest first).
ls -lt /var/log

# -S (size): Sorts by file size (largest first).
ls -lS /var/log

# -r (reverse): Inverts any sorting order.
ls -lSr /var/log  # Sorts by size, from smallest to largest.
ls -r /var/log    # Sorts alphabetically in reverse (Z to A).

#BLOCK 5
# --- su (Switch User) ---
# Used to start a new shell session as a different user.
# By default, it tries to switch to 'root'.

# Options for a "Login Shell" (Cleans the environment and loads user settings):
su -l
su -
su --login
# All three perform a full login, changing the directory to the target user's HOME.

# --- sudo (SuperUser DO) ---
# Used to execute a single command with administrative privileges.
sudo [OPTIONS] COMMAND

# Example: Installing or running restricted tools
sudo apt update
sudo apt install sl
sudo sl  # Runs the 'Steam Locomotive' animation as root

# Troubleshooting 'sl' command:
# If 'sudo sl' returns 'command not found', it's likely because the executable 
# is located in /usr/games/, which might not be in root's PATH.

# Best practice: Run it as a normal user.
sl

# Full path execution (if standard command fails):
sudo apt update && sudo apt install sl -y
/usr/games/sl

# --- Advanced sudo Usage ---
# You can use sudo to act as ANY user, not just root.
# Use the -u (user) option to specify the target account.
sudo -u sysadmin ls /home/sysadmin
# This runs 'ls' as the user 'sysadmin' instead of root.

#BLOCK 6
# First, navigate to the Documents directory
cd ~/Documents

# List the specific file to check its properties
ls -l hello.sh

# Output Breakdown:
# -rw-r--r-- 1 codespace codespace 0 Apr 27 06:10 hello.sh
# ^            Owner     Group
# |
# File Type and Permissions

# --- Permission Structure ---
# Example: - rw- r-- r--
# [Type] [User] [Group] [Others]

# 1. File Type:
# - = Regular file
# d = Directory

# 2. Permission Groups:
# User (u): Permissions for the owner of the file.
# Group (g): Permissions for members of the file's group.
# Others (o): Permissions for everyone else.

# --- Permission Types and Effects ---

| Permission   | Effect on Files              | Effect on Directories               |
|:-------------|:-----------------------------|:------------------------------------|
|   Read (r)   | View or copy file content.   | List files (needs 'x' for details). |
|   Write (w)  | Modify or overwrite content. | Add or delete files (needs 'x').    |
|   Execute (x)| Run the file as a program.   | Move into the directory (cd).       |

# --- CRITICAL RULE: THE PRIORITY CHAIN ---
# Linux checks permissions in this order: User -> Group -> Others.
# Once a match is found, IT STOPS.

# Example Scenario:
# -r-- rw- rwx  1 sysadmin staff  test_file
# 1. Is the current user 'sysadmin'? YES.
# 2. Result: The user ONLY has 'r--' (Read only).
# 3. Even if sysadmin is in 'staff', they CANNOT write, because the chain stopped at the User level.

#BLOCK 7
# chmod (Change Mode): Used to change file or directory permissions.
# Only the owner or the root user can modify these modes.

# --- WHY CHMOD? ---
# In early UNIX, permissions were called "access modes". 
# chmod = "Change Access Modes".

# --- SYMBOLIC METHOD STRUCTURE ---
# Syntax: chmod [WHO][ACTION][PERMISSION] file

# 1. WHO (Sets of permissions):
# u = User (owner)
# g = Group
# o = Others
# a = All (u, g, and o combined)

# 2. ACTION:
# + = Add permission
# - = Remove permission
# = = Set exact permission (overwrites previous ones)

# 3. PERMISSION:
# r = read
# w = write
# x = execute

# --- PRACTICAL EXERCISE: Running a script ---

# 1. Navigate and check initial status:
cd ~/Documents
ls -l hello.sh
# Result: -rw-r--r-- (No execution permission 'x')

# 2. Try to run it:
./hello.sh
# Result: -bash: ./hello.sh: Permission denied

# 3. Grant execution permission to the owner (u):
chmod u+x hello.sh

# 4. Verify the change:
ls -l hello.sh
# Result: -rwxr--r-- (Notice the 'x' for the owner)

# 5. Execute the script:
./hello.sh
# I can confirm the permission change was successful because the "permission denied" message no longer appears when attempting to execute ./hello.sh.

#BLOCK 8
# chown (Change Owner): Used to change the user or group owner of a file.
# Changing the USER owner REQUIRES administrative privileges (sudo).

# Syntax: sudo chown [OWNER] FILE

# --- PRACTICAL EXERCISE: Changing owner to root ---

# 1. Verify current owner:
ls -l hello.sh
# Result: -rwxr--r-- 1 sysadmin sysadmin ... (Owner is sysadmin)

# 2. Change the owner to root (requires sudo):
sudo chown root hello.sh
# Note: Use password 'netlab123' if prompted.

# 3. Verify the change:
ls -l hello.sh
# Result: -rwxr--r-- 1 root sysadmin ... (Owner is now root)

# --- THE CONSEQUENCE ---
# If I try to run it as a normal user:
./hello.sh
# Result: -bash: ./hello.sh: Permission denied

# WHY? 
# Because the 'x' (execution) bit only belongs to the OWNER (now root).
# Since 'codespace' is no longer the owner, they are treated as part of the 'group' or 'others', which only have 'r--' (read-only) permissions.

# SOLUTION: Execute as the new owner using sudo:
sudo ./hello.sh

#BLOCK 9
# --- cat (Concatenate) ---
# Used to quickly display the entire content of a file.
# Recommended for SMALL files only.
cat [OPTIONS] [FILE]

# Example:
cat animals.txt

# --- Paging Commands (For Large Files) ---
# more: Displays content page by page (older).
# less: Displays content with better navigation and search (modern).

# --- head and tail (Previewing Files) ---
# Useful for checking the beginning or end of logs and scripts.

# head: Shows the first 10 lines by default.
head alpha.txt

# tail: Shows the last 10 lines by default.
tail alpha.txt

# --- Specifying the Number of Lines (-n) ---
# Syntax: command -n [number_of_lines] [file]

# To see only the first 5 lines:
head -n 5 alpha.txt

# To see only the last 5 lines:
tail -n 5 alpha.txt

#BLOCK 10
# cp (Copy): Creates a duplicate of a file or directory.
# Syntax: cp [OPTIONS] SOURCE DESTINATION

# --- USE CASES ---
# 1. Backups: Revert to the original if changes fail.
# 2. Transfers: Move files to removable media.
# 3. Templates: Use an existing document as a starting point.

# --- PRACTICAL EXERCISE: Copying a system file ---

# 1. Navigate to your target folder:
cd ~/Documents

# 2. Copy the 'passwd' file from the system config to your current folder (.):
cp /etc/passwd .

# Note: The dot (.) represents your current location (Documents). 
# This creates a file named 'passwd' in your directory.

# 3. Verify the copy exists:
ls

# --- PERMISSION REQUIREMENTS TABLE ---

| Location               | Required Permission    | Why?                                              |
|:-----------------------|:-----------------------|:--------------------------------------------------|
| Source Directory       | Execute (x)            | To enter the folder and "search" for the file.    |
| Source File            | Read (r)               | To "see" and duplicate the content.               |
| Destination Directory  | Write (w) & Execute (x)| To create the new file and enter the target folder|

# --- SECURITY TIPS ---
# 1. Standard Permissions: Usually, you always have full permissions (rwx) in your Home directory (represented by ~).
# 2. The /tmp folder: This is a global temporary directory where users typically have write access to perform quick operations.