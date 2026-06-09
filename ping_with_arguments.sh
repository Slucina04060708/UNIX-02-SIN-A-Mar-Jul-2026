#!/bin/bash
# This script will ping any address provided as an argument.
SCRIPT_NAME="${0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 5 "${TARGET}"
echo "The arguments are: $@" #Stores all the arguments passed to the script as a single string.
echo "The total number of arguments is: $#" #Counts the number of arguments passed to the script and returns that count as an integer.
