#!/bin/bash
ver=''
configLoc='/tmp/htb-gui/config.dat'
setupVer=$(cat $configLoc | grep -w 'SETUP' | cut -d '=' -f2)
currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)

setupTest() {
    if [ ! "$setupVer" = "TRUE" ];
        then
            echo "You Skipped a step!"
            echo "Running Installer!"
            exit
    fi
}

mainMenu() {
    echo "------------------------------------------------------------------------------"
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
    echo "------------------------------------------------------------------------------"
    printf "\n"
    printf "\n"
    echo " Please select an option!                                 Current ADDR"  
    echo " 1. Select a Host IP                                        :?> $currIPADDR"
    echo " 2. DNS enum                                                :?> ENUM"
    echo " 3. Go Buster!"
    echo " 4. burpsuite"
    echo " 5. nmap"
    printf "\n"
    read -p ":?> " Input

case $input in
    1 | IP | ip)
    echo "Please enter the IPADDR"
    read -p ":?> " newIP
    echo "currIPADDR=$newIP" >> $configLoc
    ;;
    2 | dns)
    echo "This section is to allow your web browser to connect to a website"
    echo $currIPADDR
    ;;
    3 | gb | go | gobuster)

    ;;
    4 | bp | bs | burp | burpsuite)
    ;;

    5 | nmap | np)
    ;;

    *)
    exit
esac
}

# Script Starts
setupTest
mainMenu