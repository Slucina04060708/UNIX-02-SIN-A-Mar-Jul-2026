#!/bin/bash
# This script will ping any address provided as an argument.
SCRIPT_NAME="${0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 5 "${TARGET}"
echo "The arguments are: $@" #Stores all the arguments passed to the script as a single string.
echo "The total number of arguments is: $#" #Counts the number of arguments passed to the script and returns that count as an integer.

for args in "$@"; do
echo "${args}"
done
# The above loop iterates through each argument passed to the script and prints it on a new line. The "$@" variable is used to access all the arguments as an array, allowing us to process each one individually.

# Takes input from the user and assigns it to variables
echo "What is your first name?"
read -r firstname # The read command reads a line of input from the user and assigns it to the variable specified (in this case, firstname). The -r option prevents backslashes from being interpreted as escape characters, allowing for more accurate input handling.
echo "What is your last name?"
read -r lastname # Similar to the previous read command, this line prompts the user for their last name and assigns it to the variable lastname. The -r option is used again to ensure that any special characters in the input are treated as literal characters rather than escape sequences.
echo "Your first name is ${firstname} and your last name is
${lastname}"