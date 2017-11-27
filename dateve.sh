#!/bin/bash
# Dateve - System Updater with menu
# Written by: Blkzer0. Version 1.0

ueverything(){
echo " Updating....."
echo ""
apt-get update 
apt-get upgrade -y
sleep 2
echo "Updating Metasploit Framework" 
apt-get install metasploit-framework
sleep 2
echo "Updating Exploit Database"
searchsploit --update
sleep 1
echo "Updating Ruby And Python"
ruby
echo "Updating Database, may take awhile"
updatedb
echo "Database update complete,Running cleanup"
sleep 2 
apt autoremove -y
apt clean
sleep 2
echo "Full system update completed"
}

dist(){
echo " ATTENTION, This upgrade Requires A Reboot to Install any New Packages"
read -p " Do you wish to continue? [y,n]:" fish
if [ $fish == 'y' ]
then
apt-get dist-upgrade
apt autoremove -y 
sleep 3
echo " Rebooting system "
sleep 3
reboot
elif [ $fish == 'n' ]
then
exit
fi
}

msf(){
apt-get install metasploit-framework #msfupdate does not work in Parrot-OS.
sleep 1 
searchsploit --update
echo " Exploits Updated!"
}

ruby(){
sudo -H pip install pipdate #installs pipdate if you dont have it already.
sudo -H pipdate #upgrades all dependencies [until pip implements --upgrade flag.]
gem update
}

update(){
echo " Updating Database, May take awhile...."
updatedb
}

clean(){
apt update
apt autoremove -y
apt clean
}

echo ""
echo " ██▄   ██     ▄▄▄▄▀ ▄███▄      ▄   ▄███▄   "
echo " █  █  █ █ ▀▀▀ █    █▀   ▀      █  █▀   ▀  "
echo " █   █ █▄▄█    █    ██▄▄   █     █ ██▄▄    "
echo " █  █  █  █   █     █▄   ▄▀ █    █ █▄   ▄▀ "
echo " ███▀     █  ▀      ▀███▀    █  █  ▀███▀   "
echo "         █                    █▐           "
echo "        ▀                     ▐            "
echo "--------------------------------------     "
echo "| >1< Upgrade Operating System Version"
echo "| >2< Update Metasploit Framework     "
echo "| >3< Update Ruby and Pip             "
echo "| >4< Update Core Database            "
echo "| >5< Update And Clean Apt            "
echo "| >0< Update All                      " # Does not run distro-upgrade
echo "--------------------------------------"
echo ""
read -p " #?:" num
if [ $num == '1' ] 
then
dist
elif [ $num == '2' ]
then
msf
elif [ $num == '3' ]
then
ruby
elif [ $num == '4' ]
then
update
elif [ $num == '5' ] 
then
clean
elif [ $num == '0' ]
then
ueverything
else
exit

fi
