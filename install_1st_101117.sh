#!/bin/bash
#

nver=384.90
cver=9.0
# Create the directory ~/tools, ~/log, ~/syscheck
#echo Create the directory, ~/tools/.....
#cd ~/
#mkdir tools
#mkdir log
#mkdir syscheck
#mkdir Downloads

cd ~/Downloads
	read -p "Do you want to download NVDIA driver and CUDA (Y/n)?" ans
case $ans in
		[Yy]* ) 
		#### Download NVIDIA drivers and CUDA ======================================================================
		echo Start to downloading NVIDIA driver .....
		wget http://us.download.nvidia.com/XFree86/Linux-x86_64/$nver/NVIDIA-Linux-x86_64-$nver.run
		chmod +x NVIDIA-Linux-x86_64-$nver.run
		read -n1 -r -p "Press any key to continue to download cuda drivers.." key
		echo Skipped Downloading CUDA but chmod +x 

		wget https://developer.nvidia.com/compute/cuda/$cver/Prod/local_installers/cuda_$cver.176_384.81_linux-run
		mv cuda_$cver.176_384.81_linux-run cuda_$cver.176_384.81_ubuntu-17.04.run

		wget https://developer.nvidia.com/compute/cuda/$cver/Prod/local_installers/cuda_$cver.176_384.81_linux-run
		mv cuda_$cver.176_384.81_linux-run cuda_$cver.176_384.81_ubuntu-16.04.run
		chmod +x cuda*
		;;
		#===========================================================================================================
	[Nn]* )	chmod +x cuda*
		chmod +x NVIDIA*
					;;
	* ) echo "Please answer yes or no.";;
esac


echo add blacklist nouveau in blacklist
read -n1 -r -p "Press any key to continue..." key1
### blacklist nouveau
echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off\n" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
sudo update-initramfs -u

read -n1 -r -p "Press any key to continue to download and install dependencies..." key

#### Install and Configure dependencies
sudo apt install autoconf autogen automake autotools-dev build-essential cmake g++ gawk gcc git make openssl pkg-config python-dev unity-webapps-yandexmusic linux-headers-$(uname -r) 
sudo apt install libboost-all-dev libc++-dev libcurl4-openssl-dev libgmp-dev libjansson-dev libprotobuf-dev libqrencode-dev libqt4-dev libsasl2-dev libssl-dev libtool libxi-dev
sudo apt install libxmu* lxmusic* libglu1-mesa* libgluegen2-* libx11-*

################
echo ""
echo ""

echo "Finished..."

##  /etc/modprobe.d/blacklist.conf

#blacklist nouveau
#blacklist lbm-nouveau
#options nouveau modeset=0
#alias nouveau off
#alias lbm-nouveau off
