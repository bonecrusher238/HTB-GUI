#!/bin/bash
ver=''
configLoc='/tmp/htb-gui/config.dat'
setupVer=$(cat $configLoc | grep -w 'SETUP' | cut -d '=' -f2)
currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)

# tests for inital set up being ran
setupTest() {
    if [ ! "$setupVer" = "TRUE" ];
        then
        htb-setup.sh
    fi
}
#this is to refresh all varibles 
refresh() {
    setupVer=$(cat $configLoc | grep -w 'SETUP' | cut -d '=' -f2)
    currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
    currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
}
#intro menu
introMenu() {
    echo "-----------------------------------------------------------------------------"
    printf "\n" 
    printf "\n"
    printf "\n"
    printf "\n"
    echo "                     Hack the box GUI"
    echo "                                     Created by Bone."
    printf "\n"
    echo "  This program is simply for remembering commands and making life easier"
    echo "    This has no affiliation with anyone or any place"
    echo "      This does not claim ownership nor rights of any other reasource used"
    echo "-----------------------------------------------------------------------------"
}
mainMenu() {
    printf "\n"
    printf "\n"
    echo " Please select an option!"  
    echo " 1. Select a Host IP                  Current IP ADDR       :?> $currIPADDR"
    echo " 2. DNS enum                          Cureent DNS ADDR      :?> $currDnsADDR"
    echo " 3. Go Buster!"
    echo " 4. burpsuite"
    echo " 5. nmap"
    printf "\n"
read -p ":?> " input

case $input in
1 | IP | ip)
    echo "Please enter the IPADDR"
    read -p ":?> " newIP
    echo "currIPADDR=$newIP" >> $configLoc
    sed -i "/currIPADDR/d" $configLoc
    echo "The IPADDR has been changed to $currIPADDR"
    refresh
    mainMenu
;;
2 | dns)
    echo "This section is to allow your web browser to connect to a website"
    echo "echo <IPADDR> <DNS> | sudo tee -a /etc/hosts"
    printf "\n"
    echo "Your current DNS ADDR"
    echo ":?> $currDnsADDR"
    echo ":?> $currIPADDR"
    printf "\n"
    printf "\n"
    echo "Please Enter in the DNS!"
    read -p ":?> " newdnsInput
    echo "adding DNS $newdnsInput"
    sed -i "/currDnsADDR/d" $configLoc
    echo "currDnsADDR=$newdnsInput" >> $configLoc
    refresh
    echo $currIPADDR $currDnsADDR | sudo tee -a /etc/hosts
    mainMenu

;;
3 | gb | go | gobuster)

;;
4 | bp | bs | burp | burpsuite)
bash -c 'gnome-terminal -x burpsuite'
mainMenu
;;

5 | nmap | np)
;;
esac


}
setupTest
introMenu
mainMenu
