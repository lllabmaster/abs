#!/bin/bash

# Does a dictionary lookup on each word in a data file.

file=words.data  # Data file from which to read words to test.

echo

while [ "$word" != end ]    # Last word in data file.
do
    read word               # From data file.
    look $word > /dev/null  # Don't display lines in dictionary file.
    lookup=$?               # Exit status of 'look' command.

    if [ "$lookup" -eq 0 ]
    then
	echo "\"$word\" is valid."
    else
	echo "\"$word\" is invalid."
    fi
done < "$file"

echo

exit 0
