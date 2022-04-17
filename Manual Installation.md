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
