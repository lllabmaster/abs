#!/bin/bash

your_id=${USER}-on-${HOSTNAME}
echo "$your_id"

echo "Old \$PATH = $PATH"
PATH=${PATH}:/opt/bin
echo "New \$PATH = $PATH"

exit 0
