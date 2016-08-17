#!/bin/bash

E_BADARGS=65    # Need at least two args.
TWO_WINKS=2     # How long to sleep.
THR_WINKS=3
IDPORT=113      # Authentication "tap ident" port.
RAND1=999
RAND2=31337
TIMEOUT0=9
TIMEOUT1=8
TIMEOUT2=4

case "${2}" in
    ""   )
	echo "Need HOST and at least one PORT."
	exit $E_BADARGS
	;;
esac

# Ping 'em once and see if they *are* running identd.
nc -z -w $TIMEOUT0 "$1" $IDPORT || \
    { echo "Oops, $1 isn't running identd."; exit 0; }
# -z scans for listening daemons.
# -w $TIMEOUT = How long to try to connect.

# Generate a randomish base port.
RP=`expr $$ % $RAND1 + $RAND2`

TRG="$1"

shift

while test "$1"
do
    nc -v -w ${TIMEOUT1} -p ${RP} "$TRG" ${1} < /dev/null > /dev/null &
    PROC=$!
    sleep $THR_WINKS
    echo "${1},${RP}" | nc -w $TIMEOUT2 -r "$TRG" $IDPORT 2>&1
    sleep $TWO_WINKS

    kill -HUP $PROC
    RP=`expr ${RP} + 1`
    shift
done

exit $?
