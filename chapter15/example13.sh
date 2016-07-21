#!/bin/bash

FILENAME=/etc/passwd

for user in $(cut -d ":" -f 1 $FILENAME)
do
    echo $user
done

exit 0
