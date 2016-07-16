#!/bin/bash

# Generates a log file in current directory.

LINES=5

# Time and machine name.
( date; uname -a ) >> logfile

echo --------------------------------- >> logfile
tail -n $LINES /tmp/messages | xargs | fmt -s >> logfile
echo >> logfile
echo >> logfile

exit 0
