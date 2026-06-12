#!/bin/bash

SIGNAL_TO_STOP_FILE="stoploop" # Define a variable named SIGNAL_TO_STOP_FILE and assign it the value "stoploop". This variable will be used to specify the name of the file that will signal the loop to stop when it is created. 

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do # Start a while loop that continues as long as the file specified by SIGNAL_TO_STOP_FILE does not exist. The -f option checks if the file exists and is a regular file. The ! operator negates the condition, so the loop will run until the file is created.
echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..." # Print a message indicating that the file does not exist. The ${SIGNAL_TO_STOP_FILE} syntax is used to reference the value of the variable, which will be replaced with "stoploop" when the script runs.
echo "Checking again in 2 seconds..." # Print a message indicating that the script will check for the file again after a short delay.
sleep 2 # Pause the script for 2 seconds before the next iteration of the loop. This prevents the script from continuously checking for the file without any delay, which could consume unnecessary system resources.
done # End of the while loop. Once the file specified by SIGNAL_TO_STOP_FILE is created, the loop will exit and the script will continue to the next line.
echo "File was found! Exiting..." # Print a message indicating that the file was found and the loop is exiting. This message will be displayed once the loop condition is no longer true, meaning that the file specified by SIGNAL_TO_STOP_FILE has been created