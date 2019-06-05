#!/bin/bash

clear
read -p "plug in gps and wnic"

airmon-ng check kill
service gpsd stop
service anonsurf stop
service bluetooth stop
service network-manager stop

ifconfig wlan0 down
ifconfig wlan1 down
	sleep 3
iwconfig wlan1 mode monitor

gpsd -N -n -D 3 /dev/ttyUSB0 &> /dev/null &
P1=$!
sleep 3
gnome-terminal -e "bash -c \kismet; exec bash" &> /dev/null &
P2=$!
wait $P1 $P2
