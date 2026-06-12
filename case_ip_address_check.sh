#!/bin/bash

IP_ADDRESS="${1}" # Assign the first command-line argument passed to the script to the variable IP_ADDRESS. This variable will be used to store the IP address that we want to check against specific patterns in the case statement below.
case ${IP_ADDRESS} in # Start a case statement that will compare the value of IP_ADDRESS against different patterns. The case statement allows us to execute different blocks of code based on the value of IP_ADDRESS.
192.168.*) # Check if the value of IP_ADDRESS matches the pattern "192.168.*". The * is a wildcard that matches any characters, so this case will match any IP address that starts with "192.168.".
echo "Network is 192.168.x.x" # If the case matches the pattern "192.168.*", this line will execute. It prints a message indicating that the network is in the 192.168.x.x range.
;; # The double semicolon (;;) is used to indicate the end of the block of code for this case. It tells the case statement to stop executing further cases and exit the case statement.
10.0.*) # Check if the value of IP_ADDRESS matches the pattern "10.0.*". Similar to the previous case, this will match any IP address that starts with "10.0.".
echo "Network is 10.0.x.x" # If the case matches the pattern "10.0.*", this line will execute. It prints a message indicating that the network is in the 10.0.x.x range.
;;
*) # The asterisk (*) is a wildcard that matches any value. This case will be executed if the value of IP_ADDRESS does not match any of the previous cases.
echo "Could not identify the network" 
;;
esac
#Values that I use
# 192.168.esta
# 10.10.esta
# esta