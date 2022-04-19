#!/bin/bash

#######################################################
#######################################################
# 			Set paths and declare functions								#
#######################################################
#######################################################
i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf
dunstPATH=~/.config/dunst/dunstrc

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

setDUNST() {
	mv $dunstPATH ${dunstPATH}.backup
	cp ${PWD}/tmux/.tmux.conf $dunstPATH
}

fetchI3() {
	cp $i3PATH ${PWD}/i3/config
}

fetchALACRITTY() {
	cp $alacrittyPATH ${PWD}/alacritty/alacritty.yml
}

fetchTMUX() {
	cp $tmuxPATH ${PWD}/tmux/.tmux.conf
}

fetchDUNST() {
	cp $dunstPATH ${PWD}/dunst/dunstrc
}

#######################################################
#######################################################
# 				Read arguments															#
#######################################################
#######################################################
while test $# -gt 0; do
	case "$1" in
    -h|--help)
			echo "Run the script as follows: ./script [action] [argument1 argument2 ...] [action2] [argument1 argument2 ...]"
			echo
			echo "Possible actions are:"
			echo "-s | --set) Sets configs from repo to system"
			echo "-f | --fetch) Copies configs from system to repo"
			echo
			echo "Possible arguments are:"
			echo "i3"
			echo "alacritty"
			echo "tmux"
			echo "dunst"
			exit 0
			;;

		-s | --set)
			shift
			for i in $@
			do 	
  			if [ "$i" == "i3" ]; then
					setI3
	
				elif [ "$i" == "tmux" ]; then
					setTMUX

				elif [ "$i" == "alacritty" ]; then
					setALACRITTY
		
				elif [ "$i" == "dunst" ]; then
					setDUNST	

				else
					echo -e "Invalid option: $i\n"
		
				fi
			done
			shift
			;;

		-f | --fetch)
			shift
			for i in $@
			do 	
  			if [ "$i" == "i3" ]; then
					fetchI3
	
				elif [ "$i" == "tmux" ]; then
					fetchTMUX

				elif [ "$i" == "alacritty" ]; then
					fetchALACRITTY
		
				elif [ "$i" == "dunst" ]; then
					fetchDUNST	

				else
					echo -e "Invalid option: $i\n"
		
				fi
				done
				shift
			;;
		*)
			echo "Please specify option!"
			break
			;;
	esac
done

