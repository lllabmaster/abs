#!/bin/bash

# Check some of the system's environmental variables.
# This is good preventative maintenance.

: ${HOSTNAME?} ${USER?} ${HOME?} ${MAIL?}
echo
echo "Name of the machine is $HOSTNAME."
echo "You are $USER."
echo "Your home directory is $HOME."
echo "Your mail INBOX is located in $MAIL."
echo
echo "If you are reading this message,"
echo "critical environmental variables have been set."
echo
echo


#  The ${variablename?} construction can also check
#+ for variables set within the script.

ThisVariable=Value-of-ThisVariable
: ${ThisVariable?}  
echo "Value of ThisVariable is $ThisVariable."
echo
echo

: ${ZZXy23AB?"ZZXy23AB Error MSG."}
