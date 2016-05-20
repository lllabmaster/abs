#!/bin/bash

# How random is RANDOM?
# Rolling a single die with RANDOM.

RANDOM=$$      # Reseed the random number generator using script process ID.

PIPS=6         # A die has 6 pips.
MAXTHROWS=600  # Increase this if you have nothing better to do with your time.

declare -a C

# Init RESULTS
for i in $(seq $PIPS)
do
    C[i]=0
done

print_result()
{
    for i in $(seq $PIPS)
    do
	echo "$i : ${C[i]}"
    done
}

update_count()
{
    idx=$1
    let "C[idx]++"
}

for i in $(seq $MAXTHROWS)
do
    update_count $(( RANDOM % PIPS + 1 ))
done

print_result

exit 0
