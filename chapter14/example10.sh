#!/bin/bash

dfile=$1

# var1 set to the entire first line of the input file "data-file".
read var1 < "$dfile"
echo "var1 = $var1"

read var2 var3 < "$dfile"
echo "var2 = $var2  var3 = $var3"

echo "---------------"

while read line
do
    echo "$line"
done < "$dfile"

echo "---------------"

# Use "$IFS" (Internal Field Separator Variable) to split a line of input
# to "read", if you do not want the default to be whitespace.

echo "List of all users:"
OIFS=$IFS; IFS=:   # /etc/passwd uses ":" for field separator.

while read name passwd uid gid fullname ignore
do
    echo "$name ($fullname)"
done < /etc/passwd

IFS=$OIFS

exit 0
