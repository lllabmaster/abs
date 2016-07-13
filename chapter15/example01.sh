#!/bin/bash

# Script to automate burning a CDR.

SPEED=2          # May use higher speed if your hardware supports it.
IMAGEFILE=cdimage.iso
CONTENTSFILE=contents
DEVICE=cdrom
DEFAULTDIR=/opt  # This is the directory containing the data to be burned.
                 # Make sure it exists.

if [ -z "$1" ]
then
    IMAGE_DIRECTORY=$DEFAULTDIR
else
    IMAGE_DIRECTORY=$1
fi

# Create a "table of contents" file.
ls -1RF $IMAGE_DIRECTORY > $IMAGE_DIRECTORY/$CONTENTSFILE
echo "Creating table of contents."

# Create an image file preparatory to burning it onto the CDR.
mkisofs -r -o $IMAGEFILE $IMAGE_DIRECTORY
echo "Creating ISO9660 file system image ($IMAGEFILE)."

# Burn the CDR.
echo "Burning the disk."
echo "Please be patient, this will take a while."
cdrecord -v -isosize speed=$SPEED dev=$DEVICE $IMAGEFILE

exit $?
