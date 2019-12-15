#!/bin/bash

#Already declared bash variable assigned to a new variable
PASSWORD=$RANDOM
echo $PASSWORD

#Assign multiple variables to single variable
PASSWORD=$RANDOM$RANDOM$RANDOM
echo $PASSWORD 

#after 1970 counts the seconds
PASSWORD=$(date +%s)
echo $PASSWORD

#date command suppplied to sha256 algorithm & head prints the first 8 chars.
PASSWORD=$(date +%s | sha256sum | head -c32)
echo $PASSWORD

PASSWORD=$(date +%s$RANDOM | sha256sum | head -c48)
echo $PASSWORD

#prints arguments passed wen executing commnad line 0 is name of file
echo "Name of the file is ${0}"

#Display the Path and filename of the script
echo "You used $(dirname ${0}) as path to the basename $(basename ${0}) script."

#Arguments passed on command line to script they are params
NUMBEROFPARAMS=$#
echo "Nunber of params passed are $NUMBEROFPARAMS"

# $@ for each argument supplied, $* treats all arguments supplied as 1
for X in $@
do
  echo "$X : $(date +%s | sha256sum | head -c48)"
done

#shift removes arguments by 1 , so it prints first 2 args ad keeps removing it
while [[ $# -gt 0 ]]
do
  echo ${1}
  echo ${2}
  shift
done  