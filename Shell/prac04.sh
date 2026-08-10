#!/bin/bash
 
n1=$1
n2=$2
n3=$3


sum=$(( n1+n2 ))
echo $sum






# if [[ $n1 -gt $n2 ]]; then
#     echo "First number is greater"

# elif [[ $n2 -gt $n1 ]]; then
#     echo "Second number is greater"

# else 
#     echo "Both numbers are equal"
# fi






# if (( $n1 % 2 == 0 )); then
#     echo "First number one is even"
# else 
#     echo "First number is odd"
# fi 

# if (( $n2 % 2 == 0 )); then
#     echo "Second number one is even"
# else 
#     echo "Second number is odd"
# fi 






# if [[ $n1 -gt $n2 && $n1 -gt $n3 ]]; then
#     echo "First number is largest"

# elif [[ $n2 -gt $n1 && $n2 -gt $n3 ]]; then
#     echo "Second number is largest"

# else 
#     echo "Third number is largest"
# fi






# if docker -v &> /dev/null; then
#     echo "docker is insdtalled"
# else
#     echo "docker is not installed"
# fi






if curl -s --head http://www.google.com | grep -q "200 OK"; then
    echo "Connection is available"
else
    echo "Connection is not available"
fi