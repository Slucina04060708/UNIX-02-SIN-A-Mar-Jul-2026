# General Syntax: command [options] [arguments]

# Commands: The main tool or program to be executed (e.g., ls, cd, mkdir)
# Subcommands: Specific tasks within a command (e.g., git commit)
# Options (flags): Modify the behavior of a command or subcommand
  # Long option: Full word preceded by two dashes (e.g., --all)
  # Short option: Single letter preceded by one dash (e.g., -a)
# Arguments: The target or entity the command acts upon (e.g., a file or folder)

# List directory contents
ls -a 
ls --all
# Both do exactly the same (display hidden files)

# Combining options in a command
ls -l -a -h 
ls -lah 
# Both represent the same: long format, all files, and human-readable sizes
# mkdir (Make Directory) = Creates one or more new folders.
# rmdir (Remove Directory) = Deletes empty folders.

# Double Dash (--) = Forces the following text to be treated as a literal argument (plain text) 
# rather than a command option (flag).

# Create a directory named "-rf"
mkdir -- -rf 
# The double dash prevents "-rf" from being detected as a command flag.

# Remove a directory named "-rf"
rmdir -- -rf 
# This ensures "-rf" is treated as the folder name to be deleted.
# General Syntax: command [options] [arguments]

# ls --help = Displays a brief summary of options and usage for the ls command.
# man (Manual) = Opens the full reference manual for a command (e.g., ls, git).
man ls 
man git

# Navigation within 'man' pages:
# Use '/' followed by the word to search.
# Press 'n' to go forward (next match).
# Press 'N' to go backward (previous match).
# Press 'q' to quit the manual.

# man git-clone = Opens the specific manual for the git clone command.
man git-clone

--depth #Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.
# --depth <number> = Creates a "shallow clone". 
# It truncates the history to a specific number of commits to save space and time.
# Example: git clone --depth 1 [url]