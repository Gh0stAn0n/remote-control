#!/bin/bash
#
# Recode The Copyright Will Not Make You A Coder
#
# VPN RDP
# OS / IP Enumeration - Secured Connection
#
# Version : 1.0 | Codename : remote control
# Coded by : gh0st | scp
#
# Tested on : Kali Linux
# I highly recommend using this tool on Kali Linux OS
#
# More Info : https://github.com/Gh0stAn0n
#
# Remember To Use For Educational Purpose only
# Im Not Responsible Of Anything That Might Happen
# Use At Your Own Risk


#change automatically from .sh to X
sudo chmod +x $0
#cannot be rename on purpose
mv -n $0 remote-control


#set the color variable
#L...=Less...
RED='\e[1;91m'
LRED='\e[0;91m'
BLUE='\e[1;94m'
LBLUE='\e[0;94m'
GREEN='\e[1;92m'
LGREEN='\e[0;92m'
ORANGE='\e[1;93m'
LORANGE='\e[0;93m'
PURPLE='\e[1;95m'
LPURPLE='\e[0;95m'

#stop the color variable
STOP='\e[0m'


#$1 is the alias of the first input
#help menu

	if [[ $1 = -i || $1 = --info ]]
	then
		clear
		sleep 0.5

                echo ""
                echo -e "\e[4mUsage & Info details\e[0m:"
                echo ""
                echo -e " - remote control is a script which connect you to a VPN for remote control securely via ssh, telnet, ftp using: ${LGREEN}nipe${STOP}, ${LGREEN}nmap${STOP} and ${LGREEN}whois${STOP}."
                echo ""
                echo -e " - check for every errors possible. ${LORANGE}(${STOP}correct path, correct answers as input, if the ip choosen is correct, if the VPN is truly active${LORANGE})${STOP}"
                exit


	elif [[ $1 = -h || $1 = --help ]]
	then
		clear
		sleep 0.2

		echo ""
                echo -e "\e[4mExamples\e[0m:"
                echo ""
                echo -e "${GREEN}$ ${STOP}if the script is used using false flags or arguments, it will run as normal ${GREEN}$ ${STOP}"
                echo ""
                echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} bash remote-control ${LPURPLE}--info${STOP}"
                echo ""
                echo -e "${GREEN}$ ${STOP}${RED}sudo${STOP} ./remote-control"

                echo ""
                echo ""
                echo -e "\e[4mOptions\e[0m:"
                echo ""
                echo -e "${PURPLE}-I${STOP} | ${PURPLE}--info${STOP}                    Display info details."
                echo -e "${PURPLE}-h${STOP} | ${PURPLE}--help${STOP}                    Display help and usage details."
                echo -e "${PURPLE}-v${STOP} | ${PURPLE}--version${STOP}                 Display current software version."

		echo ""
                echo ""
                echo -e "\e[4mSupported Tools\e[0m:"
                echo ""
                echo -e "|    ${BLUE}VPN${STOP}    |    ${BLUE}SCAN${STOP}    |"
                echo    "|___________|____________|"
                echo    "|           |            |"
                echo -e "|    nipe   | nmap${LRED}/${STOP}whois |"

		echo ""
                echo ""
                sleep 2
                echo -e " - dont forget going to ${RED}https://github.com/Gh0stAn0n${STOP} for more content."
                sleep 1
                echo ""
                exit


	elif [[ $1 = -v || $1 = --version ]]
	then
                echo ""
                echo " remote control - Version 1.0.0"
                exit
	fi


#User Root Identifier
#welcoming the new user
function ROOT()
{
		if [[ $EUID -ne 0 ]]
		then
		sleep 1
		echo ""
		echo -e "${ORANGE}[i]${STOP} must run as root, type 'sudo su' to get root access."
		echo ""
		echo -e "${ORANGE}[i]${STOP} if this script isn't run as root and instead runned as 'sudo bash ${LORANGE}<${STOP}$0${LORANGE}>${STOP}', some errors migh occur."
		exit
		fi

	clear
	echo ""
	echo -e "${LRED}\e[5mWARNING!!!${STOP} "
	echo ""
	echo -e "${RED}[i]${STOP} Remote Control (c) 2021 by gh0st - Please do not use in military or secret service organizations, or for illegal purposes."
	echo ""
	sleep 5
	echo -e "${RED}[i]${STOP} you have been warned, continue at your own risk."
	sleep 1.5
	echo ""
	read -p "$(echo -e ${RED}[i]${STOP}) press Any Key to continue, type X to abort: "     aware

		if [[ $aware = X || $aware = x ]]
		then
		sleep 3
		echo ""
		echo -e "${RED}[i]${STOP} session aborted - dont forget going to: ${RED}https://github.com/Gh0stAn0n${STOP} for more content."
		exit

		else

		sudo updatedb
	        pwd=$(locate anon.png | head -1)
        	sleep 2

       		echo "" ; echo ""
        	echo -e "$(jp2a --colors $pwd)"
        	echo -e "                                                \e[3m we are anonymous \e[0m"
        	echo -e "                                                   \e[3m  i'm gh0st \e[0m"
        	echo "" ; echo ""
        	sleep 3
        	echo -e "${ORANGE}[i]${STOP} gh0st tools checkpoint."
        	echo "______________________________"
        	CHECK_PACKAGES
		fi
}


PACKAGES=(whois curl nmap ssh sshpass)
MISSING_PACKAGES=()

function CHECK_PACKAGES()
{

	for package in ${PACKAGES[@]}
	do
		#if package is installed, assign it to $PACKAGE_EXIST
		PACKAGE_EXIST=$(which $package)
		#if $PACKAGE_EXIST is empty, add missing package to $MISSING_PACKAGES
		if [ -z "$PACKAGE_EXIST" ]; then
			sleep 1.2
			echo ""
			echo -e "[${RED}-${STOP}] $package package: ${LRED}not installed${STOP}"
			MISSING_PACKAGES+=($package)
		else
			sleep 1.2
			echo ""
			echo -e "[${BLUE}+${STOP}] $package package: ${LGREEN}installed${STOP}"
		fi
	done

       #if $MISSING_PACKAGES is not empty, update the kernel to date
        if [ ! -z "$MISSING_PACKAGES" ]; then
        echo ""
        sudo apt-get update ; sudo apt-get upgrade ; sudo apt-get dist-upgrade ; sudo apt-get auto-remove
        echo ""
        fi

	sudo updatedb
	NIPE_CHECK
}

function NIPE_CHECK()
{
                #if package is installed, assign it to $nipe
		nipe=$(locate nipe.pl)

                if [[ "$nipe" = "" ]]
		then
			sudo updatedb

                        sleep 1.2
                        echo ""
                        echo -e "[${RED}-${STOP}] nipe package: ${LRED}not installed${STOP}"
			echo ""
                        git clone https://github.com/htrgouvea/nipe && cd nipe
                        sudo cpan install Try::Tiny Config::Simple JSON
                        sudo perl nipe.pl install
			cd ..

			sudo updatedb
			NIPE_CHECK
		else
                        sleep 1.2
                        echo ""
                        echo -e "[${BLUE}+${STOP}] nipe package: ${LGREEN}installed${STOP} at: $nipe"
	                echo "______________________________"
			echo ""
			echo -e "${ORANGE}example:${STOP}"
			echo ""
			echo -e "[${BLUE}+${STOP}] nipe package: ${LGREEN}installed${STOP} at: /home/gh0st/nipe/$(echo -e ${RED}nipe.pl${STOP}) = sequence number 4"
			echo ""
			read -p " - type the appearance sequence number of $(echo -e ${RED}nipe.pl${STOP}) (no mistake will be allowed!): " 		seq
                fi
}

#if missing package is installed successfully, takes in 1 argument $1, returns $MPACKAGE_ERR_CODE
function VALIDATE_PACKAGE()
{
	MPACKAGE=$1
	MPACKAGE_EXIST=$(which $MPACKAGE)
}


#install the missing requires packages
function INSTALL_PACKAGES()
{
	for missing_package in ${MISSING_PACKAGES[@]};
	do
		case ${missing_package} in
			whois)
				echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
				sudo apt-get install --assume-yes whois -y

				VALIDATE_PACKAGE $missing_package
				if [ ! -z "$MPACKAGE_EXIST" ]; then
					echo -e "\n[${BLUE}+${STOP} $missing_package installed successfully."
				else
					echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
					exit
				fi
				;;

			curl)
				echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
				sudo apt-get install --assume-yes curl -y

				VALIDATE_PACKAGE $missing_package
				if [ ! -z "$MPACKAGE_EXIST" ]; then
					echo -e "\n[${BLUE}+${STOP}] $missing_package installed successfully."
				else
					echo -e "\n${RED}[!]${STOP} $missing_package$ installation was unsuccessful. Please run $0 again."
					exit
				fi
				;;

			nmap)
				echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
				sudo apt-get install --assume-yes nmap -y

				VALIDATE_PACKAGE $missing_package
				if [ ! -z "$MPACKAGE_EXIST" ]; then
					echo -e "\n[${BLUE}+${STOP} $missing_package installed successfully."
				else
					echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
					exit
				fi
				;;

                        ssh)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                sudo apt-get install --assume-yes ssh -y

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP}] $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;

                        sshpass)
                                echo -e "\n[${GREEN}+${STOP}] $missing_package installation in progress. \n"
                                sudo apt-get install --assume-yes sshpass -y

                                VALIDATE_PACKAGE $missing_package
                                if [ ! -z "$MPACKAGE_EXIST" ]; then
                                        echo -e "\n[${BLUE}+${STOP}] $missing_package installed successfully."
                                else
                                        echo -e "\n${RED}[!]${STOP} $missing_package installation was unsuccessful. Please run $0 again."
                                        exit
                                fi
                                ;;
		esac
	done
}


#Current Location/IP
function CURRENT()
{
nipe=$(locate nipe.pl | cut -d"/" -f1-$seq)
cd $nipe

vpn="$(sudo perl nipe.pl status)"
ip="$(sudo perl nipe.pl status | head -3 | tail -1 | cut -d" " -f3)"
cl="$(sudo perl nipe.pl status | head -2 | tail -1 | cut -d" " -f3 | cut -d "." -f1 | cut -d "," -f1)"

	echo "______________________________"
	echo ""
	echo -e "${ORANGE}[i]${STOP} connection must be secured to get access granted."
	echo ""

		if [[ $vpn = *ERROR* ]]
		then
		echo -e " - VPN status:${LORANGE} $vpn ${STOP}"
		echo ""
		sleep 2
		echo -e "${RED}ERR${STOP}::due to a connection loss, we were unable to stable the connection::restart your VPN manually."
		sleep 3
		exit
		fi

	sleep 1
	echo -e " - VPN status:${LORANGE} $cl ${STOP}"
	echo ""
	sleep 1
	echo -e " - your current location is:${LORANGE} $(curl -s ipinfo.io/$ip | head -6 | tail -1 | cut -d '"' -f4), $(curl -s ipinfo.io/$ip | head -5 | tail -1 | cut -d '"' -f4), $(curl -s ipinfo.io/$ip | head -4 | tail -1 | cut -d '"' -f4) ${STOP}"
	echo ""
	sleep 1
	echo -e " - your current IP is:${LORANGE} $ip ${STOP}"
	echo ""

			if [[ $cl = activated ]]
			then
			ACTIVE

			elif [[ $cl = disabled ]]
			then
                	VPN
			fi
}


#[V]irtual [P]rivate [S]erver
function VPN()
{
	sleep 1
	echo -e "${RED} \e[5m- your connection isn't secured. ${STOP}"
	echo "______________________________"
	echo ""
	echo -e "${ORANGE}[i]${STOP} if option 'no' is selected, the session will close."
	echo ""
	read -p " - power on a Virtual Private Network ? (yes/no): "     answer

		if [[ $answer = YES || $answer = Yes || $answer = yes || $answer = y || $answer = Y ]]
		then
		echo "______________________________"
		NIPE

		elif [[ $answer = NO || $answer = No || $answer = no || $answer = n || $answer = N ]]
		then
		echo ""
		echo -e " - dont forget going to: ${RED}https://github.com/Gh0stAn0n${STOP} for more content."
		sleep 3
		exit

		else
		echo ""
		echo -e "${ORANGE}[i]${STOP} '$answer' is unavailable, type the proposed keywords correctly."
		echo ""
		VPN
		fi
}


#Connecting and Securing the IP
function NIPE()
{

nipe=$(locate nipe.pl | cut -d"/" -f1-$seq)
cd $nipe
perl nipe.pl restart

vpn="$(perl nipe.pl status)"
ip="$(perl nipe.pl status | head -3 | tail -1 | cut -d" " -f3)"

	echo ""
	echo -e "${ORANGE}[i]${STOP} connection to a secured service in progress."

	echo -e "${LGREEN}"
        sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "25%"
	sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "50%"
	sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "75%"
	sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "." ; sleep 0.5 ; echo -n "100%"
	echo -e "${STOP}" ; echo "______________________________"


		if [[ $vpn = "[!] ERROR: sorry, it was not possible to establish a connection to the server." ]]
		then
		echo ""
		echo -e " - VPN status:${LORANGE} $vpn ${STOP}"
		echo ""
                echo -e "${RED}ERR${STOP}::due to a connection loss, we were unable to stable the connection::restart your VPN manually."
                sleep 3
                exit
                fi


        sleep 2
	echo ""
	echo -e "${ORANGE}[i]${STOP} secured connection has been etablished."
	echo ""
        sleep 1
        echo -e " - VPN status:${LORANGE} activated ${STOP}"
        echo ""
        sleep 1
        echo -e " - your ghost location is:${LORANGE} $(curl -s ipinfo.io/$ip | head -6 | tail -1 | cut -d '"' -f4), $(curl -s ipinfo.io/$ip | head -5 | tail -1 | cut -d '"' -f4), $(curl -s ipinfo.io/$ip | head -4 | tail -1 | cut -d '"' -f4) ${STOP}"
        echo ""
        sleep 1
        echo -e " - your ghost IP is:${LORANGE} $ip ${STOP}"

        echo ""
        sleep 1
        echo -e "${BLUE} \e[5m- your connection is secured. ${STOP}"
	sleep 2
	RCP
}


#Entering the Target Information
#[R]emote [C]onnection [P]rotocols
function RCP()
{
	sudo service ssh start

	echo "______________________________"
	echo ""
	read -p " - type the target IP: "     ip_addr
	echo ""

check="$(curl -s ipinfo.io/$ip_addr | grep Please | cut -d '"' -f4)"

		if [[ $check = "Please provide a valid IP address" ]]
		then
		echo -e "${ORANGE}[i]${STOP} Please provide a valid IP address."
		RCP
		fi


#whois query give you information about the given IP
#nmap scan give you information about the IP open ports
		read -p " - (whois & nmap analysis) type 1 for an extensive research, type 2 for an essential research: "     number

			if [[ $number -eq 1 ]]
			then
				echo "______________________________" ; echo "" ; echo "" ; echo -e "  ${ORANGE}<${STOP}  WHOIS info  ${ORANGE}>${STOP}  " ; echo "" ; echo ""
				whois $ip_addr | head -56 | tail -44

                                echo "______________________________" ; echo "" ; echo "" ; echo -e "  ${ORANGE}<${STOP}  NMAP info  ${ORANGE}>${STOP}  " ; echo "" ; echo ""
                                nmap -Pn -A -sV -sS $ip_addr -p-


			elif [[ $number -eq 2 ]]
			then
                	        echo "______________________________" ; echo "" ; echo "" ; echo -e "  ${ORANGE}<${STOP}  WHOIS info  ${ORANGE}>${STOP}  " ; echo "" ; echo ""
                	        whois $ip_addr | head -56 | tail -24

                                echo "______________________________" ; echo "" ; echo "" ; echo -e "  ${ORANGE}<${STOP} NMAP info  ${ORANGE}>${STOP}  " ; echo "" ; echo ""
                                nmap $ip_addr -p-

			else

				echo ""
				echo -e "${ORANGE}[i]${STOP} '$number' is unavailable, type the proposed keywords correctly."
			RCP
			fi

	        echo "______________________________" ; echo ""
		read -p " - type an open service. (ex. ftp, ssh, telnet): "     answer
		echo ""
		read -p " - type the service open port: "     port
		echo "______________________________" ; echo ""


		echo -e "${ORANGE}[i]${STOP} you'll be asking to type the target username and password."
		echo ""

#remote connection protocols give you access to any wanted user
#secure shell access

        #sshpass & ssh
                if [[ $answer = "ssh" ]]
                then
                        read -p " - type the target UserName: "     username
                        echo ""
                        read -s -p " - type the target PassWord: "     password
                        echo ""
                        echo "______________________________"
                        echo ""

		sshpass -p $password ssh -p $port $username'@'$ip_addr
                LOOP

	#ftp
		elif [[ $answer = ftp ]]
		then
		ftp $ip_addr $port
		LOOP

	#telnet
		elif [[ $answer = telnet ]]
		then
		telnet $ip_addr $port
		LOOP

	#error message
		elif [[ $answer = "Permission denied, please try again." ]]
		then
		echo ""
		echo " - seem like a mistake has been made, repeat the RCP process."
		echo ""
		RCP

	#else
		else
                echo -e "${ORANGE}[i]${STOP} '$answer' is unavailable for remote control, type the right open service correctly."
		RCP
		fi
}


#function loop keep the script running
function LOOP ()
{
	sleep 3
	echo "______________________________"
	echo ""
	echo -e "${ORANGE}[i]${STOP} you can restart the RCP program."
	echo ""
	read -p " - press Any Key to continue, type X to exit: "     press

	if [[ $press = X || $press = x ]]
	then
	echo ""
	echo -e " - dont forget going to: ${RED}https://github.com/Gh0stAn0n${STOP} for more content."
        sleep 3
        exit

	else
	RCP
	fi
}


        #function ACTIVE can be enable only if function CURRENT is 'activated'
        #cl (status) = active
        function ACTIVE()
        {
                        echo -e "${BLUE} \e[5m- your current location is already in ghost mode. ${STOP}"
			echo "______________________________"
                        echo ""
			echo -e "${ORANGE}[i]${STOP} if option 'no' is selected, the session will close."
			echo ""
                        read -p " - do you want me to activate the remote control protocol program ? (yes/no): "     answer

                        if [[ $answer = YES || $answer = Yes || $answer = yes || $answer = y || $answer = Y ]]
                        then
			sleep 2
                        RCP

                        elif [[ $answer = NO || $answer = No || $answer = no || $answer = n || $answer = N ]]
			then
			echo ""
                        echo -e " - dont forget going to: ${RED}https://github.com/Gh0stAn0n${STOP} for more content."
                        sleep 3
                        exit

                        else
                        echo ""
                        echo -e "${ORANGE}[i]${STOP} '$answer' is unavailable, type the proposed keywords correctly."
                        echo ""
			ACTIVE
                        fi
        }


#functions:

ROOT	       #root identifier
CURRENT        #checking current Location/Connection
#VPN	       #virtual private network On/Off
#NIPE          #connecting to a secured Location/Connection
#RCP	       #remote connection protocols
#LOOP          #keep the script running
