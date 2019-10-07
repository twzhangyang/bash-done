#!/bin/bash
# check parameter

if [ -n "$1" ]
then 
    echo Hello $1, glad to meet you.
else
    echo "Sorry, you did not identity yourself."
fi 

factorial=1
for (( number = 1 ; number <= $1 ; number++ ))
do 
    factorial=$[ $factorial * $number ]
done 
echo The factorial of $1 is $factorial


total=$[ $1 * $2 ]
echo The first parameter is $1
echo The second parameter is $2
echo The total value is $total

# more than 10 parameters
# ${10}

# $0

echo The file name is $0

# basename
name=$(basename $0)
echo The file name is $name

# $#
if [ $# -ne 2 ]
then 
    echo Usage: test a b
    echo 
else
    total=$[ $1 + $2 ]
    echo 
fi 

# $* $@
echo 
count=1
for param in "$*"
do 
    echo "\$* parameter #$count = $param"
    count=$[ $count + 1 ]
done 

echo 
count=1
for param in "$@"
do 
    echo "\$@ parameter #$count = $param"
    count=$[ $count + 1 ]
done 

# shift
echo 
count=1
while [ -n "$1" ]
do 
    echo "Parameter #$count = $1"
    count=$[ $count + 1 ]
    shift
done 



