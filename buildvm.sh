#!/bin/bash

latestnode="false";
installredis="false";

if [ $1 ]; then
	if [ $1 = '-r' ]; then
		installredis="true";
	fi
	if [ $1 = '-l' ]; then
		latestnode="true";
	fi
fi

if [ $2 ]; then
	if [ $2 = '-r' ]; then
		installredis="true";
	fi
	if [ $2 = '-l' ]; then
		latestnode="true";
	fi
fi

echo "Updating aptitude's repo's."
sudo apt-get update >> log

echo "Upgrading Ubuntu to the latest of everything."
sudo apt-get -u upgrade >> log

echo "Installing all the stuff needed for node."
sudo apt-get install -y --force-yes python-software-properties python g++ make >> log

if [ $latestnode = 'true' ]; then
	echo "Using latest Node version"
	sudo add-apt-repository -y ppa:chris-lea/node.js
else
	echo "Using latest Node-legacy version"
	sudo add-apt-repository -y ppa:chris-lea/node.js-legacy
fi

echo "Updating aptitude's repo's."
sudo apt-get update >> log

echo "Installing node."
sudo apt-get install -y --force-yes nodejs >> log

echo "Outputting node version."
node –v >> log

echo "Installing npm."
sudo apt-get install -g npm >> log

echo "Installing node-gyp."
sudo npm install -g node-gyp >> log

if [ $installredis = 'true' ]; then
	echo "Installing redis."
	sudo apt-get install -y --force-yes redis-server >> log

	echo "Testing connectivity to redis."
	redis-cli PING >> log
fi

echo "Setting timezone file to New York.(EST)"
echo "America/New_York" | sudo tee /etc/timezone

echo "Reconfiguring tzdata to use changed timezone file."
sudo dpkg-reconfigure --frontend noninteractive tzdata

echo "Setting file limits stuff"
echo '*  soft  nofile  10000'  >> /etc/security/limits.conf
echo '*  hard  nofile  10000'  >> /etc/security/limits.conf
echo 'session required pam_limits.so' >> /etc/pam.d/su
