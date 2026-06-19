#!/bin/bash
#!/bin/bash
# Shebang line: Specifies that the script should be executed using the Bash shell.

NAME="${1}" # The first argument passed to the script is assigned to the variable NAME.
DOMAIN="${2}" # The second argument passed to the script is assigned to the variable DOMAIN.
OUTPUT_FILE="results.csv" # The variable OUTPUT_FILE is set to "results.csv", which will be used to store the output of the script.

if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then # Check if either NAME or DOMAIN is empty (not provided). If either is empty, the script will print an error message and exit with a status code of 1.

  echo "You must provide two arguments to this script." # Print an error message indicating that two arguments are required.

  echo "Example: ${0} mysite nostarch.com" # Print an example of how to run the script, using the script's name (${0}) and two example arguments ("mysite" and "nostarch.com").
  
  exit 1 # Exit the script with a status code of 1, indicating an error occurred due to missing arguments.

fi


echo "status,name,domain,timestamp" > ${OUTPUT_FILE} # Write the header line "status,name,domain,timestamp" to the output file (results.csv). This line serves as a header for the CSV file, indicating the columns that will be present in the output.

if ping -c 1 "${DOMAIN}" &> /dev/null; then # Check if the domain provided as the second argument is reachable by sending one ping request. The output of the ping command is redirected to /dev/null to suppress it. If the ping is successful (the domain is reachable), the script will execute the commands in the then block.

  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}" # If the ping is successful, append a line to the output file (results.csv) indicating success, along with the provided NAME, DOMAIN, and the current date and time (timestamp).
 
else # If the ping is not successful (the domain is not reachable), the script will execute the commands in the else block.

  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}" # If the ping fails, append a line to the output file (results.csv) indicating failure, along with the provided NAME, DOMAIN, and the current date and time (timestamp).

fi

chmod +x exercise_solution.sh # Make the script executable by adding execute permissions to it.
nohup ./exercise_solution.sh mysite nostarch.com & # Run the script in the background using nohup, which allows it to continue running even if the terminal is closed. The script is executed with two arguments: "mysite" and "nostarch.com". The output of the script will be written to the results.csv file.
ps -ef | grep exercise_solution.sh # Check if the script is running by listing all processes and filtering for the script's name. This will show the process ID and other details of the running script.
ps aux | grep exercise_solution.sh # Another way to check if the script is running, showing all processes with detailed information and filtering for the script's name.