#!/bin/bash

infile=$0        # This script.
outfile=log.txt  # This output file left behind.
n=3
p=5

# Extracts characters n to p (3 to 5) from this script.
dd if="$infile" of="$outfile" bs=1 skip=$((n - 1)) count=$((p - n + 1)) 2> /dev/null

echo -n "hello world" | dd cbs=1 conv=unblock 2> /dev/null

exit 0
