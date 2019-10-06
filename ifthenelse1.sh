#!/bin/bash

varible="Full"

if test $varible
then
    echo "The $varible expression returns a True"
else
    echo "The $varible expression returns a False"
fi


# case 2

varible=""
if test $varible
then
    echo "The $varible expression returns a True"
else
    echo "The $varible expression treturns a False"
fi

# Number
value1=10
if [ $value1 -gt 5 ]
then
    echo "The test value $value1 is greater than 5"
fi

if [ $value1 -eq 5 ]
then 
    echo "The value are equal"
else
    echo "The value are different"
fi
# n -eq n2
# n -ge n2
# n -gt n2
# n -le n2
# n -lt n2
# n -ne n2

# String
testuser=rich

if [ $USER = $testuser ]
then
    echo "Welcome $testuser"
fi

if [ $USER != $testuser ]
then 
    echo "This is not $testuser"
else
    echo "Welcome $testuser"
fi

var1=baseball
var2=hockey

# $val1 > $val2
if [ $var1 \> $var2 ]
then
    echo "$var1 is greater than $var2"
else
    echo "$var1 is less than $var2"
fi

# -n length !=0
var1=testing
var2=''

if [ -n $var1 ]
then 
    echo "The string '$var1' is not empty"
else
    echo "The string '$var1' is empty"
fi

# -z length =0
if [ -z $var2 ]
then 
    echo "The string '$var2' is empty"
else
    echo "The string '$var2' is not empty"
fi

# File

# -d 是否存在并是一个目录
jump_directory=/home/arthur

if [ -d $jump_directory ]
then 
    echo "The $jump_directory directory exists"
    cd $jump_directory
    ls 
else
    echo "The $jump_directory directory does not exist"
fi

# -e 检查是否存在
# -f 是否存在并是一个文件
# -r 是否存在并可读
# -s 是否存在并非空
# -w 是否存在并可写
# -x 是否存在并可执行
# -O 是否存在并属当前用户所有 
# -G 是否存在并且默认组与当前用户相同
# file1 -nt file2 file1是否比file2新
# file1 -ot file2 file1是否比file2旧

# && ||

if [ -d $HOME ] && [ -w $HOME/testing]
then 
    echo "The file exists and you can write to it"
else
    echo "I cannot write to the file"
fi