#!/bin/bash
    raspberry='\033[0;36m'
    green='\033[1;32m'
    echo -e "${raspberry}\n"
    echo #space
    echo -e "0101010                1010101     010101   0101010"
    echo -e "01   01                01         01    0     010"
    echo -e "01  01        01         01       0101010     010"
    echo -e "010101      01  01        01      01          010"
    echo -e "01   01     01  01          01    01          010"
    echo -e "01    01     0101 01   1010101    01        0101010"
    echo #space
    echo -e "010101      0101010    0101010    01        01   01010101"
    echo -e "01   01    01     01     010       01      01    01"
    echo -e "01    01   01    01      010        01    01     01010101"
    echo -e "01     01  0101010       010         01  01      01"
    echo -e "01    01   01    01      010          0101       01"
    echo -e "01010101   01     01   0101010         01        01010101"
    echo #space
    echo -e "${green}"
    read -p "Installing RasPi Drive.  Press Y to continue or any other key to stop" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    echo UPDATING AND UPGRADING
    sudo apt-get update;

    sudo apt-get dist-upgrade -y;

    echo INSTALLING REQUIRED PACKAGES
    sudo apt-get install -y exfat-fuse exfat-utils perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python

  echo CREATING MOUNT DIRECTORY
  sudo mkdir /mnt/drive
   
   echo INSTALLING WEBMIN
   wget https://prdownloads.sourceforge.net/webadmin/webmin_1.930_all.deb
   sudo dpkg --install webmin_1.930_all.deb
   sudo apt --fix-broken install -y

  echo Finished

   else
   echo #space
   echo CANCELED
   echo #space
    fi
