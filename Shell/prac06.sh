#!/bin/bash


# -> Print the multiplication table

# echo "Enter the number : "
# read num

# for ((i=1; i<11; i++))
# do
#     echo "$num x $i = $((num*i))"
# done






# -> Calculate a factorial

# read -p "Enter the number " num
# fact=1
# for ((i=1; i<=$num; i++))
# do 
#     fact=$((fact * i))
# done

# echo "The fact of $num is : $fact"







# -> Print Fibonacci numbers

# read -p "Enter the range : " range

# a=0
# b=1

# echo $a
# echo $b

# for ((i=2; i<=$range; i++))
# do 
#     fibo=$((a + b))
#     echo $fibo

#     a=$b
#     b=$fibo
# done






# -> Reverse a number

# clear
# read -p "Enter a number: " num
# echo $num | rev
   





# -> pattern 

# for ((i=1; i<=5; i++))
# do
#     for ((p=1; p<=i; p++))
#     do
#         echo -n "* "
#     done
#     echo
# done





set -x
# -> Ping multiple servers from a file

serverfile="servers.txt"

while IFS= read -r line || [[ -n "$line" ]];
do
    ping -c 1 $line &> /dev/null
    if [ $? -eq 0 ]; then
        echo "$line is reachable"
    else
        echo "$line is not reachable"
    fi                          
done < "$serverfile"