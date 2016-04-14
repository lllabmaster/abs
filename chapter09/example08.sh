#!/bin/bash

TIMELIMIT=4   # 4 seconds.

read -t $TIMELIMIT variable
echo

if [ ! -z $variable ]
then
    echo "The Variable is $variable."
else
    echo "TIMEOUT"
fi

exit 0
