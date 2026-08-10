#!/bin/bash


# -> Create an addition function

# mul(){
#     multiplication=$(($1 * $2))
#     echo $multiplication
# }
# result=$(mul 20 20)
# echo $result






# -> Create a calculator using functions

calculator(){

local num1=$1
local num2=$3
local opt=$2

    case $opt in 
        "+") 
            result=$(( num1 + num2 ))
        ;;
        "-") 
            result=$(( num1 - num2 ))
        ;;
        "*") 
            result=$(( num1 * num2))
        ;;
        "/") 
            result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
        *)
            echo "Input valid operator!!"
        ;;
    esac
    echo $result  
}

read -p "Enter the first number : " num1
read -p "Enter the operator : " opt
read -p "Enter the second number : " num2

result=$(calculator "$num1" "$opt" "$num2")
echo $result