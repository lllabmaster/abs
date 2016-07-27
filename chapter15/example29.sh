#!/bin/bash

WIDTH=40                 # 40 columns wide.
BIN=`ls /usr/local/bin`  # Get a file listing...

echo $BIN | fmt -w $WIDTH

exit 0
