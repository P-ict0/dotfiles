#!/bin/bash

#######################################################
#######################################################
# 			Set paths and declare functions								#
#######################################################
#######################################################
i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf

setI3() {
	mv $i3PATH ${i3PATH}.backup
	cp ${PWD}/i3/config $i3PATH
}

setALACRITTY() {
	mv $alacrittyPATH ${alacrittyPATH}.backup
	cp ${PWD}/alacritty/alacritty.yml $alacrittyPATH
}

setTMUX() {
	mv $tmuxPATH ${tmuxPATH}.backup
	cp ${PWD}/tmux/.tmux.conf $tmuxPATH
}

#######################################################
#######################################################
# 				Read arguments															#
#######################################################
#######################################################
# If not arguments supplied														#
#######################################################
if [ $# -eq 0 ]; then
	echo "Run the script as follows: ./script option1 [option2] [option3] ..."
	echo
	echo "Possible options are:"
	echo "i3"
	echo "alacritty"
	echo "tmux"
	exit 0

#######################################################
# If arguments supplied																#
#######################################################
else
	for i in $@
	do 
  	if [ "$i" == "i3" ]; then
				setI3
	
		elif [ "$i" == "tmux" ]; then
				setTMUX

		elif [ "$i" == "alacritty" ]; then
				setALACRITTY

		else
				echo -e "Invalid option: $i\n"
		fi
	done

	echo -e "Done!"
fi
