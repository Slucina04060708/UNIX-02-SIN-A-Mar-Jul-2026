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
1572971 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..

#1572971 / 1572874 (Inode): The unique index number assigned to the file/directory in the file system.
#drwxrwxrwx+ (Permissions): * d: Directory.
    #rwx: Read, write, and execute permissions for the Owner, Group, and Others.
    #+: Indicates an Access Control List (ACL) is attached (extra permissions).
#2 / 5 (Hard Links): The number of hard links pointing to this node.
#codespace (Owner): The user who owns the directory.
#codespace / root (Group): The group that has specific permissions for this directory.
#4096 (Size): The size of the directory metadata in bytes.
#Apr 9 12:19 (Timestamp): The date and time of the last modification.

stat . #Display comprehensive file system status and timestamps for the current directory.
Device
    #7 (Major Number): This identifies the driver associated with the device. In Linux, different classes of hardware (like RAM disks, SCSI disks, or loop devices) are assigned specific major numbers. For example, "7" often represents a Loop Device, which is common in containerized environments like GitHub Codespaces.
    #4 (Minor Number): This identifies the specific instance or partition controlled by that driver. If you had multiple virtual disks, they would have the same major number but different minor numbers (7,1; 7,2; etc.).

