#!/bin/bash

echo "---------------------------------------------"
echo "Start disk parition and configuration"
echo "---------------------------------------------"

parted /dev/xvdb --script mklabel gpt mkpart xfspart xfs 0% 100%
sleep 3
mkfs.xfs -f /dev/xvdb1
sleep 3
partprobe /dev/xvdb1
mkdir -p /data
mount /dev/xvdb1 /data
chmod 777 /data
echo "/dev/xvdb1      /data     xfs     defaults,nofail     1 2" >> /etc/fstab

echo "---------------------------------------------"
echo "Configuration completed..."
echo "---------------------------------------------"
