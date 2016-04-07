#!/bin/bash

# This is the analog to the pwd builtin command.

E_WRONG_DIRECTORY=73

clear # Clear screen.

TargetDirectory=/tmp

cd $TargetDirectory
echo "Deleting stale files in $TargetDirectory."

if [ "$PWD" != "$TargetDirectory" ]
then  # Keep from wiping out wrong directory by accident.
    echo "Wrong directory!"
    echo "In $PWD, rather than $TargetDirectory!"
    echo "Bailing out!"
    exit $E_WRONG_DIRECTORY
else
    rm -rf *
    rm .[A-Za-z0-9]* # Delete dotfiles.

    echo
    echo "Done."
    echo "Old files deleted in $TargetDirectory."
    echo
    exit 0
fi
