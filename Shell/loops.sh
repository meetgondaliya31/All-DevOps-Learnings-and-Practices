#!/bin/bash


<< cmnt

for (( i=$2; i<=$3; i++ ))
do
	mkdir $1$i
done

cmnt



read -p "Enter starting number : " start 
read -p "Enter ending number : " end

while [[ $start -le $end ]];
do
	echo $start
	((start+=2))
done
