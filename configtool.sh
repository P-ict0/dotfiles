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

## Functions: 
# arg1 = 1: set
# arg1 = 0: fetch
I3() {
	if [ "$1" -eq "1" ]; then
		mv ${i3PATH} ${i3PATH}.backup
		cp i3/config ${i3PATH}
		echo "Set I3..."
	
	else
		cp ${i3PATH} i3/config
		echo "Fetch I3..."
	fi
}

TMUX() {
	if [ "$1" -eq "1" ]; then
		mv ${tmuxPATH} ${tmuxPATH}.backup
		cp tmux/.tmux.conf ${tmuxPATH}
		echo "Set TMUX..."
	else
		cp ${tmuxPATH} tmux/.tmux.conf
		echo "Fetch TMUX..."
	fi
}

ALACRITTY() {
	if [ "$1" -eq "1" ]; then
		mv ${alacrittyPATH} ${alacrittyPATH}.backup
		cp alacritty/alacritty.yml ${alacrittyPATH}
		echo "Set ALACRITTY..."
	else
		cp ${alacrittyPATH} alacritty/alacritty.yml
		echo "Fetch ALACRITTY"
	fi
}

DUNST() {
	if [ "$1" -eq "1" ]; then
		mv ${dunstPATH} ${dunstPATH}.backup
		cp dunst/dunstrc ${dunstPATH}
		echo "Set DUNST..."
	else
		cp ${dunstPATH} dunst/dunstrc
		echo "Fetch DUNST..."
	fi
}

NEOFETCH() {
	if [ "$1" -eq "1" ]; then
		mv ${neofetchPATH} ${neofetchPATH}.backup
		cp neofetch/config.conf ${neofetchPATH}
		echo "Set NEOFETCH..."
	else
		cp ${neofetchPATH} neofetch/config.conf
		echo "Fetch NEOFETCH..."
	fi
}

NVIM() {
	if [ "$1" -eq "1" ]; then
		mv ${nvimDIRPATH} ${nvimDIRPATH}.backup
		cp -r nvim ${nvimDIRPATH}
		echo "Set NVIM..."
	else
		rm -rf nvim
		cp -r ${nvimDIRPATH} .
		echo "Fetch NVIM"
	fi
}

#######################################################
#######################################################
# 	Read arguments				      			      #
#######################################################
#######################################################
while getopts hs:f: flag; do
    case "${flag}" in
    	h)
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

			else
				echo -e "Invalid option: ${OPTARG}\n"
				exit 0
			fi
			;;
    esac
done

