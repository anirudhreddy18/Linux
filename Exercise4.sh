#!/bin/bash
if [[ $USER != root ]]
then
  echo "User cannot be created"
  exit 1
fi  

if [[ $# -eq 0 ]]
then
  echo "Please provide an account name in the arguments supplied"
  exit 1
fi  

USERNAME="$1"

shift

COMMENT="$@"

echo $USERNAME

echo $COMMENT

useradd -c "$COMMENT" -m $USERNAME 
echo "User Created is $USERNAME"

PASSWORD=$(date +%s$RANDOM | sha256sum | head -c48)
echo PASSWORD | passwd --stdin $USERNAME

echo "Password is $PASSWORD"



