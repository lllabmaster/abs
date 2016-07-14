#!/bin/bash

#  example02.sh: Saying "hello" or "goodbye"
#+               depending on how script is invoked.

# Make a link in current working directory ($PWD) to this script:
#     ln -s example02.sh goodbye
# Now, try invoking this script both ways:

# $ bash example02.sh
# $ bash goodbye

HELLO_CALL=65
GOODBYE_CALL=66

if [ $0 = "goodbye" ]
then
    echo "Good-bye!"
    exit $GOODBYE_CALL
fi

echo "Hello!"

exit $HELLO_CALL
