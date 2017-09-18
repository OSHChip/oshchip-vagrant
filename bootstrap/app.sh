#!/bin/bash

cd /vagrant

cat bootstrap/banner.txt

sudo sh -c 'echo "cdc-acm" >> /etc/modules'

sudo addgroup vagrant root #only way to ensure pyocd will work :(

sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer

sudo apt-get update
sudo apt-get install -y build-essential gcc-arm-none-eabi gdb-arm-none-eabi git libusb-1.0-0-dev unzip python python-pip screen

sudo pip install --pre -U git+https://github.com/mbedmicro/pyOCD.git#egg=pyOCD
pip completion --bash >> ~/.bashrc

cp /vagrant/bootstrap/oshchip.rules /etc/udev/rules.d/
service udev restart
udevadm trigger

mkdir -p devel/nRF5_SDK_11
cd devel/nRF5_SDK_11

wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v12.x.x/nRF5_SDK_12.3.0_d7731ad.zip
#unzip -o nRF5_SDK_12*.zip

sed -e 's/.local.*//' -i components/toolchain/gcc/Makefile.posix # change toolpath for all Makefiles

cd ..
git clone https://github.com/morganrallen/OSHChip_Blinky_Demo.git

echo "source /vagrant/bootstrap/oshchip_bash.rc" >> ~/.bashrc

cd /vagrant
cat bootstrap/banner.txt
cat bootstrap/getting_started.txt
