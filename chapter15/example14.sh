#!/bin/bash

# Detects scripts within a directory.

TESTCHARS=11             # Test first 2 characters.
SHABANG='#!/bin/bash'    # Scripts begin with a "sha-bang."

if [ -z "$1" ]
then
    DIR=$(pwd)
else
    DIR="$1"
fi


for file in "$DIR"/*   # Traverse all the files in current directory.
do
    if [[ `head -c $TESTCHARS "$file"` = "$SHABANG" ]]
    then
	echo "File \"$file\" is a script."
    else
	echo "File \"$file\" is *not* a script."
    fi
done

exit 0
