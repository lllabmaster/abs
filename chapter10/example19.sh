#!/bin/bash

t=0

condition()
{
    (( t++ ))

    if [ $t -lt 5 ]
    then
	return 0    # true
    else
	return 1    # false
    fi
}

while condition
do
    echo "Still going: t = $t"
done

exit 0
