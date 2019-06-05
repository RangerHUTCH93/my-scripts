#!/bin/bash
#
# THIS IS A ROUGH DRAFT
#
# include "how-to" text for Kismet input

clear

tput setaf 1; cat << "EOF"

 ____  _     _____  ____    _  __ _  ____  _      _____ _____ 
/  _ \/ \ /\/__ __\/  _ \  / |/ // \/ ___\/ \__/|/  __//__ __\
| / \|| | ||  / \  | / \|  |   / | ||    \| |\/|||  \    / \  
| |-||| \_/|  | |  | \_/|  |   \ | |\___ || |  |||  /_   | |  
\_/ \|\____/  \_/  \____/  \_|\_\\_/\____/\_/  \|\____\  \_/  
                                                              
EOF

tput sgr0;
# picture starts 2 lines under this comment
#tput setaf 6; cat << "EOF"
#
#
#                  .sNm/`      
#                -yMMMMMm+`    
#               yMMMMMMMMMh    
#          .o+` MMMMMMMMd/`    
#        -yNMMd:dNNNNNh:`      
#       .dMMMMMMy/---.         
#     .--:ohNMMMMNo`           
#  `:hNNNMNd-omMMNy` `.  `.  `.
#`/dMMMMMMMM` `:o-  `hy  sd  om
#yMMMMMMMMMy     `oshy. :N+ `my
#`/dMMMMNy-       -.``-yd/ `hm.
#  `/dms.        .syyhs/` /my` 
#    ``           `````:sdy-   
#                -hhhhyo:`     #
#
#
#EOF
# picture end 2 lines above this comment
#tput sgr0;
echo
echo
echo "    Welcome! Auto Kismet combines WiFi networks with GPS coordinates."
echo
echo " $(tput setaf 1)*$(tput sgr0) It's recommended that you run this with $(tput setaf 1)Administrative Privileges *$(tput sgr0)"
echo " $(tput setaf 1)-$(tput sgr0) You'll need to install '$(tput setaf 3)GPSD$(tput sgr0)' and '$(tput setaf 3)GPSD-Clients$(tput sgr0)'"
echo
echo " $(tput setaf 1)-$(tput sgr0) This script will put your WNIC into monitor mode,"
echo "   launch GPSD and send the output to /dev/null, and launch Kismet."
echo " $(tput setaf 1)-$(tput sgr0) Before running make sure your GPS dongle and WNIC is attached via USB"
echo
echo " $(tput setaf 1)-$(tput sgr0) Modify the /etc/kismet/kismet.conf to make starting Kismet more automatic"
echo " $(tput setaf 1)-$(tput sgr0) Configure the $(tput bold)Startup Options$(tput sgr0) as '$(tput bold)localhost$(tput sgr0)'."
echo
echo " $(tput setaf 1)-$(tput sgr0)$(tput setaf 3) It is$(tput sgr0) $(tput setaf 1)HIGHLY RECOMMENDED$(tput sgr0)$(tput setaf 3) to reboot your system after running this!"
echo "      (so all the network services can appropriatley start back up)$(tput sgr0)"
echo
read -p "    Press $(tput bold)ENTER$(tput sgr0) to continue or $(tput bold)CTRL-C$(tput sgr0) to exit..."
echo
echo "##################################################################################"
echo "##################################################################################"
echo "##################################################################################"
echo
sleep 0.5

	ifconfig wlan0 down

echo "Killing any existing gpsd and troublesome services/processes"

	airmon-ng check kill

	service gpsd stop
	service anonsurf stop
	service bluetooth stop
	service network-manager stop
	sleep 3

echo "switching wlan1 to monitor mode. please wait..."
echo
#	sleep 3

	iwconfig wlan0 mode monitor
	sleep 3
	ifconfig wlan0 up
	sleep 1
	tput setaf 1; iwconfig wlan0	# prints the output of the command to red

	tput sgr0			# explicedly shows the user tha they are in monitor mode
	sleep 3
echo
echo "# Running gpsd with appropriate parameters"
sleep 1
echo "#"
echo "# Opening Kismet in new terminal window..."
sleep 1
echo "#"
echo "# Kismet output will be in the same directory that this script is executed from"
echo "# or the home directory"
sleep 1
echo "#"
echo "# Starting GPSD and Kismet in paralell..."
sleep 1
echo "#"
echo
echo "		Press CTRL-C to exit Kismet then the Script"

sleep 2

	gpsd -N -n -D 3 /dev/ttyUSB0 &> /dev/null & # may have to delete the (&> /dev/null) is issues arise
	P1=$!
	sleep 3
	gnome-terminal -e "bash -c \kismet; exec bash" &> /dev/null &
		#
		# code for sending input to Kismet (see comments 5 lines below)
		# may be able to go here...
		#
		# comment or delete code below this comment if it fails
		#

		#xdotool key return

	P2=$!
	wait $P1 $P2

#echo "Press CTRL-C to close Kismet then again to exit the script"

# End of Script
