#!/bin/bash

#  A script that splits itself into chuncks,
#+ then reassembles the chuncks into an exact copy of the original script.

CHUNKSIZE=4    # Size of first chunk of split files.
OUTPREFIX=xx   # csplit prefixes, by default, files with "xx" ...

csplit "$0" "$CHUNKSIZE"

cat "$OUTPREFIX"* > "$0.copy"
rm "$OUTPREFIX"*

exit $?
