#!/bin/bash

COUNT=2
HNAME="www.baidu.com"

if [[ `ping -c $COUNT "$HNAME"` ]]
then
    echo ""$HNAME" still up and broadcasting spam your way."
else
    echo ""$HNAME" seems to be down. Pity."
fi

exit 0
