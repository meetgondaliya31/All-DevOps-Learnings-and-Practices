#!/bin/bash


# -> Create a Linux menu:
# 1. Date
# 2. Calendar
# 3. Disk Usage
# 4. Memory Usage
# 5. Exit


# PS3="Choose an option : "
# options=( "Date" "Calendar" "Disk_Usage" "Memory_Usage" "Exit" )
# select opt in "${options[@]}"; do
#     case $opt in 
#         "Date") echo "$(date)";;
#         "Calendar") echo "$(cal -3)";;
#         "Disk_Usage") echo "$(df -hT)";;
#         "Memory_Usage") echo "$(free -h)";;
#         "Exit") break;;
#         *) echo "Invalid output!!";;
#     esac
# done






# -> Build a calculator using case.

while true;
do

    PS3="Choose any one operation : "
    select opt in add sub mul div
    do
        echo "enter first number : "
        read num1
        echo "enter second number : "
        read num2

        case $opt in
            "add") 
                result=`expr $num1 + $num2`
                echo "The answer is : $result"
                break
            ;;
            "sub") 
                result=`expr $num1 - $num2`
                echo "The answer is : $result"
                break
            ;;
            "mul") 
                result=$(( num1 * num2 ))
                echo "The answer is : $result"
                break
            ;;
            "div") 
                result=$(echo "scale=3; $num1 / $num2" | bc)
                echo "The answer is : $result"
                break
            ;;
            *)
                echo "enter valid option!!"
                break
                ;;
        esac
    done    
done    