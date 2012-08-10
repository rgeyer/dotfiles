#!/bin/sh -e

bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)

info=${bold}${blue}
warn=${bold}${yellow}
success=${bold}${green}
failure=${bold}${red}

cd "$(dirname "$0")"

for i in `find . -type f -name ".*"`; do
	DOTFILE=`basename "$i"`
	if [[ -f $HOME/$DOTFILE && ! -f $HOME/${DOTFILE}_bkup ]]; then
		echo "${warn}$HOME/$DOTFILE already existed, backing it up to $HOME/$DOTFILE_bkup before clobbering it${reset}"
		cp $HOME/$DOTFILE "$HOME/${DOTFILE}_bkup"
	fi
	ln -sf ${PWD}/$DOTFILE $HOME/$DOTFILE
done
