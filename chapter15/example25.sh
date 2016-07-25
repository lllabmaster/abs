#!/bin/bash

# Changes every filename in working directory to all lowercase.

for filename in *   # Traverse all files in directory.
do
    fname=`basename $filename`
    lower=`echo $fname | tr 'A-Z' 'a-z'`

    if [ "$fname" != "$lower" ]
    then
	mv "$fname" "$lower"
    fi
done

exit $?
