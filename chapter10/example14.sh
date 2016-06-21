#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65
MODEM_PORT="/dev/ttyS2"  # PCMCIA modem card default port.

# Check for proper number of command line args.
if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: `basename $0` phone# text-file"
    exit $E_BADARGS
fi

if [ ! -f "$2" ]
then
    echo "File $2 is not a text file."
    exit $E_BADARGS
fi

fax make $2               # Create fax-formatted files from text files.

for file in $(ls $2.0*)   #  Concatenate the converted files.
	                  #  Uses wild card (filename "globbing")
	                  #+ in variable list.
do
    fil="$fil $file"
done

efax -d "$MODEM_PORT" -t "T$1" $fil   # Finally, do the work.

exit $?
