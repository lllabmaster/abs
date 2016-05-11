#!/bin/bash

xyz23=whatever
xyz24=

a=${!xyz*}     # Expands to *names* of declared variables beginning with "xyz".
echo "a = $a"  # xyz23 xyz24

a=${!xyz@}     # Same as above.
echo "a = $a"  # xyz23 xyz24

exit 0
