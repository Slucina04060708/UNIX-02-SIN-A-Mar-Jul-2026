#!/bin/bash
#top #Spawns an interactive process layer that hijacks stdin/stdout. The shell suspends subsequent command parsing until the process exits.
#top& #Instructs the kernel to spawn the process asynchronously. The shell returns an immediate job ID and PID, leaving the terminal prompt available for continuous command ingestion.

touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "el comando lzl falló"

echo "Hola mundo!" > output.txt
cat output.txt
echo "Chao mundo!" > output.txt
cat output.txt
echo "Chao Universo" >> output.txt
cat output.txt

ls -l / &> stdout_and_stderr.txt
ls -l / &>> stdout_and_stderr.txt

ls -l / 1> stdout.txt 2> stderr.txt
lzl 2> error.txt
cat error.txt
cat < output.txt

cat << EOF
Black Hat Bash
by No Starch Press
EOF

ls -l / | grep "bin"