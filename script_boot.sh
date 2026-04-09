git checkout <branch_name> #Switch to an existing branch to continue working on a specific feature or fix.
Absolute route (cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto) #Navigate using the full path from the root directory to ensure accuracy regardless of current location.
Relative route (cd /workspaces) #Reference a file or directory relative to the current working location using "./" or "../".
mkdir <directory_name> #Create a new directory to organize project assets or source code.
cd #It takes you to the user's home directory or personal directory.
cd ~ #Quickly return to the user's home directory using the tilde shortcut.
cd /home/codespace #Move to the root directory of the codespace environment.
echo $HOME #Print the value of the HOME environment variable to verify the user path.
echo $BASH #Display the full path to the current Bash shell executable.
echo $PATH #Show the list of directories the system searches through to find and run commands.
man <command> #Open the reference manual for a specific command to view its options and syntax.
ls --all #List all files in the current directory, including hidden configuration files.
ls -lai #Display detailed file information, hidden files, and unique index nodes (inodes).
ls -l -a -i #List files with long format, hidden entries, and inode IDs using individual flags.
cd /bin #Access the system's binary directory to interact with essential executable files.
ls -a #List all files and directories, including those that are hidden (starting with a dot).
. #Reference the current working directory, often used when executing local scripts or specifying paths.
.. #Reference the immediate parent directory to move up one level in the file system hierarchy.
