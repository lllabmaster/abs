#!/bin/bash

#  This script looks up definitions in the 1913 Webster's Dictionary.
#  This Public Domain dictionary is available for download from various
#+ sites, including Project Guteberg.

#  Convert it from DOS to UNIX format (only LF at end of line)
#+ before using it with this script.
#  Store the file in plain, uncompressed ASCII.
#  Set DEFAULT_DICTFILE variable below to path/filename.

E_BADARGS=65
MAXCONTEXTLINES=50    # Maximum number of lines to show.
DEFAULT_DICTFILE="./wdict.txt"
                      # Default dictionary file pathname.
                      # Change this as necessary.

if [[ -z $(echo "$1" | sed -n '/^[A-Z]/p') ]]
#  Must at least specify word to look up, and
#+ it must start with an uppercase letter.
then
    echo "Usage: `basename $0` Word-to-define [dictionary-file]"
    echo
    echo "Note: Word to look up must start with capital letter,"
    echo "with the rest of the word in lowercase."
    echo "-----------------------------------------------------"
    echo "Examples: Abandon, Dictionary, Marking, etc."
    exit $E_BADARGS
fi

if [ -z "$2" ]        #  May Specify different dictionary as an
                      #+ argument to this script.
then
    dictfile="$DEFAULT_DICTFILE"
else
    dictfile="$2"
fi

# "fgrep" is fast enough to search even a very large text file.
definition=$(fgrep -A $MAXCONTEXTLINES "$1" "$dictfile")

# Delete last two lines of output (blank line and first line of next entry).
echo "$definition" | sed -n '1,/^[A-Z]/p' | sed '$d' | sed '$d'

exit 0
