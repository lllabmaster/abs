#!/bin/bash

# Breaking out of loops.
# "break N" breaks out of N level loops.

for outerloop in $(seq 5)
do
    echo -n "Group $outerloop:  "

    for innerloop in $(seq 5)
    do
	echo -n "$innerloop "

	if [ "$innerloop" -eq 3 ]
	then
	    break # break 2
	fi
    done

    echo
done

exit 0
