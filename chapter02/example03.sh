#!/bin/bash
# Cleanup, version 3

# Warning:
# --------
# This script uses quite a number of features that will be explained later on.
# By the time you've finished the first half of the book,
# there should be nothing mysterious about it.

LOG_DIR=/var/log
ROOT_UID=0   # Only users with $UID 0 have root privileges.
LINES=50     # Default number of lines saved.
E_XCD=66     # Can't change directory?
E_NOTROOT=67 # Non-root exit error.

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

# Test if command line argument present (non-empty).
if [ -n "$1" ]; then
    lines=$1
else
    lines=$LINES # Default, if not specified on command line.
fi

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]
then
    echo "Can't change to $LOG_DIR."
    exit $E_XCD
fi # Double check if in right directory, before messing with log file.

tail -n $lines messages > mesg.temp # Saves last section of message log file.
mv mesg.temp messages               # Becomes new log directory.

cat /dev/null > wtmp
echo "Logs cleaned up."

# A zero return value from the script upon exit indicates success to the shell.
exit 0
