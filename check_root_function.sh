#!/bin/bash

# This function checks if the current user ID equals zero.❶ check_if_root(){❷ if [["${EUID}" -eq "0"]]; then
check_if_root(){ # Define a function named check_if_root
if [[ "${EUID}" -eq "0" ]]; then
return 0 # Explicitly return 0 to indicate success (User is root) # Check if the effective user ID (EUID) is equal to zero (0), which indicates that the user is root. To understand EUID we need to know that in Unix-like operating systems, each user has a unique user ID (UID) and an effective user ID (EUID). The UID is the actual identifier for the user, while the EUID is used by the system to determine the permissions of the user when executing commands. 
else
    return 1 # If the user is not root, return 1 to indicate failure
fi
} # End of the check_if_root function definition

if check_if_root; then # Call the check_if_root function and check its return value
    echo "You are root!" # If the function returns 0 (success), print that the user is root
else
    echo "You are not root!" # If the function returns 1 (failure), print that the user is not root
fi

#useradd Luna - This command adds a new user named Luna to the system. The useradd command is used to create a new user account in Unix-like operating systems. By default, it creates a new user with a home directory and assigns a unique user ID (UID) to the new user.
#u - Luna - This command switches the current user to Luna. The su command stands for "substitute user" and is used to switch to another user account. The - (dash) option is used to start a login shell, which means that the environment will be set up as if Luna had logged in directly.
#bash check_root_function - This command executes the check_root_function script using the bash shell. Since we switched to the Luna user, this command will check if Luna is root or not. In this case the message is "You are not root!" 

