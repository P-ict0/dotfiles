#!/bin/bash

#######################################################
#######################################################
# 	Set paths and declare functions		      #
#######################################################
#######################################################
i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf
dunstPATH=~/.config/dunst/dunstrc
neofetchPATH=~/.config/neofetch/config.conf

## Functions: 
# arg1 = 1: set
# arg1 = 0: fetch
I3() {
	if [ "$1" -eq "1" ]; then
		mv $i3PATH ${i3PATH}.backup
		cp ${PWD}/i3/config $i3PATH
	
	else
		cp $i3PATH ${PWD}/i3/config
	fi
}

TMUX() {
	if [ "$1" -eq "1" ]; then
		mv $tmuxPATH ${tmuxPATH}.backup
		cp ${PWD}/tmux/.tmux.conf $tmuxPATH
	
	else
		cp $tmuxPATH ${PWD}/tmux/.tmux.conf
	fi
}

ALACRITTY() {
	if [ "$1" -eq "1" ]; then
		mv $alacrittyPATH ${alacrittyPATH}.backup
		cp ${PWD}/alacritty/alacritty.yml $alacrittyPATH
	
	else
		cp $alacrittyPATH ${PWD}/alacritty/alacritty.yml
	fi
}

DUNST() {
	if [ "$1" -eq "1" ]; then
		mv $dunstPATH ${dunstPATH}.backup
		cp ${PWD}/dunst/dunstrc $dunstPATH
	
	else
		cp $dunstPATH ${PWD}/dunst/dunstrc
	fi
}

NEOFETCH() {
	if [ "$1" -eq "1" ]; then
		mv $neofetchPATH ${neofetchPATH}.backup
		cp ${PWD}/neofetch/config.conf $neofetchPATH
	
	else
		cp $neofetchPATH ${PWD}/neofetch/config.conf
	fi
}

#######################################################
#######################################################
# 	Read arguments				      #
#######################################################
#######################################################
while getopts hs:f: flag
do
    case "${flag}" in
    	-h)
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
				exit 0
				;;

		-s)
  		if [ "$i" == "i3" ]; then
				I3 1
	
			elif [ "$i" == "tmux" ]; then
				TMUX 1

			elif [ "$i" == "alacritty" ]; then
				ALACRITTY 1
		
			elif [ "$i" == "dunst" ]; then
				DUNST	1

			elif [ "$i" == "neofetch" ]; then
				NEOFETCH 1

			else
				echo -e "Invalid option: $i\n"
				exit 0
			fi
			;;

		-f)
  		if [ "$i" == "i3" ]; then
				I3 0
	
			elif [ "$i" == "tmux" ]; then
				TMUX 0

			elif [ "$i" == "alacritty" ]; then
				ALACRITTY 0
		
			elif [ "$i" == "dunst" ]; then
				DUNST	0

			elif [ "$i" == "neofetch" ]; then
				NEOFETCH 0

			else
				echo -e "Invalid option: $i\n"
				exit 0
			fi
			;;
    esac
done

