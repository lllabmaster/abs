#!/bin/bash

# Random number between two specified values.

# THE CODE STYLE IS TOO BAD.

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
    if [ $(( min / divisibleBy * divisibleBy )) -ne ${min} ]
    then
	if [ ${min} -lt 0 ]
	then
	    min=$(( min / divisibleBy * divisibleBy ))
	else
	    min=$(( (min / divisibleBy + 1) * divisibleBy ))
	fi
    fi
    
    #  If max is itself not evenly divisible by $divisibleBy,
    #+ then fix the max to be within range.
    if [ $(( max / divisibleBy * divisibleBy )) -ne ${max} ]
    then
	if [ ${max} -lt 0 ]
	then
	    max=$(( (max / divisibleBy - 1) * divisibleBy ))
	else
	    max=$(( max / divisibleBy * divisibleBy ))
	fi
    fi

    # Now, to do the real work.
    spread=$(( max - min ))
    if [ ${spread} -lt 0 ]
    then
	spread=$(( 0 - spread ))
    fi

    let "spread += divisibleBy"
    randomBetweenAnswer=$(( (RANDOM % spread) / divisibleBy * divisibleBy + min ))
    
    return 0
}

# Let's test the function.
min=-14
max=20
divisibleBy=3

#  Generate an array of expected answers and check to make sure we get
#+ at least one of each answer if we loop long enough.
declare -a answer
minimum=${min}
maximum=${max}

if [ $(( minimum / divisibleBy * divisibleBy )) -ne ${minimum} ]
then
    if [ ${minimum} -lt 0 ]
    then
	minimum=$(( minimum / divisibleBy * divisibleBy ))
    else
	minimum=$(( (minimum / divisibleBy + 1) * divisibleBy ))
    fi
fi

if [ $(( maximum / divisibleBy * divisibleBy )) -ne ${maximum} ]
then
    if [ ${maximum} -lt 0 ]
    then
	maximum=$(( (maximum / divisibleBy - 1) * divisibleBy ))
    else
	maximum=$(( maximum / divisibleBy * divisibleBy ))
    fi
fi

disp=$(( 0 - minimum ))
for ((i = ${minimum}; i <= ${maximum}; i += divisibleBy))
do
    answer[i+disp]=0
done

loopIt=1000
for ((i = 0; i < ${loopIt}; i++))
do
    randomBetween ${max} ${min} ${divisibleBy}

    # Report an error if unexpected.
    if [ ${randomBetweenAnswer} -lt ${min} -o ${randomBetweenAnswer} -gt ${max} ]
    then
	echo "MIN or MAX error - ${randomBetweenAnswer}!"
    fi

    if [ $(( randomBetweenAnswer % ${divisibleBy} )) -ne 0 ]
    then
	echo "DIVISIBLE BY error - ${randomBetweenAnswer}!"
    fi

    # Store the answer away statistically.
    answer[randomBetweenAnswer+disp]=$(( answer[randomBetweenAnswer+disp] + 1 ))
done

# Let's check the results.
for ((i = ${minimum}; i <= ${maximum}; i += divisibleBy))
do
    if [ ${answer[i+disp]} -eq 0 ]
    then
	echo "We never got an answer of $i."
    else
	echo "${i} occurred ${answer[i+disp]} times."
    fi
done

exit 0
