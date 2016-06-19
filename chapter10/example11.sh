#!/bin/bash

# Lists symbolic links in a directory.

directory=${1-`pwd`}
#  Defaults to current working directory,
#+ if not otherwise specified.
#  Equivalent to code block below.

ARGS=1

if [ $# -ne "$ARGS" ]
then
    directory=`pwd`
else
    directory=$1
fi

echo "symbolic links in directory \"$directory\""

for file in "$( find $directory -type l )"  # -type l = symbolic links
do
    echo "$file"
done | sort

exit 0
