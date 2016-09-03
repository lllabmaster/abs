#!/bin/bash

FILENAME="$0"

name=$(stat -c %n "$FILENAME")
size=$(stat -c %s "$FILENAME")
type=$(stat -c %F "$FILENAME")
owner=$(stat -c %U "$FILENAME")
inode=$(stat -c %i "$FILENAME")
right=$(stat -c %A "$FILENAME")

echo "File name: $name"
echo "File size: $size"
echo "File type: $type"
echo "File owner: $owner"
echo "File inode: $inode"
echo "File access rights: $right"

exit 0
