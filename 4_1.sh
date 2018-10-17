#!/bin/bash

if [[ -f "$1" ]]
then
	t="$( file "$1" )"
	t=$(sed s/[^:]*:// <<< "$t") 
	grep -qE "compress|archive|zip" <<< "$t"
	
	if [ $? -eq 1 ]
	then
		echo "$1 is not a compressed file"
	else
		case "$1" in
			*.tar.bz2)   tar xvjf "$1"     ;;
			*.tbz2)      tar xvjf "$1"     ;;
			*.tar.gz)    tar xvzf "$1"     ;;
			*.tgz)       tar xvzf "$1"     ;;
			*.bz2)       bunzip2 "$1"      ;;
			*.zip)       unzip "$1"        ;;
			*.gz)        gunzip "$1"       ;;
			*.tar)       tar xvf "$1"      ;;
			*.tar.xz) 	 tar xf "$1"		 ;;
			*.xz)		 tar xvfJ "$1"	 ;;
			*)           echo "The compression format is not supported" ;;
		esac
	fi
else
	echo "$1 is not a valid file"
fi