#!/bin/bash

# What are all those mysterious binaries in `/usr/bin/X11'?

DIRECTORY="/usr/bin/X11"

for file in $DIRECTORY/*
do
    whatis `basename $file`    # Echoes info about the binary.
done

exit 0
