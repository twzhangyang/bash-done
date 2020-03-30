#!/bin/bash
testuser=root

if grep $testuser /etc/passwd
then 
    echo "then bash files for user $testuser are:"
    ls -a /home/$testuser/.b*
    echo 
else 
    echo "The user $testuser does not exist on this user"
fi



#number
value=10
if [ $value -gt 5 ]
then 
    echo "The test value $value is greater than 5"
fi

if [ $value -eq 10 ]
then 
    echo "The value are 10"
else 
    echo "The value are different"
fi

# n -eq n2
# n -ge n2
# n -gt n2
# n -le n2
# n -lt n2
# n -ne n2

