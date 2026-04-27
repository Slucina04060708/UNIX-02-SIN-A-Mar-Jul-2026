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

# --- Advanced sudo Usage ---
# You can use sudo to act as ANY user, not just root.
# Use the -u (user) option to specify the target account.
sudo -u sysadmin ls /home/sysadmin
# This runs 'ls' as the user 'sysadmin' instead of root.