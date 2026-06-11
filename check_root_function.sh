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

