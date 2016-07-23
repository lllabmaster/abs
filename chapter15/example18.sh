#!/bin/bash

# Emulating `grep' in a script.

E_BADARGS=65

if [ -z "$1" ]   # Check for argument to script.
then
    echo "Usage: `basename $0` pattern"
    exit $E_BADARGS
fi

echo

for file in *    # Traverse all files in $PWD.
do
    output=$(sed -n /"$1"/p $file)

    if [ ! -z "$output" ]
    then
	echo -n "$file: "
	echo $output
    fi

    echo
done

echo

exit 0
