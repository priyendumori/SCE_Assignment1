#!/bin/bash

read -sp "Enter password: " pass

if [[ ${#pass} -ge 8 && "$pass" == *[0-9]* && "$pass" == *[@\#$%\&*+-=]* ]]
then
	echo -e "\nGood password"
else
	echo -e "\nWeak password"
fi