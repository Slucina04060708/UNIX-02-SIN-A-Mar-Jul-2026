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

#  The system stores all group definitions in the '/etc/group' file. Using filters allows for rapid auditing of specific memberships.
#
#  1. Command 'cat /etc/group':
#     - Purpose: Reads the plain-text database of all system groups.
#     - Format: group_name:password_placeholder:GID:user_list
#
#  2. Command 'grep root':
#     - Purpose: Filters the input to show only lines containing 'root'.
#     - Logic: Essential to identify which users have been added to the administrative group beyond the default root user.
#
#  3. Data Correlation:
#     - If the output is "root:x:0:", it means the group name is root, its ID (GID) is 0, and no secondary users are explicitly listed. 

#  The tilde symbol (~) is a universal alias for the current user's HOME directory (usually /root in your Kali environment or /home/username).

#  1. Command 'mkdir ~/proyecto_unix/':
#     - Purpose: Creates a new directory named 'proyecto_unix' inside 
#       the user's home folder.
#     - Logic: Using '~' ensures the directory is created in a space 
#       where the user always has full permissions.

#  2. Command 'ls -la ~/proyecto_unix/':
#     - Purpose: Lists the contents of the newly created folder.
#     - Flags:
#       * -l (long): Displays detailed info (permissions, owner, size).
#       * -a (all): Shows hidden files, including '.' (current dir) and '..' (parent dir).

#  Managing user authentication is the cornerstone of system security. Linux provides tools to set, modify, and enforce password policies.

#  1. Command 'passwd':
#     - Purpose: Used to change a user account's password.
#     - Logic:
#       * If run by a regular user (passwd): It changes their own password after verifying the current one.
#       * If run by 'root' (sudo passwd username): It allows the administrator to set a new password for ANY user without knowing the old one.
#
#  2. Account Locking and Unlocking:
#     - The 'passwd' command can also manage account status (locking the encrypted password in /etc/shadow).
#
#  3. Key Identity Commands (Review):
#     - chgrp : Command to change group ownership of a file.
#     - groups : Command to list the groups a user belongs to.

#  Beyond simple creation, group management involves assigning specific IDs and verifying their existence in the system database.

#  1. Command 'groupadd' Options:
#     - Default: Creates a group with the next available GID (usually >= 1000).
#     - Flag -g [GID]: Forcefully assigns a specific Group ID. 
#       * Example: sudo groupadd -g 2000 operaciones
#     - Flag --system: Creates a system group.
#       * Logic: System GIDs are reserved (usually < 1000) for services.

#  2. Verification via /etc/group:
#     - This file stores: group_name:password_placeholder:GID:user_list

#  3. Advanced Auditing with 'grep':
#     - Searching for multiple patterns:
#       * grep "pattern1\|pattern2" : Uses escaped pipes for basic regex.
#       * grep -E "pattern1|pattern2" : Uses Extended Regex (ERE) for cleaner syntax (no backslashes needed for the pipe).

#  4. Help and Documentation:
#     - groupadd --help : Quick reference for all available flags.

#Proper lifecycle management for users and groups ensures that permissions remain updated as project roles change.

#  1. Modifying User Groups ('usermod'):
#     - Command: sudo usermod -g [group] [user]
#     - Flag -g (initial group): Changes the user's primary group.
#     - Logic: Use this only when a user's main departmental role changes.

#  2. Deleting Groups ('groupdel'):
#     - Command: sudo groupdel [group_name]
#     - Purpose: Removes a group entry from /etc/group.
#     - Constraint: A group cannot be removed if it is the primary group of an existing user.

#  3. Verification and Auditing:
#     - id [user] : Best way to confirm both UID and GID after a change.
#     - grep -E : Used to confirm the group no longer exists in /etc/group.

#  Linux provides two primary tools to create groups, each with specific advantages for system organization.

#  1. Command 'groupadd' (Low-level tool):
#     - Purpose: Standard utility to add a group to the system.
#     - Options:
#       * -g [GID]: Assigns a specific numerical Group ID.
#       * --system: Creates a system group (usually with a GID < 1000).
#     - Example: sudo groupadd -g 2000 operaciones

#  2. Command 'addgroup' (High-level tool):
#     - Purpose: A friendlier wrapper (often found in Debian/Ubuntu/Kali) that simplifies group creation.
#     - Options:
#       * --gid: Assigns a specific GID.
#       * --system: For service or system-level groups.
#
#  3. Verification & Auditing:
#     - Command: grep "name" /etc/group
#     - Logic: Allows you to verify the existence of a group and see its members without reading the entire database.

#  Removing groups is a common cleanup task, but it requires understanding how the system handles "orphaned" group IDs.

#  1. Command 'groupdel':
#     - Purpose: Removes a group definition from the system (/etc/group).
#     - Logic: 
#       * You cannot delete the primary group of an existing user.
#       * The group must be empty of primary members before deletion.

#  2. The "Orphaned GID" Phenomenon:
#     - When a group is deleted, any file that belonged to it will no longer 
#       show a group name in 'ls -l'.
#     - Instead, the system will display the numerical GID (e.g., 2000).
#     - Logic: The file still exists and keeps its permissions, but the link to the group name is broken.

#  3. Security Implication:
#     - If a new group is created later with the SAME numerical GID, it automatically inherits ownership of those "orphaned" files.

#  Managing systems requires the ability to dynamically change user group memberships to grant access to specific projects or resources.
#
#  1. Command 'usermod' (Advanced Usage):
#     - Purpose: Modifies a user account system account.
#     - Critical Flags for Group Management:
#       * -a (append): Adds the user to the new group without removing 
#         them from their current ones.
#       * -G (groups): Specifies the target group(s).
#     - Example: sudo usermod -aG desarrolladores,diseño $USER
#
#  2. Command 'groups':
#     - Purpose: Lists all groups to which the current user belongs.
#     - Logic: Confirms the success of the 'usermod' command.
#
#  3. Key Sequence for Adding a User to a Group:
#     - Identify target user and group.
#     - Execute 'usermod -aG'.
#     - Verify using 'groups' or 'id'.