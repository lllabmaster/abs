#!/bin/bash

# '0d' is the hex equivalent of Control-M.
# The '-s' makes anything typed silent, so it is necessary to go to new line explicitly.
read -n 1 -s -p $'Control-M leaves cursor at beginning of this line. Press Enter. \x0d'
echo >&2

# '0a' is the hex equivalent of Control-J, linefeed.
read -n 1 -s -p $'Control-J leaves cursor on next line. \x0a'
echo >&2

# Control-K is vertical tab.
read -n 1 -s -p $'And Control-K\x0bgoes straight down.'
echo >&2

# A better example of the effect of a vertical tab is:
var=$'\x0aThis is the bottom line\x0bThis is the top line\x0a'
echo "$var"

# This works the same way as the above example. However:
echo "$var" | col

exit 0
