#!/bin/bash

USER_INPUT="${1}" # Get the first argument passed to the script and store it in a variable
if [[ -z "${USER_INPUT}" ]]; then # Check if the user provided an argument
echo "You must provide an argument!" # If no argument is provided, print an error message
exit 1 # Exit the script with a non-zero status code to indicate an error
fi # End of the if statement that checks for user input
if [[ -f "${USER_INPUT}" ]]; then # Check if the argument is a file
echo "${USER_INPUT} is a file." # If it is a file, print that it is a file
elif [[ -d "${USER_INPUT}" ]]; then # Check if the argument is a directory
echo "${USER_INPUT} is a directory." # If it is a directory, print that it is a directory
else # If the argument is neither a file nor a directory, print that it is not a file or directory
echo "${USER_INPUT} is not a file or a directory." # Print that the argument is not a file or directory
fi # End of the if-elif-else statement that checks if the argument is a file, directory, or neither