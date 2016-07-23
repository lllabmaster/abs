#!/bin/bash

filename=sys.log

cat /dev/null > $filename; echo "Creating / cleaning out file."

tail /var/log/syslog > $filename
echo "$filename contains tail end of system log."

exit 0
