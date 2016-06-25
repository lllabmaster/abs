#!/bin/bash

# A use of case involves testing for command-line parameters.

E_PARAM=65

case "$1" in
    "") # No command-line parameters, or first parameter empty.
	# ${var##pattern} param substitution.
	echo "Usage: ${0##*/} <filename>"
	exit $E_PARAM
	;;
    -*)
	FILENAME=./$1
	;;
    * )
	FILENAME=$1
	;;
esac

echo $FILENAME

exit 0
