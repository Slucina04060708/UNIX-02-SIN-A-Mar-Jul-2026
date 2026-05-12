#  The 'umask' command controls the default permissions assigned to 
#  newly created files and directories by "masking" specific bits.

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
# - sudo setfacl -bnR . : The "Magic" command.
# * -b : Removes all extended ACL entries.
# * -n : Do not recalculate the mask.
# * -R : Recursive (applies to all subfolders and files).
#
#  3. Result:
# - After running these, the '+' disappears and umask is strictly respected.

