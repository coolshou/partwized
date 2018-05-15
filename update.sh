#!/bin/sh

: ${base=ftp://1:1@192.168.0.90/partwized/partwized-script/}

modprobe 8139cp
ifconfig eth0 192.168.0.110

cd /partwized
if [ -e function ];then
	rm function
fi
wget -c ${base}functions
chmod +x functions

if [ -e partwized ];then
	rm partwized
fi
wget -c ${base}partwized
chmod +x partwized