#!/bin/bash

function func1 {
    echo "This is an example of a function"
}

count=1
while [ $count -le 5 ]
do 
    func1
    count=$[ $count + 1 ]
done 

echo "This is the ned of the loop"
func1
echo "Now this is the end of the script"

func2() {
    echo "This is example of function"
    ls -l badfile
}

func2
echo "The exit status is: $?"

#return 
function db1 {
    read -p "Enter a value: " value 
    echo "doubling the value"
    return $[ $value * 2 ]
}

db1
echo "the new value is $?"

#
function db2 {
    read -p "Enter a value: " value 
    echo $[ $value * 2 ]
}

result=$(db2)

echo "The new value is $result"


# case 3
function func7 {
    echo $[ $1 * $2 ]
}

if [ $# -eq 2 ]
then 
    value=$(func7 $1 $2)
    echo "The result is $value"
else 
    echo "Usage: badtest1 a b"
fi 

# local
function func8 {
    local temp=$[ $value + 5 ]
    result=$[ $temp * 2 ]
}

