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
        printf "\n"
        echo Please enter a IP addr
        printf "\n"
        read -p ':?> ' newIP
        printf "\n"
        printf "\n"
        echo "currIPADDR=$newIP" >> $configLoc
        refresh
     else
        echo 'The Current IP is '$currIPADDR
    fi

    if [[ $currDnsADDR = ' ' ]] ;
     then
        echo Please enter a DNS addr
        printf "\n"
        read -p ':?> ' newDNS
        printf "\n"
        printf "\n"
        echo "currDnsADDR=$newDNS" >> $configLoc
        refresh
     else
        printf "\n"
        printf "\n"
        echo 'The current DNS is '$currDNSADDR
    fi
}

saveInfo() {
    printf "\n"
    printf "\n"
    echo "Would you like to save the nmap recon info?(yes/no)"
    printf "\n"
    read -p ':?> ' save
    if [[ $save = 'yes' ]] ;
     then
        sed -i "/savedata/d" $configLoc
        echo "saveData=true" >> $configLoc
        printf "\n"
        printf "\n"
        echo Saving Data
     else
        echo "saveData=false" >> $configLoc
        printf "\n"
        printf "\n"
        echo 'Not Saving'
    fi
}
nmapSaveDataCMD() {
    saveLoc="~/Desktop/$currIPADDR:$currDNSADDR"
    mkdir ~/Desktop/$currIPADDR:$currDNSADDR
    cd $saveLoc
    echo $(pwd)
    bash -c "qterminal -e nmap -oA -Pn LightScan.txt $currIPADDR"
    bash -c "qterminal -e nmap -sC -sV -oA -Pn MedScan.txt $currIPADDR"
    bash -c "qterminal -e nmap -sC -sV -oA -Pn LgScan.txt $currIPADDR"
    bash -c "qterminal -e nmap -sC -sV -oA -p- -Pn FullScan.txt $currIPADDR"
    bash -c "qterminal -e nmap -script vuln -sV -oA VulnScan.txt $currIPADDR"
}

nmapNoSaveCMD() {
    echo try this later idc to implement now
}

verifyInfo
saveInfo

if [[ $saveData == 'true' ]] ;
    then
        nmapSaveDataCMD
    else
        nmapNoSaveCMD
fi

