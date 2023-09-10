#!/bin/bash
configLoc='/tmp/htb-gui/config.dat'

echo "Welcome to HTB Setup!"
echo "Doing all the work for you!"

mkdir /tmp/htb-gui
echo > /tmp/htb-gui/config.dat

echo "##HTB-GUI CONFIG" >> $configLoc
echo "##THIS IS NOT MADE TO BE EDITED!" >> $configLoc
echo "SETUP=TRUE" >> $configLoc
echo "Complete!"
