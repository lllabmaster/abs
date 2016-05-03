#!/bin/bash

suff=txt
SUFF=TXT

for i in $(ls *.$suff)
do
    mv -f "$i" ${i%.$suff}.$SUFF
done

exit 0
