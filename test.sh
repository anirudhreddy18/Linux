#!/bin/bash

echo 'Hello'

# Variables
temp='Script'

echo $temp

#Display variable assigned
echo "This is a shell $temp"

#Display USer id
echo "UID is $UID"

#Assign to a variable and display
UNAME=$(id -un)
echo "USERNAME IS $UNAME"

#Assign to a variable and print exact USERNAME=vagrant
echo USERNAME=$(id -un)

#if/else statement -eq, -lt, -gt, 
if [[ $UID -eq 0 ]]
then
  echo "You are root."
else
  echo "You are non root."
fi  

echo "Current UserID is $UID"

if [[ UID -ne 1000 ]]
then
  echo "Current UID is $UID"
  #exit -- you can exit from the script here
fi 

echo "Current USER is $USER"

#if/else statement comparision by string text
if [[ $USER = vagrant ]]
then
  echo "You are right user."
else
  echo "You are not right user."
fi  

USERNAME="wtps"
useradd -c "Anirudh Vemula" -m $USERNAME

echo anirudh | passwd --stdin $USERNAME

passwd -e $USERNAME
