#!/bin/bash

# DOS to UNIX text file converter.

E_WRONGARGS=65

if [ -z "$1" ]
then
    echo "Usage: `basename $0` filename-to-convert"
    exit $E_WRONGARGS
fi

NEWFILENAME=$1.unx

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

# Delete CR's and write to new file.
tr -d $CR < $1 > $NEWFILENAME

echo "Original DOS text file is \"$1\"."
echo "Converted UNIX text file is \"$NEWFILENAME\"."

exit 0
