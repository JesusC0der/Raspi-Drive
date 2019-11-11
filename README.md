![](https://i.ibb.co/WBKdLVj/68747470733a2f2f692e696d6775722e636f6d2f78654b443933702e706e67.png)
                                                                                               verson 1.0

Raspi Drive makes your Raspberry Pi into a wireless NAS server


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

## Requirements
A Raspberry Pi that has wifi support and a usb port.

A micro sd card.

And either a usb stick or a usb hard drive.

## Setup Raspberry Pi
1. Flash Rasbian Lite on to the micro sd card. [Download Latest Version Here.](https://downloads.raspberrypi.org/raspbian_lite_latest)
2. Unzip the downloaded file.
3. Flash 2019-09-26-raspbian-buster-lite.img using [Etcher.](https://www.balena.io/etcher/)
4. remount the micro sd card (unplug it and replug it back into your computer)
5. Open Terminal in mac or command prompt in windows
6. Run the following command to enable SSH 
```
touch /Volumes/boot/ssh
```
7. Next we need to setup wifi.  Download this file named [wpa_supplicant.conf.](https://drive.google.com/file/d/1ctRdIoTdO74fUpxSAeHl0eQM0E_b64jK/view?usp=sharing) 
8. Now open up the file that you just downloaded and change the ssid to your network name
and the psk to your networks password.
9. Copy the file you just edited and paste it to the boot partition of your micro sd card
10. Unplug the micro sd card from your computer and instert it in your pi.
11. SSH to your pi. (Personaly I use termius on my mac to use SSH with my pi) 

Skip the steps above if you already set up your raspberry pi with ssh and wifi.

## Running the Installer Script
Install Raspi Drive by entering this into your ssh command line
```
wget -q https://git.io/JewLJ -O /tmp/raspi-drive && bash /tmp/raspi-drive
```
After the installation is complete please reboot your pi with ```sudo reboot```
**Note:** This is the fastest way to get Raspi Drive on your Raspberry Pi.


## Manual Installation
If you would like to manualy install this then you can follow these instructions.
1. Update your packages with ```sudo apt-get update```
2. Upgrade your system with ```sudo apt-get upgrade -y```
3. Install exfat-fuse and exfat-utils with ```sudo apt-get install exfat-fuse exfat-utils```
4. Create the hard drive mount directory with ```sudo mkdir /mnt/drive```
5. Mount your hard drive to the mount directory with ```sudo mount /dev/sda2 /mnt/drive```
6. Reboot your pi with ```sudo reboot```

**Note:** This is everything the Installer Script does but just faster.

## Connect to Raspi Drive with a Mac
1. Find out what your Raspberry Pi's IP Address is with ```hostname -I``` (The real IP Address is the first one that it shows)
2. Download [Fuse](https://github.com/osxfuse/osxfuse/releases/download/osxfuse-3.10.3/osxfuse-3.10.3.dmg) and [SSHFS](https://github.com/osxfuse/sshfs/releases/download/osxfuse-sshfs-2.5.0/sshfs-2.5.0.pkg) on your mac.
3. Run and follow the instructions for both of the installers.
4. Make a folder named Drive on your desktop.
5. In Terminal run the command ```sshfs pi@Your-IP-Address:/mnt/drive /Drive Folder``` (Replace Your IP Address with your IP Address and /Drive Folder with the path to the folder you created in step 4 :)
6. Put in your password for the pi (The defualt is ```raspberry```)
7. You should see a drive on the desktop named OSXFUSE Volume 0 (sshfs) if you see that drive it means it worked!
8. All Done!

![](https://i.ibb.co/S78KRm5/Screen-Shot-2019-11-10-at-8-47-54-PM.png)
![](https://i.ibb.co/KWD22Kn/Screen-Shot-2019-11-10-at-8-48-30-PM.png)
![](https://i.ibb.co/cFmnJjb/Screen-Shot-2019-11-10-at-8-46-01-PM.png)
![](https://i.ibb.co/gFXzQmT/Screen-Shot-2019-11-10-at-8-48-56-PM.png)

## Connect to Raspi Drive with a Windows Computer
1. Find out what your Raspberry Pi's IP Address is with ```hostname -I``` (The real IP Address is the first one that it shows)
2. Install [SFTP Drive from NSoftware](https://s3.amazonaws.com/nsoftware/builds%2Ffree%2FNDX2-A%2Fsetup.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAYMML7DAHMGYTX3VA%2F20191111%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20191111T013336Z&X-Amz-Expires=172800&X-Amz-SignedHeaders=host&X-Amz-Signature=d981cc9e96b32c0b73aec570f4229ef8e5b71f8151f0e6ecd0d862f5f5b8d356&response-content-disposition=%3B%20filename%3DSFTPDriveV2.exe)
3. Follow the instructions to install it.
4. Open the app up and then click on the Drives tab and then the New button
5. On the Edit Drive dialog input a drive name (It can be anything) and SFTP server information (The default username and password is pi and raspberry). Click Test SSH Connection to verify the connection to the SFTP server, then press OK to save the new drive configuration.
7. Press Start on the main window to connect to the drive.
8. You should now be able to accsess your drive from file explorer
9. All Done!

![](https://i.ibb.co/6rJ9WmW/sftpdrive-new-drive.png)
![](https://i.ibb.co/tsgydrK/sftpdrive-new-drive-details.png)
![](https://i.ibb.co/fCvcdNY/sftpdrive-new-drive-start.png)
![](https://i.ibb.co/kDy5fKm/sftpdrive-new-drive-explorer.png)