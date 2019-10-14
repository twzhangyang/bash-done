#!/bin/bash

echo -n "Enter your name: "
read name

echo "Hello $name welcome to my program. "


# read -p

read -p "Please enter your age: " age
days=$[ $age * 365 ]
echo "That makes you over $days days old! "

# read multiple variable
read -p "Enter your name: " first last

echo "Checking data for $last, $first..."

# -s 
read -s -p "Enter your password: " pass
echo 
echo "Is your password really $pass? " 