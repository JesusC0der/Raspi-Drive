                                                         version 1.1

Raspi Drive makes your Raspberry Pi into a wireless NAS server.

## Contents
 - [Screenshots](#screenshots)
 
 - [Requirements](#requirements)

 - [Setup Raspberry Pi](#setup-raspberry-pi)
 
 - [Running the Installer Script](#running-the-installer-script)
 
 - [Manual Installation](#manual-installation)
 
 - [Connect to Raspi Drive with a Mac](#connect-to-raspi-drive-with-a-mac)
 
 - [Connect to Raspi Drive with a Windows Computer](#connect-to-raspi-drive-with-a-windows-computer)

## Screenshots
![](https://i.ibb.co/3msg6wz/Screen-Shot-2019-11-10-at-12-28-10-AM.png)
![](https://i.ibb.co/N7g33XW/Screen-Shot-2019-11-10-at-12-31-24-AM.png)
![](https://i.ibb.co/74G0d0d/Screen-Shot-2019-11-10-at-12-34-39-AM.png)
![](https://i.ibb.co/sVRYzjh/Screen-Shot-2019-11-14-at-10-19-08-PM.png)

## Requirements

A Raspberry Pi that has wireless support (could be any version as long as you have a wifi adapter).

A micro sd card (class 10 recomended).

Either a USB stick or a USB hard drive.

## Setup USB Drive or USB Stick
1. Plug the hard drive or USB stick into your computer.
2. Open Disk Utility if you are using a mac computer or Windows Explorer if your are using a Windows computer.
3. For Windows users right click on the drive and click format.
4. For Mac users select the drive then click erase.
5. When you get to the format/erase page format the drive to be ExFat then click Erase/Start.
6. Let it load until it says complete then make sure its formated in ExFat.
7. Eject the drive from your computer.

## Setup Raspberry Pi
1. Download Raspberry Pi OS Lite. [Grab the latest version from here.](https://www.raspberrypi.com/software/operating-systems/)
2. Unzip the downloaded file.
3. Flash the unzipped image using [Etcher.](https://www.balena.io/etcher/)
4. Remount the micro sd card (unplug and replug micro sd card from computer).
5. Open Terminal or Command Prompt and run the following command (enables ssh on the pi):
```
touch /Volumes/boot/ssh
```
6. Next, we need to set up wifi.  Download this file named [wpa_supplicant.conf.](https://drive.google.com/file/d/1ctRdIoTdO74fUpxSAeHl0eQM0E_b64jK/view?usp=sharing) 
7. Now open up the file you downloaded and change the SSID to your network's name and the psk to your network's password.
8. Copy the file you just edited and paste it to the boot partition of your micro sd card.
9. Unplug the micro sd card from your computer and insert it in your pi.
10. SSH to your pi (more information on how to do so [here](https://itsfoss.com/ssh-into-raspberry/)).
11. Plug the drive you formated in to your pi.

## Running the Installer Script
1. Install Raspi Drive by running the following command on your pi:
```
wget -q https://git.io/JewLJ -O /tmp/raspi-drive && bash /tmp/raspi-drive
```
2. Mount your external drive by entering: ```sudo mount /dev/sda2 /mnt/drive```
3. Reboot your pi with ```sudo reboot```

**Note:** This is the fastest way to get Raspi Drive on your Raspberry Pi.

**Also Note:** If you get an error when mounting the drive about there not being a directory at /dev/sda2 then run ```sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL```and look under sda for the sda partition that is bigger in size and copy it. (example: sda2) then in step 2 replace /dev/sda2 with the sda partition that you copied.


## Manual Installation
If you would like to manually install this then you can follow these instructions.
1. Update your packages with ```sudo apt update```
2. Upgrade your system with ```sudo apt upgrade -y```
3. Install the following dependencies:  ```sudo apt install exfat-fuse exfat-utils perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python```
4. Download and install Webmin with: ```wget https://prdownloads.sourceforge.net/webadmin/webmin_1.930_all.deb && sudo dpkg --install webmin_1.930_all.deb```
4. Create the external hard drive's mount directory with ```sudo mkdir /mnt/drive```
5. Mount your hard drive to the mount directory with ```sudo mount /dev/sda2 /mnt/drive```
6. Reboot your pi with ```sudo reboot```

**Note:** This is everything the Installer Script does but just faster.

## Connect to Raspi Drive with a Mac
1. Find out what your Raspberry Pi's IP Address is with ```hostname -I``` (The real IP Address is the first one that it shows)
2. Download [Fuse](https://github.com/osxfuse/osxfuse/releases/download/) and [SSHFS](https://github.com/osxfuse/sshfs/releases/download/) on your Mac.
3. Run both installation packages and follow the onscreen instructions.
4. Make a folder named Drive on your desktop.
5. In Terminal run ```sshfs pi@Your-IP-Address:/mnt/drive /Drive Folder``` (Replace Your IP Address with your IP Address and /Drive Folder with the path to the folder you created in step 4).
6. Put in the pi's password (The default is ```raspberry```).
7. You should now see a drive on your desktop named OSXFUSE Volume 0 (sshfs).  If so, then the installation was a sucsess.
8. You can now accsess the Web Interface on the pi by going to https://your-ip-address:10000 replacing your-ip-address with the Raspberry Pi's IP Address (for example: https://192.168.5.73:10000).
9. All Done!

**Note:** You will probably see a warning message in your browser that says something like (Your connection is not private) ignore this message.

![](https://i.ibb.co/S78KRm5/Screen-Shot-2019-11-10-at-8-47-54-PM.png)
![](https://i.ibb.co/KWD22Kn/Screen-Shot-2019-11-10-at-8-48-30-PM.png)
![](https://i.ibb.co/cFmnJjb/Screen-Shot-2019-11-10-at-8-46-01-PM.png)
![](https://i.ibb.co/gFXzQmT/Screen-Shot-2019-11-10-at-8-48-56-PM.png)

## Connect to Raspi Drive with a Windows Computer
**Credits go to NSoftware for instructions**
1. Find out what your Raspberry Pi's IP Address is with ```hostname -I``` (The real IP Address is the first one is shown.
2. Install [SFTP Drive from NSoftware](https://www.nsoftware.com/sftp/drive/).
3. Follow the in-app instructions to install the program.
4. Open the app and click on the Drives tab and then the New button.
5. Once the Edit Drive dialog opens, input a drive name (it can be anything) and then put in the SFTP server information (The default username and password is pi and raspberry). Then click OK.
6. On the main window click start to start the connection to your pi.
7. If everything went smoothly then it should be accessible in File Explorer.
8. You should now be able to accsess the Web Interface by going to https://your-ip-address:10000 replacing your-ip-address with the Raspberry Pi's IP Address (for example: https://192.168.5.73:10000)
9. All Done!
**For more in depth instructions on how to setup a sftp connection on windows visit this [website](https://cdn.nsoftware.com/help/ND3/app/pg_runningdrive.htm)**

**Note:** You will probably see a warning message in your browser that says something like (Your connection is not private) ignore this message.

## Contributing
If you would like to report a bug or make a code contribution please view the [CONTRIBUTING.MD](https://github.com/JesusCoder-Coding-For-Jesus/Raspi-Drive/blob/master/CONTRIBUTING.md) file.
