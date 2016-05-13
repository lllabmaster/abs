#!/bin/bash

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).

MAXCOUNT=10
count=1

echo
echo "$MAXCOUNT random numbers:"
echo "-------------------------"

while [ "$count" -le $MAXCOUNT ]
do
    number=$RANDOM
    echo $number
    let "count += 1"  # Increment count.
done

echo "-------------------------"

# If you need a random int within a certain range, use the 'modulo' operator.
# This returns the remainder of a division operation.

RANGE=500

echo

number=$RANDOM
let "number %= $RANGE"
echo "Random number less than $RANGE --- $number"

echo

#  If you need a random integer greater than a lower bound,
#+ then set up a test to discard all numbers below that.

FLOOR=200

number=0  # initialize
while [ "$number" -le $FLOOR ]
do
    number=$RANDOM
done

echo "Random number greater than $FLOOR --- $number"

echo

# Combine above two techniques to retrieve random number between two limits.
number=0  # initialize
while [ "$number" -le $FLOOR ]
do
    number=$RANDOM
    let "number %= $RANGE"  # Scales $number down within $RANGE.
done
echo "Random number between $FLOOR and $RANGE --- $number"
echo

# Generate binary choice, that is, "true" or "false" value.
BINARY=2
T=1
number=$RANDOM

let "number %= BINARY"
if [ "$number" -eq $T ]
then
    echo "true"
else
    echo "false"
fi

echo

# Generate a toss of the dice.
SPOTS=6  # Modulo 6 gives range 0 - 5.
         # Incrementing by 1 gives desired range of 1 - 6.
die1=0
die2=0

# Tosses each die separately, and so gives correct odds.
let "die1 = $RANDOM % $SPOTS + 1"  # Roll first one.
let "die2 = $RANDOM % $SPOTS + 1"  # Roll second one.
let "throw = die1 + die2"
echo "Die1: $die1, Die2: $die2, Throw of the dice = $throw."
echo

exit 0
