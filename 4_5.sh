#!/bin/bash

rownum=$(tput lines)
colnum=$(tput cols)
centerx=$(tput lines)
centery=$(tput cols)

((centerx/=2));
((centery/=2));

tput clear
tput cup $centerx $centery

direction='n'
pdirection='n'

x=$centerx
y=$centery

color=$(($RANDOM%8))

while [ 1 ]
do
	
	read -rsn1 -t 0.5 esc
	if [[ "$esc" == $'\x1b' ]]
	then
		read -rsn1 -t 0.1 b
		if [[ "$b" == "[" ]]
		then	
			read -rsn1 -t 0.1 turn
			pdirection=$direction
			case $turn in
				"A") direction='n' ;;
				"B") direction='s';;
				"C") direction='e';;
				"D") direction='w';;
				*) ;;
			esac
			if [[ $pdirection != $direction ]]
			then
				color=$(($RANDOM%8))
			fi
		fi
	fi
	
	case $direction in
		'n') ((x--)) ;;
		's') ((x++)) ;;
		'e') ((y++)) ;;
		'w') ((y--)) ;;
	esac

	if [[ $x -gt $rownum || $x -le 0 || $y -le 0 || $y -gt $colnum ]]
	then
		color=$(($RANDOM%8))
		tput clear
		x=$centerx
		y=$centery
		direction='n'
	fi

	tput cup $x $y
	tput setaf $color
	echo -e "*\c"
	tput cup $x $y
	
done