#!/bin/bash

testuser=root

if grep $testuser /etc/passwd
then
    echo "The bash files for user $testuser are:"
    ls -a /home/$testuser/.b*
    echo
else
    echo "The user $testuser does not exist on this system"
    echo 
fi


# case 2
echo '--------case 2--------'
if grep $testuser /etc/passwd
then
    echo "The user $testuser exists on this system."
elif ls -d /home/$testuser
then
    echo "The user $testuser does exist on this sytem."
    echo "However, $testuser has a directory"
else
    echo "The user $testuser does not exist on this system."
fi
