#!/bin/bash

E_BADARGS=65

if [ -z "$1" ]
then
    echo "Usage `basename $0` filename."
    exit $E_BADARGS
fi

if   [ "$2" = "lower" ]
then
    tr 'A-Z' 'a-z' < "$1"
elif [ "$2" = "upper" ]
then
    tr 'a-z' 'A-Z' < "$1"
else
    tr 'a-z' 'A-Z' < "$1"
fi

exit 0
