#!/bin/bash

# @author andy
# @time   Tue Jun 21 20:12:02 CST 2016

L=10
CNT=1
DIR=${1-`pwd`}

for file in $( find $DIR -name '*.c' )
do
    if [ $CNT -lt $L ]
    then
	mv "$file" "$DIR/example0$CNT.c"
    else
	mv "$file" "$DIR/example$CNT.c"
    fi

    (( CNT++ ))
done

exit 0
