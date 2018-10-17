#!/bin/bash

if [ $# -lt 2 ]
then
	echo "run: <script> <directory name> <extensions or 'all'>"
	exit 1;
fi

if [ ! -d $1 ]
then
	echo "directory does not exist"
	exit 1;
fi

for file in $1/*
do
	if [[ $# == 2 && $2 == "all" ]]
	then
		if [[ -f $file ]];
		then
			fullfilename=$file
			fullfilename=$(sed 's/ /_/g' <<< $fullfilename)
			filename=$(basename "$fullfilename")
			fname="${filename%.*}"
			ext="${filename##*.}"

			if [ $ext != $fname ]
			then
				if [ ! -d $1/${ext^^} ]
				then
					mkdir $1/${ext^^}
				fi
				mv -i "$file" $1/${ext^^}
			fi
		fi
	else
		if [[ -f $file ]]
		then
			fullfilename=$file
			fullfilename=$(sed 's/ /_/g' <<< $fullfilename)
			filename=$(basename "$fullfilename")
			fname="${filename%.*}"
			ext="${filename##*.}"
			
			extensions=$@
			f=$1
			len=${#f}
			extensions=${extensions:len+1}
			grep -q "$ext" <<< "$extensions"
		
			if [ $? -ne 0 ]
			then
				continue
			fi
				
			if [ $ext != $fname ]
			then
				if [ ! -d $1/${ext^^} ]
				then
					mkdir $1/${ext^^}
				fi
				mv -i "$file" $1/${ext^^}
			fi
		fi
	fi
done