#  The 'umask' command controls the default permissions assigned to newly created files and directories by "masking" specific bits.

#  1. Logic Base:
# - Directories: Started from base 777 (rwxrwxrwx).
# - Files: Started from base 666 (rw-rw-rw-)[cite: 5].
# *Note: Files never get execution (x) bits by default for security.
#
#  2. Calculation Method:
# - Final Permissions = Base - Umask.
# - If the result is negative, it defaults to 0 (no permission).

#  3. Practical Examples from Terminal:
# - umask 022: Results in 755 for dirs and 644 for files.
# - umask 027: Results in 750 for dirs (removes all permissions for 'others').

#  4. Key Symbols:
# - ~ : Represents the HOME directory and bitwise negation (NOT)

# When a '+' appears at the end of permissions (e.g., drwxrwxrwx+), it means the file has ACLs, which override standard UNIX permissions.
#
#  1. The "Plus" (+) Symbol:
# - Indicates Extended Permissions (ACL) are active.
# - This can cause 'umask' to be ignored by the system.
#
#  2. Commands to Restore Standard Permissions:
# - sudo apt-get install acl : Installs the tool to manage ACLs.
# - sudo chown -R $(whoami) . : Ensures you own the current workspace.
# - sudo setfacl -bnR . (This dot means actual directory. When it's .., it means parent directory) : The "Magic" command.
# * -b : Removes all extended ACL entries.
# * -n : Do not recalculate the mask.
# * -R : Recursive (applies to all subfolders and files).
#
#  3. Result:
# - After running these, the '+' disappears and umask is strictly respected.

In Linux, every file and directory is owned by a specific USER and 
#  associated with a specific GROUP. 

#  1. Command 'chown' (Change Owner):
# - Purpose: Changes the owner and optionally the group of a file.
# - Security Rule: Typically, only the 'root' user has the privilege to change the owner of any file.

#  2. Command 'chgrp' (Change Group):
# - Purpose: Changes the group associated with a file.
# - Security Rule: A regular user can only change the group to one they belong to.
#
#  3. Recursive Action (-R):
# - Both commands accept the '-R' flag to apply changes to a folder and all its contents simultaneously.
#
#  4. Practical Laboratory Cases:
#Normal Creation: Files created by a user (e.g., 'root') automatically belong to that user and their primary group.
# - Failed Operation: If a non-root user tries to 'chown' a file to another user (e.g., 'Pedro'), the system returns:
# "chown: changing ownership of 'file': Operation not permitted"

#Groups allow multiple users to share access to files and resources efficiently. A user can belong to multiple groups simultaneously.

#  1. Command 'groups':
# - Purpose: Lists the groups to which the current user belongs.
# - Logic: By default, the output shows the primary group first, followed by any secondary groups.

#  2. Command 'groupadd':
# - Purpose: Creates a new group in the system.
# - Requirement: Only the 'root' user (or using 'sudo') can create new groups.

#  3. Practical Laboratory Sequence:
# - Verification: 'groups' initially shows the user is in the 'root' group.
# - Creation: 'groupadd grupo_test' adds a new entity to /etc/group.
# - Confirmation: Running 'groups' again verifies the membership structure.

#  4. Ownership Correlation:
# - When a file is created (e.g., 'touch comun'), it is assigned to the primary group of the user who created it (e.g., 'root').

In Linux, every file and directory is owned by a specific USER and 
#  associated with a specific GROUP. 
#
#  1. Command 'chown' (Change Owner):
#     - Purpose: Changes the owner and optionally the group of a file.
#     - Security Rule: Typically, only the 'root' user has the privilege to change the owner of any file.
#
#  2. Command 'chgrp' (Change Group):
#     - Purpose: Changes the group associated with a file.
#     - Security Rule: A regular user can only change the group to one 
#       they belong to.
#
#  3. Recursive Action (-R):
#     - Both commands accept the '-R' flag to apply changes to a folder 
#       and all its contents simultaneously.
#
#  4. Practical Laboratory Cases:
#     - Normal Creation: Files created by a user (e.g., 'root') 
#       automatically belong to that user and their primary group.
#     - Failed Operation: If a non-root user tries to 'chown' a file 
#       to another user (e.g., 'luna'), the system returns:
#       "chown: changing ownership of 'file': Operation not permitted"

#  Managing systems efficiently requires the ability to change multiple attributes at once and modify user group memberships dynamically.
#
#  1. Combined 'chown' Syntax:
#     - Format: chown usuario:grupo fichero
#     - Purpose: Updates both the Owner and the Group in a single command.
#     - Example: sudo chown luna:grupo_test mi_archivo
#
#  2. Recursive Ownership (-R):
#     - Purpose: Applies ownership changes to a directory and every single 
#       file or subdirectory contained within it.
#     - Logic: Essential for project initialization where a specific team 
#       needs full access to a folder structure.
#
#  3. User Modification ('usermod'):
#     - Command: sudo usermod -aG grupo_test $USER
#     - Flags:
#       * -a (append): Adds the user to the new group without removing 
#         them from their current ones.
#       * -G (groups): Specifies the target group(s).
#     - Result: Grants the current user ($USER) the permissions of 'grupo_test'.

#  1. Command 'id':
#     - Purpose: Displays the real and effective user and group IDs.
#     - Logic: 
#       * uid (User ID): The unique number for the current user.
#       * gid (Group ID): The number of the user's primary group.
#       * groups: A list of all secondary group IDs the user belongs to.
#
#  2. Command 'cat /etc/passwd':
#     - Purpose: Reads the primary database file for all system accounts.
#     - Structure: Each line represents a user with fields separated by ':'.
#       (username:password_placeholder:UID:GID:comment:home_dir:shell)
#
#  3. Use of Pipes ('head -10'):
#     - Purpose: Limits the output to the first 10 lines.
#     - Logic: Prevents a wall of text in large systems, showing only 
#       initial accounts (usually system/service accounts).

#  The 'id' command can be refined using flags to output only specific numeric identifiers, which is critical for scripting and automation.

#  1. User Identification:
#     - id -u : Returns ONLY the effective User ID (UID).
#     - Logic: Essential to verify if a script is running as root (UID 0).
#
#  2. Group Identification:
#     - id -g : Returns ONLY the primary Group ID (GID).
#     - id -G : Returns ALL Group IDs (primary and supplementary).
#     - Logic: Helps audit access levels across multiple project groups.
#
#  3. Key Identity Commands:
#     - addgroup / groupadd : Tools for creating new group entities.
#     - chgrp : Command to change the group ownership of a file.
#     - newgrp : Allows a user to log in to a new group during a session.