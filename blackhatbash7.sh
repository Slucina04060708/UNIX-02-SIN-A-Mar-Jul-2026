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