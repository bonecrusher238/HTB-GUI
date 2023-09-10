ver=''
configLoc='/etc/htb-gui/config.dat'

echo "-----------------------------------------------------------------"
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
echo "-----------------------------------------------------------------"
printf "\n"
printf "\n"
echo " Please select an option!"
echo " 1. Select a Host IP"
echo " 2. DNS enum"
echo " 3. Go Buster!"
echo " 4. burpsuite"
echo " 5. nmap"
read -p ":?> " Input

case $input in
1 | IP)
echo "Please enter the IPADDR"

;;
esac