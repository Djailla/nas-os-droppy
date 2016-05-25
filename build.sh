#!/bin/bash

mkdir -m 755 -p /opt/droppy/

install -m 755 /home/source/rc.local /etc
install -m 755 /home/source/update_port.py /opt/droppy

# Install nodejs components
apt-get update
apt-get install -y -q curl
if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
    # Install nodejs components
    curl -sL https://deb.nodesource.com/setup_5.x | bash -
    apt-get install -y -q nodejs npm
else
	curl -O  http://node-arm.herokuapp.com/node_latest_armhf.deb
	dpkg -i node_latest_armhf.deb
fi

# # Install the component
npm install droppy

exit 0
