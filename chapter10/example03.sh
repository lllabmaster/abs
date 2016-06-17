#!/bin/bash

# Operating on a file list contained in a variable.

FILES="/usr/sbin/accept
       /usr/sbin/pwck
       /usr/sbin/chroot
       /usr/bin/fakefile
       /sbin/badblocks
       /sbin/ypbind"      # List of files you are curious about.
                          # Threw in a dummy file, /usr/bin/fakefile.

echo

for file in $FILES
do
    if [ ! -e "$file" ]  # Check if file exists.
    then
	echo "$file does not exist."; echo
	continue         # On to next.
    fi

    ls -hl $file | awk '{ print $9 ", file size: " $5 }' # Print 2 fields.
    whatis `basename $file`                              # File info.

    echo
done

exit 0
