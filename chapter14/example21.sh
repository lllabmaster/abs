#!/bin/bash

ARGS=2
E_WRONGARGS=65

if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` filename column-number"
    exit $E_WRONGARGS
fi

filename=$1
column_number=$2

# Export column number to environment, so it's available for retrieval.
export column_number

awkscript='{ total += $ENVIRON["column_number"] } END { print total }'
awk "$awkscript" "$filename"

exit 0
