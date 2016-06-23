#!/bin/bash

# The "continue N" command, continuing at the Nth level loop.

for outer in I II III IV V    # outer loop
do
    echo; echo -n "Group $outer: "

    for inner in $(seq 10)    # inner loop
    do
	if [ "$inner" -eq 7 ]
	then
	    continue 2
	fi

	echo -n "$inner "     # 7 8 9 10 will never echo.
    done
done

echo

exit 0
