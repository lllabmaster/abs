#!/bin/bash

MAXCOUNT=10
AWKSCRIPT=' {srand(seed); print rand() } '

for i in $(seq $MAXCOUNT)
do
    echo | awk -v seed=$RANDOM "$AWKSCRIPT"
done

exit 0
