#!/bin/bash
#nmapLoc='/tmp/htb-gui/htb-nmap-port'
configLoc='/tmp/htb-gui/config.dat'
currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
saveData=$(cat $configLoc | grep -w 'saveData' | cut -d '=' -f2)


refresh() {
    saveData=$(cat $configLoc | grep -w 'saveData' | cut -d '=' -f2)
    currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
    currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
}

verifyInfo() {
    if [[ $currIPADDR = 'NULL' ]] ;
     then
        printf "\n"
        echo Please enter a IP addr
        printf "\n"
        read -p ':?> ' newIP
        printf "\n"
        printf "\n"
        sudo sed -i "/currIPADDR/d" $configLoc
        echo "currIPADDR=$newIP" >> $configLoc
        refresh
     else
        echo 'The Current IP is '$currIPADDR
    fi

    if [[ $currDnsADDR = 'NULL' ]] ;
     then
        echo Please enter a DNS addr
        printf "\n"
        read -p ':?> ' newDNS
        printf "\n"
        printf "\n"
        sudo sed -i "/currDnsADDR/d" $configLoc
        echo "currDnsADDR=$newDNS" >> $configLoc
        refresh
     else
        printf "\n"
        printf "\n"
        echo 'The current DNS is '$currDnsADDR
    fi
}

saveInfo() {
    echo $currDNSADDR
    echo $currIPADDR
    printf "\n"
    printf "\n"
    echo "Would you like to save the nmap recon info?(y/n)"
    printf "\n"
    read -p ':?> ' save
    if [[ $save = 'y' ]] ;
     then
        sudo sed -i "/saveData/d" $configLoc
        echo "saveData=true" >> $configLoc
        refresh
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
    mkdir ~/Desktop/$currIPADDR
    cd ~/Desktop/$currIPADDR
    echo $(pwd)
    nmap -oN -Pn LightScan.txt $currIPADDR
    nmap -sC -sV -oN -Pn MedScan.txt $currIPADDR
    nmap -sC -sV -oN -p- -Pn FullScan.txt $currIPADDR
    nmap -script vuln -sV -oN VulnScan.txt $currIPADDR
}

nmapNoSaveCMD() {
    echo try this later idc to implement now
}

verifyInfo
saveInfo
refresh

if [[ $saveData = 'true' ]] ;
    then
        Echo "Running Script!"
        nmapSaveDataCMD
    else
        nmapNoSaveCMD
fi

