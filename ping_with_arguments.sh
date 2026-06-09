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
