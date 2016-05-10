#!/bin/bash

# Rename file extensions.
# Example:
# To rename all *.gif files in working directory to *.jpg,
# $ sh rename.sh gif jpg

E_BADARGS=65

case $# in
    0|1)  # The vertical bar means "or" in this context.
	echo "Usage: `basename $0` old_file_suffix new_file_suffix"
	exit $E_BADARGS
	;;
esac

# Traverse list of files ending with 1st argument.
for filename in *.$1
do
    mv $filename ${filename%$1}$2
done

exit 0
