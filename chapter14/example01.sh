#!/bin/bash

PIDS=$(pidof bash $0) # Process IDs of the various instances of this script.
p_array=( $PIDS )     # Put them in an array.
echo $PIDS            # Show process IDs of parent and child processes.

let "instance = ${#p_array[*]} - 1"
echo "$instances instances(s) of this script running."
echo "[Hit Ctrl-C to exit.]"; echo

sleep 1s
bash $0

exit 0
