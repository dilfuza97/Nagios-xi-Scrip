#!/bin/bash

# nagios installation script in linux (ubuntu and centos both)


DIR=nagiosxi
DLDIR=nagiosxi
FILE=xi-latest.tar.gz

# Check whether we have sufficient privileges
if [ $(id -u) -ne 0 ]; then
    echo "This script needs to be run as root/superuser." >&2
    exit 1
fi
    
if ! which wget &>/dev/null; then
	if [ `command -v yum` ]; then
		yum install wget -y
	else 
		apt-get -y install wget
	fi
fi

cd /tmp
echo "check if /tmp/nagiosxi exists"
if [ -d /tmp/$DIR ]; then
    rm -rf /tmp/$DIR
fi

echo "Downloading latest Nagios XI release"
wget https://assets.nagios.com/downloads/$DLDIR/$FILE -O /tmp/$FILE
tar xzf /tmp/$FILE
cd /tmp/$DIR
chmod +x ./fullinstall
./fullinstall -n
