#!/bin/bash

declare -ir N=20

# Generate random number between 6 and 30.
for i in $(seq $N)
do
    rnumber=$(( RANDOM % 25 + 6 ))
    printf "%2d " $rnumber
done

echo

#  Generate random number in the same 6 - 30 range,
#+ but the number must be evenly divisible by 3.
for i in $(seq $N)
do
    # This will not work all the time.
    rnumber=$(( (RANDOM % 30 / 3 + 1) * 3 ))
    printf "%2d " $rnumber
done

echo

for i in $(seq $N)
do
    rnumber=$(( (RANDOM % 27 / 3) * 3 + 6 ))
    printf "%2d " $rnumber
done

echo

exit 0
