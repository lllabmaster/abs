#!/bin/bash

# If the $TMOUT environmental variable is set to a non-zero value time, then
#+ the shell prompt will time out after $time seconds. This will cause a logout.

TMOUT=3  # Prompt times out at three seconds.

echo "What is your favourite song?"
echo "Quickly now, you only have $TMOUT seconds to answer!"
read song

if [ -z "$song" ]
then
    song="(no answer)"
    # Default response.
fi

echo "Your favourite song is $song."
