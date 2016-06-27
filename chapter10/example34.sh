#!/bin/bash

# Write an 'isfloat()' function that tests for floating point numbers.

SUCCESS=0
FAILURE=-1

isdigit()
{
    if [ $# -eq 1 ]
    then
	case $1 in
	    *[!0-9]*|"" )
		return $FAILURE
		;;
	    *           )
		return $SUCCESS
		;;
	esac
    else
	return $FAILURE
    fi
}

isfloat()
{
    if [ $# -eq 1 ]
    then
	case $1 in
	    #  Bash case does not use regular expressions,
	    #+ but shell pattern matching only.
	    [0-9]*\.[0-9]* )     
		return $SUCCESS
		;;
	    *              )
		return $FAILURE
		;;
	esac
    else
	return $FAILURE
    fi
}

if isfloat 3
then
    echo "Success."
else
    echo "Failure."
fi

if isfloat 3a1
then
    echo "Success."
else
    echo "Failure."
fi

if isfloat 3.1
then
    echo "Success."
else
    echo "Failure."
fi

exit 0
