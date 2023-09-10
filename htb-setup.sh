#!/bin/bash
configLoc='/tmp/htb-gui/config.dat'
binLoc='/usr/local/bin/'

echo "Welcome to HTB Setup!"
echo "Doing all the work for you!"

mkdir /tmp/htb-gui
echo > /tmp/htb-gui/config.dat

echo "##HTB-GUI CONFIG" >> $configLoc
echo "##THIS IS NOT MADE TO BE EDITED!" >> $configLoc
echo "SETUP=TRUE" >> $configLoc

sudo cp ~/Desktop/HTB-GUI/Shell-Edition/htb.sh $binLoc
sudo cp ~/Desktop/HTB-GUI/Shell-Edition/htb-dns-enum.sh $binLoc
sudo cp ~/Desktop/HTB-GUI/Shell-Edition/htb-go-buster.sh $binLoc
echo "Complete!"
