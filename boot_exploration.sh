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

