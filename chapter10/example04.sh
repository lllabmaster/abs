#!/bin/bash

# Generating [list] in a for-loop, using "globbing"

echo

for file in *.sh  #  Bash performs filename expansion
	          #+ on expressions that globbing recognizes.
do
    ls -l "$file"  # List all files in $PWD (current directory).
done

echo

for file in [jx]*
do
    rm -f "$file"  # Removes only files beginning with "j" or "x" in $PWD. 
    echo "Removed file \"$file\"".
done

echo

exit 0
