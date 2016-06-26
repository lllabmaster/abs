#!/bin/bash

# Using a "case" structure to filter a string.

SUCCESS=0
FAILURE=-1

isalpha()   # Tests whether first character of input string is alphabetic.
{
    if [ -z "$1" ]       # No argument passed.
    then
	return $FAILURE
    else
	case "$1" in
	    [a-zA-Z]* )
		return $SUCCESS
		;;
	    *         )
		return $FAILURE
		;;
	esac
    fi
}

isalpha2()  # Tests whether entire string is alphabetic.
{
    [ $# -eq 1 ] || return $FAILURE

    case $1 in
	*[!a-zA-Z]*|"" )
	    return $FAILURE
	    ;;
	*              )
	    return $SUCCESS
	    ;;
    esac
}

isdigit()   # Tests whether entire string is numerical.
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

check_var() # Front-end to isalpha().
{
    if isalpha "$@"
    then
	echo "\"$*\" begins with an alpha character."

	if isalpha2 "$@"
	then
	    echo "\"$*\" contains only alpha characters."
	else
	    echo "\"$*\" contains at least one non-alpha character."
	fi

    else
	echo "\"$*\" begins with a non-alpha character."
    fi

    echo
}

digit_check()
{
    if isdigit "$@"
    then
	echo "\"$*\" contains only digits [0 - 9]."
    else
	echo "\"$*\" has at least one non-digit character."
    fi

    echo
}

a=23skidoo
b=H3llo
c=-What?
d=What?
e=`echo $b`   # Command substitution.
f=AbcDef
g=27234
h=27a34
i=27.34

check_var $a
check_var $b
check_var $c
check_var $d
check_var $e
check_var $f
check_var        # No argument passed, so what happens?

digit_check $g
digit_check $h
digit_check $i

exit 0
