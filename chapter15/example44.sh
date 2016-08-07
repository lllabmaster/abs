#!/bin/bash

# Self-mailing script.

adr=${1:-`whoami`}  # Default to current user, if not specified.

#  Typing 'self-mailer.sh wiseguy@superdupergenius.com'
#+ sends this script to that address.

#  For more on the ${parameter:-default} construct,
#+ see the "Parameter Substitution" section of
#+ the "Variable Revisited" chapter.

cat $0 | mail -s "Script \"`basename $0`\" has mailed itself to you." "$adr"

echo "At `date`, script \"`basename $0`\" mailed to "$adr"."

exit 0
