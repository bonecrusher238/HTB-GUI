nmapLoc='/tmp/htb-gui/htb-nmap-port'
configLoc='/tmp/htb-gui/config.dat'
openPorts=$(cat $nmapLoc | grep -w 'Ports:' | cut -d ':' -f3 | tr '/' ' ' | tr -d ',')
currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
saveData=$(cat $configLoc | grep -w 'saveData' | cut -d '=' -f2)


refresh() {
    saveData=$(cat $configLoc | grep -w 'saveData' | cut -d '=' -f2)
    currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
    currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
}

verifyInfo() {
    if [[ $currIPADDR = ' ' ]] ;
    then
    echo Please enter a IP addr
    read -p ':?> ' newIP
    echo "currIPADDR=$newIP" >> $configLoc
    refresh
    else
    echo 'The Current IP is '$currIPADDR
    fi

    if [[ $currDnsADDR = ' ' ]] ;
    then
    echo Please enter a DNS addr
    read -p ':?> ' newDNS
    echo "currDnsADDR=$newDNS" >> $configLoc
    refresh
    else
    echo 'The current DNS is '$currDNSADDR
    fi
}

saveInfo() {
    echo would you like to save the nmap recon info?
    read -p ':?> ' save
    if [[ $save = 'yes' ]] ;
    then
    sed -i "/savedata/d" $configLoc
    echo "saveData=$save" >> $configLoc
    echo Saving Data
    else
    echo 'Not Saving'
    fi
}

