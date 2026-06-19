#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY # Show processes associated with the current terminal
ps | grep -i tty # Show processes associated with the current terminal, case insensitive
grep -v "35.237.4.214" log.txt # Show lines that do not contain the IP address
grep -o "35.237.4.214" log.txt # Show only the IP address matches
awk '{print $1}' log.txt # Show only the first column
awk '{print $1,$2,$3}' log.txt # Show the first three columns
awk '{print $2}' log.txt # Show only the second column
awk '{print $3}' log.txt # Show only the third column
awk '{print $1,$NF}' log.txt

cat << 'EOF' > registro.csv
Santiago,Lucina,Quito
Marcela,Garcia,Guayaquil
William,Smith,New York
EOF

awk -F',' '{print $1}' registro.csv # Show only the first column from a CSV file
head log.txt # Show the first 10 lines of the log file
awk 'NR < 10' log.txt # Show the first 10 lines of the log file using awk
grep "42.236.10.117" log.txt # Show lines containing the IP address
awk '{print $7}' log.txt # Show only the seventh column
grep "42.236.10.117" log.txt | awk '{print $7}' # Show the seventh column for lines containing the IP address
sed 's/Mozilla/Godzilla/g' log.txt # Replace all occurrences of "Mozilla" with "Godzilla" in the log file
grep "Mozilla" log.txt # Show lines containing "Mozilla" in the log file
grep "Godzilla" log.txt # This will not return any results since "Gozilla" is a typo
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt # Show lines containing "Godzilla" in the new log file
git diff newlog.txt log.txt # Show the differences between the new log file and the original log file
sed '1d' newlog.txt # Remove the first line from the new log file
sed -i '1d' newlog.txt # Remove the first line from the new log file (in-place)
sed '$d' newlog.txt # Remove the last line from the new log file
sed -i '$d' newlog.txt # Remove the last line from the new log file (in-place)
sed 's/ //g' newlog.txt > newlog1.txt # Remove all spaces from the log file and save it to a new file
sed '8,10d' newlog1.txt # Remove lines 8 to 10 from the log file
sed -n '10,15 p' log.txt # Show lines 10 to 15 from the log file
sleep 300 & # Run the sleep command in the background for 300 seconds
jobs # Show the list of background jobs
fg %1 # Bring the first background job to the foreground
bg %1 # Resume the first background job in the background