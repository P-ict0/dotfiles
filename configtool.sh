#!/bin/bash

#######################################################
#######################################################
# 	Set paths and declare functions		      		  #
#######################################################
#######################################################
i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf
dunstPATH=~/.config/dunst/dunstrc
neofetchPATH=~/.config/neofetch/config.conf
nvimDIRPATH=~/.config/nvim
htopPATH=~/.config/htop/htoprc

## Functions: 
# arg1 = 1: set
# arg1 = 0: fetch
I3() {
	if [ "$1" -eq "1" ]; then
		mv ${i3PATH} ${i3PATH}.backup
		cp i3/config ${i3PATH}
		echo "Setting I3..."
		echo "Backup saved!"
	
	else
		cp ${i3PATH} i3/config
		echo "Fetching I3..."
	fi
}

TMUX() {
	if [ "$1" -eq "1" ]; then
		mv ${tmuxPATH} ${tmuxPATH}.backup
		cp tmux/.tmux.conf ${tmuxPATH}
		echo "Setting TMUX..."
		echo "Backup saved!"
	else
		cp ${tmuxPATH} tmux/.tmux.conf
		echo "Fetching TMUX..."
	fi
}

ALACRITTY() {
	if [ "$1" -eq "1" ]; then
		mv ${alacrittyPATH} ${alacrittyPATH}.backup
		cp alacritty/alacritty.yml ${alacrittyPATH}
		echo "Setting ALACRITTY..."
		echo "Backup saved!"
	else
		cp ${alacrittyPATH} alacritty/alacritty.yml
		echo "Fetching ALACRITTY..."
	fi
}

DUNST() {
	if [ "$1" -eq "1" ]; then
		mv ${dunstPATH} ${dunstPATH}.backup
		cp dunst/dunstrc ${dunstPATH}
		echo "Setting DUNST..."
		echo "Backup saved!"
	else
		cp ${dunstPATH} dunst/dunstrc
		echo "Fetching DUNST..."
	fi
}

NEOFETCH() {
	if [ "$1" -eq "1" ]; then
		mv ${neofetchPATH} ${neofetchPATH}.backup
		cp neofetch/config.conf ${neofetchPATH}
		echo "Setting NEOFETCH..."
		echo "Backup saved!"
	else
		cp ${neofetchPATH} neofetch/config.conf
		echo "Fetching NEOFETCH..."
	fi
}

NVIM() {
	if [ "$1" -eq "1" ]; then
		rm -rf ${nvimDIRPATH}.backup
		mv ${nvimDIRPATH} ${nvimDIRPATH}.backup
		cp -r nvim ${nvimDIRPATH}
		echo "Setting NVIM..."
		echo "Backup saved!"
	else
		rm -rf nvim
		cp -r ${nvimDIRPATH} .
		echo "Fetching NVIM"
		echo "Backup saved!"
	fi
}

HTOP() {
	if [ "$1" -eq "1" ]; then
			mv ${htopPATH} ${htopPATH}.backup
			cp htop/htoprc ${htopPATH}
			echo "Setting HTOP..."
			echo "Backup saved!"
		else
			cp ${htopPATH} htop/htoprc
			echo "Fetching HTOP..."
	fi
}

help_message() {
	echo "Run the script as follows: ./script action [program]"
	echo
	echo "Possible actions are:"
	echo "-s Sets configs from repo to system"
	echo "-f Copies configs from system to repo"
	echo "-h Prints the help section"
	echo
	echo "Possible program are:"
	echo "i3"
	echo "alacritty"
	echo "tmux"
	echo "dunst"
	echo "neofetch"
	echo "nvim"
	echo "htop"
}

#######################################################
#######################################################
# 	Read arguments				      			      #
#######################################################
#######################################################
if [ $# -eq 0 ];
then
    help_message
    exit 0
fi

while getopts hs:f: flag; do
    case "${flag}" in
    	h)
			help_message
			exit 0
			;;

		s)
  			if [ "${OPTARG}" == "i3" ]; then
				I3 1
	
			elif [ "${OPTARG}" == "tmux" ]; then
				TMUX 1

			elif [ "${OPTARG}" == "alacritty" ]; then
				ALACRITTY 1
		
			elif [ "${OPTARG}" == "dunst" ]; then
				DUNST	1

			elif [ "${OPTARG}" == "neofetch" ]; then
				NEOFETCH 1

			elif [ "${OPTARG}" == "nvim" ]; then
				NVIM 1

			elif ["${OPTARG}" == "htop" ]; then
				HTOP 1

			else
				echo -e "Invalid option: ${OPTARG}\n"
				exit 0
			fi
			;;

		f)
  			if [ "${OPTARG}" == "i3" ]; then
				I3 0
	
			elif [ "${OPTARG}" == "tmux" ]; then
				TMUX 0

			elif [ "${OPTARG}" == "alacritty" ]; then
				ALACRITTY 0
		
			elif [ "${OPTARG}" == "dunst" ]; then
				DUNST	0

			elif [ "${OPTARG}" == "neofetch" ]; then
				NEOFETCH 0

			elif [ "${OPTARG}" == "nvim" ]; then
				NVIM 0
			
			elif [ "${OPTARG}" == "htop" ]; then
				HTOP 0

			else
				echo -e "Invalid option: ${OPTARG}\n"
				exit 0
			fi
			;;
    esac
done

