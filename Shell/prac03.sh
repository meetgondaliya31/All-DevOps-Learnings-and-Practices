#!/bin/bash

# read -p "Enter number-1 : " n1
# read -p "Enter number-2 : " n2

# sum=$((n1+n2))

# echo "sum : $sum" 


read -p "enter dir name : " dir

    ls $dir 

read -p "enter username : " uname

if [[ $uname == $(uname) ]]; then

    echo "user exists"

else 
    echo "user doesn't exists!"

fi