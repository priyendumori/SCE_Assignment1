#!/bin/bash

read -p "Enter username: " name
read -sp "Enter password: " pass

if [[ -e ~/Desktop/ubuntu.ovpn ]]
then
	rm ~/Desktop/ubuntu.ovpn
fi

wget -q --http-user $name --http-password $pass -P ~/Desktop "https://vpn.iiit.ac.in/secure/ubuntu.ovpn" &>/dev/null
if [ $? -ne 0 ]
then
	echo "Could not download configuration file"
	exit 1
fi

command -v openvpn > /dev/null
if [ $? -eq 1 ]
then
	sudo apt install openvpn
fi

touch pass.txt
echo $name > pass.txt
echo $pass >> pass.txt

sudo -b openvpn --config ~/Desktop/ubuntu.ovpn --auth-user-pass pass.txt --daemon

sleep 5

ifconfig | grep -q "00-00-00-00-00-00-00-00-00-00-00-00-00-00-00"

if [ $? -eq 0 ]
then
	sudo sed -i '1 i\nameserver 10.4.20.204' /etc/resolv.conf
	if [ $? -eq 0 ]
	then
		echo -e "\nVPN started"
	fi
else
	echo -e "\nSome error occurred...!"
fi