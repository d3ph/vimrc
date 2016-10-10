#!/bin/bash
#set -x
#networksetup -listallnetworkservices
#networksetup -listnetworkserviceorder
#networksetup -listallhardwareports

#constructor()
{
    TMPFILE=$(mktemp)
    cat <<- 'EOF' > $TMPFILE
		BEGIN {
		    FS="[ \t]*:[ \t]*";
		    flag=1;
		}
		{
		    if ($2 == "none") {
		        next;
		    }
		}
		/^IP address:/ {
		    print $2;
		    flag--;
		}
		END {
		    if (flag) {
		        print "none";
		    }
		    exit flag;
		}
		EOF
    trap finish EXIT
}
finish() {
    rm $TMPFILE
    #set +x
}
ping_service() {
    { networksetup -getinfo "$1" | gawk -f $TMPFILE | xargs -n1 -I{} ping -c1 {}; } >/dev/null 2>&1
}

ping_service "USB Ethernet" || ping_service "Display Ethernet" && { networksetup -setairportpower airport off; true; } || networksetup -setairportpower airport on
