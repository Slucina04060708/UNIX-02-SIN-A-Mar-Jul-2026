#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY # Show processes associated with the current terminal
ps | grep -i tty # Show processes associated with the current terminal, case insensitive