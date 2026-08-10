#!/bin/bash

function permission() {

read -p "enter yr username: " username

if [[ $username == "$1" ]];
then 
	echo "U can access!!"
elif
	read -p "how much access u want? : " per
       	[[ $per -ge 51 && $username != $1 ]];
then
	echo "Permission denied!!"
else
	echo "U can access!!"
fi
}

permission "leo"
