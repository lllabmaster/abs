#!/bin/bash

n=1         # User number
PASSWORD_FILE=/etc/passwd

for name in $(awk 'BEGIN{FS=":"}{print $1}' < "$PASSWORD_FILE")
do
    echo "USER #$n = $name"
    let "n += 1"
done

exit 0
