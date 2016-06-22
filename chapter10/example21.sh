#!/bin/bash

# Nested "for" loops.

outer=1        # Set outer loop counter.

# Beginning of outer loop.
for a in 1 2 3 4 5
do
    echo "Pass $outer in outer loop."
    echo "--------------------------"
    inner=1    # Reset inner loop counter.

    for b in 1 2 3 4 5
    do
	echo "Pass $inner in inner loop."
	let "inner+=1"
    done

    let "outer+=1"
    echo
done

exit 0
