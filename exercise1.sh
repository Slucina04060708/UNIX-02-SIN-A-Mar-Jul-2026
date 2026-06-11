#!/bin/bash

# 1. Accept two arguments and assign them to variables
FIRST_NAME=$1
LAST_NAME=$2

# Ensure both arguments were provided
if [ -z "$FIRST_NAME" ] || [ -z "$LAST_NAME" ]; then # The -z option checks if the variable is empty. If either FIRST_NAME or LAST_NAME is empty, the script will print an error message and exit with a non-zero status code to indicate that an error occurred.
    echo "Error: Please provide both your first name and last name as arguments." # This line prints an error message to the standard output stream, informing the user that they need to provide both their first name and last name as arguments when running the script.
    echo "Usage: $0 <FirstName> <LastName>" # The $0 variable contains the name of the script itself, which is useful for providing usage instructions to the user. The <FirstName> and <LastName> placeholders indicate that the user should replace them with their actual first and last names when running the script.
    exit 1 # The exit command is used to terminate the script. By providing an argument of 1, we indicate that the script is exiting due to an error. This allows any calling processes or scripts to detect that an error occurred and handle it accordingly.
fi # fi represents that the conditional has ended.

# 2. & 3. Create output.txt and write the current date in DD-MM-YYYY format
# The %d-%m-%Y format string handles the custom date format
date +"%d-%m-%Y" > output.txt # The date command is used to get the current date and time. By using the + option followed by a format string, we can specify how we want the date to be formatted. In this case, %d represents the day of the month (01-31), %m represents the month (01-12), and %Y represents the year in four digits (e.g., 2024). The output of the date command is then redirected to a file named output.txt using the > operator, which creates the file if it doesn't exist or overwrites it if it does.

# 4. Write my full name to output.txt (appending to the file)
echo "$FIRST_NAME $LAST_NAME" >> output.txt

# 5. Make a backup copy named backup.txt
cp output.txt backup.txt

# 6. Print the content of output.txt to the standard output stream
cat output.txt
