#!/bin/bash

# Seeding the RANDOM variable.

MAXCOUNT=25  # How many numbers to generate.

random_numbers()
{
    count=0
    while [ "$count" -lt "$MAXCOUNT" ]
    do
	number=$RANDOM
	echo -n "$number "
	let "count += 1"
    done
}

echo; echo

RANDOM=1     # Setting RANDOM seeds the random number generator.
random_numbers

echo; echo

RANDOM=1     # Same seed for RANDOM.
random_numbers

echo; echo

RANDOM=2     # Trying again, but with a different seed.
random_numbers

echo; echo

# Getting fancy.
SEED=$(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }')
RANDOM=$SEED
random_numbers

echo; echo

exit 0
