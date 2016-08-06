#!/bin/bash

# Show available ip in a specific local lan.
# @author: andy

COUNT=3

for i in $(seq 254)
do
    ping -c $COUNT "219.223.169.$i" > /dev/null
    result=$?

    if [ $result -eq 0 ]
    then
	echo "219.223.169.$i"
    fi
done

exit 0
