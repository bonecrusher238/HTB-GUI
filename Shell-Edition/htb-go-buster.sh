#!/bin/bash
configLoc='/tmp/htb-gui/config.dat'
currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
dirWordList='/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt'

htbGoIntro() {
    echo "------------------------------------------------"
    printf "\n"
    printf "\n"
    echo "       HTB Go buster Module"
    printf "\n"
    printf "\n"
    echo " Current IP ADDR  :?> $currIPADDR"
    echo " Current DNS ADDR :?> $currDnsADDR"
    printf "\n"
    printf "\n"
    echo "------------------------------------------------"
}

refresh() {
    currIPADDR=$(cat $configLoc | grep -w 'currIPADDR' | cut -d '=' -f2)
    currDnsADDR=$(cat $configLoc | grep -w 'currDnsADDR' | cut -d '=' -f2)
}

goMainMenu() { 
    echo "------------------------------------------------"
    printf "\n"
    printf "\n"
    echo " 1. Directory Discovery"
    echo " 2. "
    echo " 3. "
    echo  "4. "
    printf "\n"
    read -p ":?> " mainInput

case $mainInput in
1)
echo "Starting Go buster!"
printf "\n"
printf "\n"
echo "Command gobuster dir -u <URL> -w <wordlist>"
gobuster dir -u $currDnsADDR -w $dirWordList
printf "\n"
printf "\n"
echo "Are you finished with gobuster? (y/n)"
read -p ":?> " dirInput
if [[ $dirInput == 'y' ]] ;
  then 
    htb.sh
  else
  goMainMenu
fi
;;
*)
htb.sh
;;
esac
}

htbGoIntro
goMainMenu
