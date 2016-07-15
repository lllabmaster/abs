#!/bin/bash

# Delete filenames in current directory containing bad characters.

for filename in *
do
    badname=`echo "$filename" | sed -n /[\+\{\;\"\\\=\?~\(\)\<\>\&\*\|\$]/p`
    rm $badname 2>/dev/null
done

# Now, take care of files containing all manner of whitespace.
find . -name "* *" -exec rm -f {} \;

exit 0
