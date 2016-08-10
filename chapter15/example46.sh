#!/bin/bash

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` side1 side2"
    exit $E_BADARGS
fi

AWKSCRIPT=' { printf( "%3.7f\n", sqrt($1 * $1 + $2 * $2) ) } '

echo -n "Hypotenuse of $1 and $2 = "
echo $1 $2 | awk "$AWKSCRIPT"

exit 0
