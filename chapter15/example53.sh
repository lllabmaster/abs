#!/bin/bash

# Erase "all" traces of a file.

#  This script overwrites a target file alternately with random bytes,
#+ then zeros before finally deleting it.
#  After that, even examining the raw disk sectors by conventional methods
#+ will not reveal the original file data.

PASSES=7        #  Number of file-shredding passes.
                #  Increasing this slows script execution,
                #+ especially on large target files.
BLOCKSIZE=1     #  I/O with /dev/urandom requires unit block size,
                #+ otherwise you get weird results.
E_BADARGS=70    #  Various error exit codes.
E_NOT_FOUND=71
E_CHANGED_MIND=72


if [ -z "$1" ]  # No filename specified.
then
    echo "Usage: `basename $0` filename"
    exit $E_BADARGS
fi

file=$1

if [ ! -e "$file" ]
then
    echo "File \"$file\" not found."
    exit $E_NOT_FOUND
fi

echo
echo -n "Are you absolutely sure you want to blot out \"$file\" (y/n)? "
read answer

case "$answer" in
    [nN])
	echo "Changed your mind, huh?"
	exit $E_CHANGED_MIND
	;;
    *   )
	echo "Blotting out file \"$file\"."
	;;
esac

flength=$(ls -l "$file" | awk '{print $5}')  # Field 5 is file length.

chmod u+w "$file"

pass_count=1
while [ "$pass_count" -le "$PASSES" ]
do
    echo "Pass #$pass_count"
    sync  # Flush buffers.
    dd if=/dev/urandom of="$file" bs=$BLOCKSIZE count=$flength
    sync  # Flush buffers.
    dd if=/dev/zero of="$file" bs=$BLOCKSIZE count=$flength
    sync
    let "pass_count += 1"
    echo
done

rm -f $file
sync

echo "File \"$file\" blotted out and deleted."

exit 0
