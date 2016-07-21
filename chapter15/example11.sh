#!/bin/bash

# Exercising the 'date' command.

echo "The number of days since the year's beginning is `date +%j`."
echo "The number of seconds elapsed since 01/01/1970 is `date +%s`."

perfix=temp
suffix=$(date +%s)
filename=$perfix.$suffix
echo $filename

#  It's great for creating "unique" temp fimenames,
#+ even better than using $$.

exit 0
