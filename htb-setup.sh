#!/bin/bash
configFolderLoc='/tmp/htb-gui'
configLoc='/tmp/htb-gui/config.dat'
binLoc='/usr/local/bin/'
htbLoc='/usr/local/bin/htb.sh'
sysvarLoc='/usr/local/bin/SystemConfig'
nmapLoc='/usr/local/bin/htb-nmap.sh'
installLoc=$(pwd)


removeDir() {
  sudo rm $configLoc 
  sudo rm /usr/local/bin/SystemConfig/sysvar.sh  || echo sysvar.sh does not exist or was not installed! This could be an error!
  sudo rm /usr/local/bin/SystemConfig/zshenv || echo zshenv backup does not exist r was not installed!! This could be an error!
  sudo rmdir $sysvarLoc || echo SystemConfig does not exist or was not installed!! This could be an error!
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
    sudo chmod 777 /tmp/htb-gui/config.dat
    echo "##HTB-GUI CONFIG" >> $configLoc
    echo "##THIS IS NOT MADE TO BE EDITED!" >> $configLoc
    echo "SETUP=TRUE" >> $configLoc
    echo "currIPADDR=NULL" >> $configLoc
    echo "currDnsADDR=NULL" >> $configLoc
    echo "saveData=NULL" >> $configLoc
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
    sudo chmod +x $nmapLoc
  else
  echo HTB Exists
fi
}

copySysVar() {
if [[ ! -e $sysvarLoc ]] ;
  then
    echo Sys-Var does not exist! Fixing that!
    sudo mkdir /usr/local/bin/SystemConfig
    cd $installLoc 
    cd SystemConfig
    sudo cp sysvar.sh $sysvarLoc
    sudo cp zshenv $sysvarLoc
    sudo chmod +x /usr/local/bin/SystemConfig/sysvar.sh
    sudo chmod 777 /usr/local/bin/SystemConfig/zshenv
    sudo chmod 777 $sysvarLoc
  else
  echo Sys-Var Exists
fi
}

copyHTB() {
if [[ ! -e '/usr/local/bin/htb.sh' ]] ;
  then
    echo HTB does not exist! Fixing that!
    cd $installLoc
    cd Shell-Edition
    sudo cp htb.sh $binLoc 
    sudo chmod +x $htbLoc
  else
  echo HTB Exists
fi
}

copyHTBgo() {
if [[ ! -e '/usr/local/bin/htb-go-buster.sh' ]] ;
  then
   echo HTBgo does not exist! Fixing that!
    cd $installLoc
    cd Shell-Edition
    sudo cp htb-go-buster.sh $binLoc
    sudo chmod +x /usr/local/bin/htb-go-buster.sh
  else
  echo HTBgo Exists
fi
}

copyHTBsetup() {
if [[ ! -e '/usr/local/bin/htb-setup.sh' ]] ;
  then
    echo HTBsetup does not exist! Fixing that!
    cd $installLoc
    sudo cp htb-setup.sh $binLoc
    sudo chmod +x /usr/local/bin/htb-setup.sh
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
echo This did not install ENV varibles!
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
copySysVar
;;
* | exit)
;;
esac
}

main