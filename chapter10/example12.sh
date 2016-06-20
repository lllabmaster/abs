#!/bin/bash

# Lists symbolic links in a directory.

OUTFILE=symlinks.list     # save file.

# Defaults to current working directory, if not otherwise specified.
directory=${1-`pwd`}

echo "symbolic links in directory \"$directory\"" >  "$OUTFILE"
echo "------------------------------------------" >> "$OUTFILE"

for file in "$( find $directory -type l )"
do
    echo "$file"
done | sort >> "$OUTFILE"

exit 0
