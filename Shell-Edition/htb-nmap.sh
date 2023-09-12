nmapLoc='/tmp/htb-gui/htb-nmap-port'
openPorts=$(cat $nmapLoc | grep -w 'Ports:' | cut -d ':' -f3 | tr '/' ' ' | tr -d ',')