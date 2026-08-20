#!/bin/bash

dir= $(mkdir $1)
# file= $(touch $2)


echo "${dir}"
echo "Directory ${1} is created"


for (( i=1; i<=9; i++ ))
do
    touch ./${1}/${2}${i} 
done


ls ${1}
