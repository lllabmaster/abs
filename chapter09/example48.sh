#!/bin/bash

# Random number between two specified values.

randomBetween()
{
    #  Generates a positive or negative random number between $min and $max
    #+ and divisible by $divisibleBy.

    syntax()
    {
	# Function embedded within function.
	echo
	echo    "Syntax: randomBetween [min] [max] [multiple]"
	echo
	echo -n "Expects up to 3 passed parameters, "
	echo    "but all are completely optional."
	echo    "min is the minimum value"
	echo    "max is the maximum value"
	echo -n "multiple specifies that the answer must be "
	echo    "a multiple of this value."
	echo    "  i.e. answer must be evenly divisible by this number."
	echo
	echo    "If any value is missing, defaults area supplied as: 0 32767 1"
	echo -n "Successful completion returns 0, "
	echo    "unsuccessful completion returns"
	echo    "function syntax and 1."
	echo -n "The answer is returned in the global variable "
	echo    "randomBetweenAnswer"
	echo -n "Negative values for any passed parameter are "
	echo    "handled correctly."
    }

    local min=${1:-0}
    local max=${2:-32767}
    local divisibleBy=${3:-1}
    # Default values assigned, in case parameters not passed to function.

    local x
    local spread

    # Let's make sure the divisibleBy value is positive.
    if [ ${divisibleBy} -lt 0 ]
    then
	divisibleBy=$(( 0 - divisibleBy ))
    fi

    # Sanity check.
    if [ $# -gt 3 -o ${divisibleBy} -eq 0 -o ${min} -eq ${max} ]
    then
	syntax
	return 1
    fi

    # See if the min and max are reversed.
    if [ ${min} -gt ${max} ]
    then
	# Swap them.
	x=${min}
	min=${max}
	max=${x}
    fi

    #  If min is itself not evenly divisible by $divisibleBy,
    #+ then fix the min to be within range.
    

}
