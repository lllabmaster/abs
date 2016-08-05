#!/bin/bash

# Identifying spam domains.

# Whitespace == :Space:Tab:Line Feed:Carriage Return:
WSP_IFS=$'\x20'$'\x09'$'\x0A'$'\x0D'

# No Whitespace == Line Feed:Carriage Return
NO_WSP=$'\x0A'$'\x0D'

# Field separator for dotted decimal ip address.
ADR_IFS=${NO_WSP}'.'

# Get the dns text resource record.
# get_txt <error_code> <list_query>
get_txt()
{
    # Parse $1 by assignment at the dots.
    local -a dns

    IFS=$ADR_IFS
    dns=( $1 )

    IFS=$WSP_IFS
    if [ "${dns[0]}" == '127' ]
    then
	echo $(dig +short $2 -t txt)
    fi
}

# Get the dns address resource record.
# chk_adr <rev_dns> <list_server>
chk_adr()
{
    local reply
    local server
    local reason

    server=${1}${2}
    reply=$(dig +short ${server})

    # If reply might be an error code ...
    if [ ${#reply} -gt 6 ]
    then
	reason=$(get_txt ${reply} ${server})
	reason=${reason:-${reply}}
    fi

    echo ${reason:-' not blacklisted.'}
}

# Need to get the IP address from the name.
echo 'Get address of: '$1
ip_adr=$(dig +short $1)
dns_reply=${ip_adr:-' no answer '}
echo ' Found address: '${dns_reply}

# A valid reply is at least 4 digits plus 3 dots.
if [ ${#ip_adr} -gt 6 ]
then
    echo
    declare query

    # Parse by assignment at the dots.
    declare -a dns
    IFS=$ADR_IFS
    dns=( ${ip_adr} )
    IFS=$WSP_IFS

    # Reorder octets into dns query order.
    rev_dns="${dns[3]}"'.'"${dns[2]}"'.'"${dns[1]}"'.'"${dns[0]}"'.'

    # See: http://www.spamhaus.org (Conservative, well maintained)
    echo -n 'spamhaus.org says: '
    echo $(chk_adr ${rev_dns} 'sbl-xbl.spamhaus.org')

    # See: http://ordb.org (Open mail relays)
    echo -n '    ordb.org says: '
    echo $(chk_adr ${rev_dns} 'relays.ordb.org')

    # See: http://www.spamcop.net/ (You can report spammers here)
    echo -n ' spamcop.net says: '
    echo $(chk_adr ${rev_dns} 'bl.spamcop.net')

    # See: http://cbl.abuseat.org
    echo -n ' abuseat.org says: '
    echo $(chk_adr ${rev_dns} 'cbl.abuseat.org')

    # See: http://dsbl.org/usage (Various mail relays)
    echo
    echo 'Distributed Server Listings'
    echo -n '       list.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'list.dsbl.org')

    echo -n '   multihop.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'multihop.dsbl.org')

    echo -n 'unconfirmed.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'unconfirmed.dsbl.org')
else
    echo
    echo 'Could not use that address.'
fi

exit 0
