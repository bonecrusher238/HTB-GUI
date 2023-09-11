#!/bin/bash
configLoc='/tmp/htb-gui/config.dat'
binLoc='/usr/local/bin/'
installLoc=$(pwd)
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

copyHTB() {
if [[ ! -e '/usr/local/bin/htb.sh' ]] ;
  then
    echo HTB does not exist!
    echo Transfering HTB
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
    echo Transfering HTB
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

echo $installLoc
echo "Welcome to HTB Setup!"
echo "Doing all the work for you!"
createDir
copyHTB
copyHTBgo
copyHTBsetup