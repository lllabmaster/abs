#!/bin/bash

# Checking whether files in a given directory have been tampered with.

E_DIR_NOMATCH=70
E_BAD_DBFILE=71

# Filename for storing records (database file).
dbfile=file_record.md5

set_up_database()
{
    echo ""$directory"" > "$dbfile"
    md5sum "$directory"/* >> "$dbfile"
}

check_database()
{
    local n=0
    local filename
    local checksum

    if [ ! -r "$dbfile" ]
    then
	echo "Unable to read checksum database file!"
	exit $E_BAD_DBFILE
    fi

    while read record[n]
    do
	directory_checked="${record[0]}"

	if [ "$directory_checked" != "$directory" ]
	then
	    echo "Directories do not match up!"
	    exit $E_DIR_NOMATCH
	fi

	if [ "$n" -gt 0 ]
	then
	    filename[n]=$( echo ${record[$n]} | awk '{ print $2 }' )
	    checksum[n]=$( md5sum "${filename[n]}" )

	    if [ "${record[n]}" = "${checksum[n]}" ]
	    then
		echo "${filename[n]} unchanged."
	    elif [ "`basename ${filename[n]}`" != "$dbfile" ]
	    then
		echo "${filename[n]} : CHECKSUM ERROR!"
	    fi
	fi

	let "n+=1"
    done < "$dbfile"  # Read from checksum database file.
}

if [ -z "$1" ]
then
    directory="$PWD"  # If not specified, use current working directory.
else
    directory="$1"
fi

clear

echo "Running file integrity check on $directory"
echo

if [ ! -r "$dbfile" ]
then
    echo "Setting up database file, \""$directory"/"$dbfile"\"."
    echo
    set_up_database
fi

check_database

exit 0
