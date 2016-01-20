#!/bin/bash

# Backs up all files in current directory modified within last 24 hours in a "tarball".

# Embeds date in backup filename.
BACKUPFILE=backup-$(date +%m-%d-%Y)

# If no backup-archive filename specified on command line,
# it will default to "backup-MM-DD-YYYY.tar.gz."
archive=${1:-$BACKUPFILE}

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar

echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."

exit 0
