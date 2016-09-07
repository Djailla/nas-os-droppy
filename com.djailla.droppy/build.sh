#!/bin/bash

mkdir -m 755 -p /opt/droppy/

install -m 755 /home/source/rc.local /etc
install -m 755 /home/source/update_port.py /opt/droppy
install -m 755 /home/source/config.json /opt/droppy

# Install nodejs components
apt-get update
apt-get install -y -q curl
if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
    apt-get install -y -q nodejs npm
else
    echo "No ARM compatible version"
    exit 1
fi

# Install the component
npm install -g droppy

# Cleanup
apt-get -y -q autoremove curl
apt-get -y -q clean

exit 0
