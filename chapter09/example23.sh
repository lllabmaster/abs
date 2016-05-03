#!/bin/bash

# Rename all filenames in $PWD with "TXT" suffix to a "txt" suffix.
# For example, "file1.TXT" becomes "file1.txt" ...

SUFF=TXT
suff=txt

for i in $(ls *.$SUFF)
do
    mv -f $i ${i%.$SUFF}.$suff
done

exit 0
