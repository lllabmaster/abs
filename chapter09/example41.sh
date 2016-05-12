#!/bin/bash

# This could be "sourced" from a separate file.
isdnMyProviderRemoteNet=172.16.0.100
isdnYourProviderRemoteNet=10.0.0.10
isdnOnlineService="MyProvider"

remoteNet=$(eval "echo \$$(echo isdn${isdnOnlineService}RemoteNet)")
echo "$remoteNet"  # 172.16.0.100

remoteNet=$(eval "echo \$$(echo isdnMyProviderRemoteNet)")
echo "$remoteNet"  # 172.16.0.100

remoteNet=$(eval "echo \$isdnMyProviderRemoteNet")
echo "$remoteNet"  # 172.16.0.100

remoteNet=$(eval "echo $isdnMyProviderRemoteNet")
echo "$remoteNet"  # 172.16.0.100

echo

chkMirrorArchs()
{
    arch="$1";
    if [ "$(eval "echo \${$(echo get$(echo -ne $arch |
         sed 's/^\(.\).*/\1/g' | tr 'a-z' 'A-Z'; echo $arch |
         sed 's/^.\(.*\)/\1/g')):-false}")" = true ]
    then
        return 0;
    else
        return 1;
    fi;
}

getSparc="true"
unset getIa64

chkMirrorArchs sparc
echo $? # 0

chkMirrorArchs Ia64
echo $? # 1

exit 0
