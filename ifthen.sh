#!/bin/bash

# case 1
if pwd
then
    echo "It worked"
fi

# case 2
if IamNotaCommand
then 
    echo "It worked"
fi
echo "We are outsie the if statement"

# case 3
if pwd ; then
    echo "It worked"
fi

# case 4
testuser=root

if grep $testuser /etc/passwd
then
    echo "This is my first command"
    echo "This is my second command"
    echo "I can event put in other commands besides echo:"
    ls -a /home/$testuser/.b*
fi
