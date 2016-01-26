#!/bin/bash

# Greatest common divisor.
# Uses Euclid's algorithm.

# The "greatest common divisor" (gcd) of two integers is the largest
# integer that will divide both, leaving no remainder.

# Euclid's algorithm uses successive division.
# In each pass,
# dividend <--- divisor
# divisor  <--- remainder
# until remainder = 0.
# The gcd = dividend, on the final pass.

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` first-number second-number"
    exit $E_BADARGS
else
    if ! [[ $1 =~ ^-?[0-9]+$ && $2 =~ ^-?[0-9]+$ ]]
    then
	echo "Usage: arguments should be integers."
	exit $E_BADARGS
    fi
fi

gcd() {

    dividend=$1   # Arbitrary assignment.
    divisor=$2    # It doesn't matter which of the two is larger.

    remainder=1   # If uninitialized variable used in loop,
                  # it results in an error message
                  # on the first pass through loop.

    until [ "$remainder" -eq 0 ]
    do
	let "remainder = $dividend % $divisor"
	dividend=$divisor     # Now repeat with 2 smallest numbers.
	divisor=$remainder
    done
}

gcd $1 $2

echo; echo "GCD of $1 and $2 = $dividend"; echo

exit 0
