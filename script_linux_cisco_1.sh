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