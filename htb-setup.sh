#!/bin/bash
configFolderLoc='/tmp/htb-gui'
configLoc='/tmp/htb-gui/config.dat'
binLoc='/usr/local/bin/'
htbLoc='/usr/local/bin/htb.sh'
nmapLoc='/usr/local/bin/htb-nmap.sh'
installLoc=$(pwd)


removeDir() {
  sudo rmdir $configFolderLoc
  sudo rm $htbLoc
  sudo rm /usr/local/bin/htb-go-buster.sh
  sudo rm /usr/local/bin/htb-setup.sh
  sudo rm $nmapLoc
}

createDir() {
if [[ ! -d /tmp/htb-gui ]] ;
  then
    echo config does not exist!
    mkdir /tmp/htb-gui
    echo > /tmp/htb-gui/config.dat
    echo "##HTB-GUI CONFIG" >> $configLoc
    echo "##THIS IS NOT MADE TO BE EDITED!" >> $configLoc
    echo "SETUP=TRUE" >> $configLoc
  else
    echo Config Exists
fi
}
copyNmap() {
if [[ ! -e $nmapLoc ]] ;
  then
    echo HTB-Nmap does not exist!
    cd $installLoc
    cd Shell-Edition
    sudo cp htb-nmap.sh $binLoc 
  else
  echo HTB Exists
fi
}

copyHTB() {
if [[ ! -e '/usr/local/bin/htb.sh' ]] ;
  then
    echo HTB does not exist!
    cd $installLoc
    cd Shell-Edition
    sudo cp htb.sh $binLoc 
  else
  echo HTB Exists
fi
}

copyHTBgo() {
if [[ ! -e '/usr/local/bin/htb-go-buster.sh' ]] ;
  then
   echo HTBgo does not exist!
    cd $installLoc
    cd Shell-Edition
    sudo cp htb-go-buster.sh $binLoc
  else
  echo HTBgo Exists
fi
}

copyHTBsetup() {
if [[ ! -e '/usr/local/bin/htb-setup.sh' ]] ;
  then
    echo HTBsetup does not exist!
    cd $installLoc
    sudo cp htb-setup.sh $binLoc
  else
  echo HTBsetup Exists
fi
}
echo "Complete!"

main() {
echo $installLoc
echo "Welcome to HTB Setup!"
echo "Does this program need to do?"
echo " 1. Installed"
echo " 2. Reinstalled"
echo " 3. Uninstalled"
echo " 4. Run System Auto Config"
echo " 4. Exit"
printf "\n"
read -p " :?> " mainInput
case $mainInput in

1 | install)
createDir
copyHTB
copyHTBgo
copyNmap
copyHTBsetup
;;
2 | Reinstalled | reinstall)
removeDir
createDir
copyHTB
copyHTBgo
copyHTBsetup
copyNmap
;;
3 | uninstalled | uninstall)
removedir
;;
4 | sysconfig)


;;
* | exit)
;;
esac
}

main