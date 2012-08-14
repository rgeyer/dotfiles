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

for i in `find . -name ".*" | grep -v "\.git\|\.$"`; do
	DOTFILE=`basename "$i"`
	if [[ -e $HOME/$DOTFILE && ! -e $HOME/${DOTFILE}_bkup ]]; then
		echo "${warn}$HOME/$DOTFILE already existed, backing it up to $HOME/${DOTFILE}_bkup before clobbering it${reset}"
		mv $HOME/$DOTFILE $HOME/${DOTFILE}_bkup
	fi
	ln -sf ${PWD}/$DOTFILE $HOME/$DOTFILE
done

if [ -d $HOME/.omz ]; then
  cd "$(dirname "$0")/omz_custom"
  for i in `find . | grep -v "\.$"`; do
    DOTCUSTOMFILE=`basename "$i"`
    CUSTOMFILE=$HOME/.omz/custom/$DOTCUSTOMFILE
    CUSTOMFILEBKUP=$HOME/.omz/custom/${DOTCUSTOMFILE}_bkup
    if [[ -e $CUSTOMFILE && ! -e $CUSTOMFILEBKUP ]]; then
      echo "${warn}$CUSTOMFILE already existed, backing it up to $CUSTOMFILEBKUP before clobbering it${reset}"
      mv $CUSTOMFILE $CUSTOMFILEBKUP
    fi
    ln -sf ${PWD}/$DOTCUSTOMFILE $CUSTOMFILE
  done
fi
