#!/bin/bash

cd /vagrant

cat bootstrap/banner.txt

sudo sh -c 'echo "cdc-acm" >> /etc/modules'

sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer

sudo apt-get update
sudo apt-get install -y build-essential gcc-arm-none-eabi gdb-arm-none-eabi git libusb-1.0-0-dev unzip python python-pip screen

sudo pip install --pre -U git+https://github.com/mbedmicro/pyOCD.git#egg=pyOCD
pip completion --bash >> ~/.bashrc

cd /vagrant
mkdir -p devel/nRF5_SDK_11
cd devel/nRF5_SDK_11

wget https://www.nordicsemi.com/eng/nordic/download_resource/54291/47/32364139 -O nRF5_SDK_11.0.0.zip
unzip -o nRF5_SDK_11.0.0.zip

cd ..
git clone https://github.com/morganrallen/OSHChip_Blinky_Demo.git

echo "source /vagrant/bootstrap/oshchip_bash.rc" >> ~/.bashrc

cd /vagrant
cat bootstrap/banner.txt
cat bootstrap/getting_started.txt
