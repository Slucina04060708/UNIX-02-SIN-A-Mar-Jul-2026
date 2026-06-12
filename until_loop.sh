#!/bin/bash

FILE="output1.txt" # Define a variable named FILE and assign it the value "output1.txt". This variable will be used to specify the name of the file that the script will check for content. The script will wait until this file has some content in it before proceeding.
touch "${FILE}" # Use the touch command to create an empty file with the name specified by the FILE variable. 
until [[ -s "${FILE}" ]]; do # Start an until loop that continues until the file specified by FILE has some content in it. The -s option checks if the file exists and has a size greater than zero, which indicates that it contains some content. The loop will run as long as the file is empty or does not exist.
echo "${FILE} is empty..." # Print a message indicating that the file is empty. The ${FILE} syntax is used to reference the value of the variable, which will be replaced with "output1.txt" when the script runs.
echo "Checking again in 2 seconds..." # Print a message indicating that the script will check for content in the file again after a short delay.
sleep 2 # Pause the script for 2 seconds before the next iteration of the loop. This prevents the script from continuously checking for content in the file without any delay, which could consume unnecessary system resources.
done

echo "${FILE} appears to have some content in it!" # Print a message indicating that the file has content. The ${FILE} syntax is used to reference the value of the variable, which will be replaced with "output1.txt" when the script runs.