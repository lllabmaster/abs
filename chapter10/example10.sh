#!/bin/bash

E_BADARGS=65

if [ $# -ne 2 ]
then
    echo "Usage: `basename $0` directory fstring"
    exit $E_BADARGS
fi

for file in $( find "$1" -type f -name '*' | sort )
do
    strings -f $file | grep "$2" | sed -e "s%$1%%"
done

exit 0
