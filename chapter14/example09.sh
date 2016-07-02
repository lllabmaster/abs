#!/bin/bash

uparrow=$'\x1b[A'
downarrow=$'\x1b[B'
leftarrow=$'\x1b[D'
rightarrow=$'\x1b[C'

home=$'\x1b[H'
end=$'\x1b[F'
pgup=$'\x1b[5~'
pgdown=$'\x1b[6~'

read -s -p "Hit an arrow key... Hit <ENTER> to Submit..." x

case "$x" in
    "$uparrow"    )
	echo "Up-arrow hit."
	;;
    "$downarrow"  )
	echo "Down-arrow hit."
	;;
    "$leftarrow"  )
	echo "Left-arrow hit."
	;;
    "$rightarrow" )
	echo "Right-arrow hit."
	;;
    "$home"       )
	echo "Home hit."
	;;
    "$end"        )
	echo "End  hit."
	;;
    "$pgup"       )
	echo "PgUp hit."
	;;
    "$pgdown"     )
	echo "PgDn hit."
	;;
    *             )
	echo "Other key."
	;;
esac

exit 0
