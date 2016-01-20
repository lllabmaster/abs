#!/bin/bash

# Redirecting stdin using 'exec'.
# 'exec < filename' command redirects 'stdin' to a file.
# From that point on, all 'stdin' comes from that file,
# rather than its normal source.

# This provides a method of reading a file line by line
# and possibly parsing each line of input using 'sed'/'awk'.

exec 6<&0         # Link file descriptor #6 with stdin.
                  # Saves stdin.

exec < data-file  # stdin replaced by file "data-file".

read a1           # Reads first line of file "data-file".
read a2           # Reads second line of file "data-file".

echo
echo "Following lines read from file."
echo "-------------------------------"
echo $a1
echo $a2

echo; echo; echo

exec 0<&6 6<&-
# Now restore stdin from fd #6, where it had been saved,
# and close fd #6 ( 6<&- ) to free it for other processes to use.
#
# <&6 6<&- also works.

echo -n "Enter data "
read b1 # Now "data" functions as expected, reading from normal stdin.
echo "Input read from stdin."
echo "----------------------"
echo "b1 = $b1"

echo

exit 0
