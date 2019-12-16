#!/bin/bash
#Append output to a file
FILE="/tmp/data"
head -n1 /etc/passwd > $FILE

#Read form INput
read LINE < $FILE
echo "Content of file is $LINE"

#Update contents of existing file
head -n3 /etc/passwd > $FILE

#Append content to file
echo $RANDOM $RANDOM >> $FILE
cat $FILE

#Read STDIN using file descriptor
read LINE 0< $file
echo 
echo "LINE CONTAINS: $LINE"

#Redirect STDOUT using FD1
head -n3 /etc/passwd 1> $FILE
cat $FILE

#Redirect STDERR to a file
ERRFILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERRFILE}
echo "ERR FILE"
cat $ERRFILE

#Redirect STDERR & STDOUT to a file
head -n3 /etc/passwd /fakefile &> ${FILE}
echo 
cat $FILE

#Redirect STDERR & STDOUT through a pipe
echo 
head -n3 /etc/passwd /fakefile |& cat -n

#DISCATRD STDOUT
echo "Discarding stdout"
head -n3 /etc/passwd /fakefile > /dev/null

#DISCATRD STDERR
echo "Discarding stderr"
head -n3 /etc/passwd /fakefile 2> /dev/null

#DISCATRD BOTH STDERR & STDOUT
echo "Discarding both"
head -n3 /etc/passwd /fakefile &> /dev/null

rm $FILE $ERRFILE &> /dev/null
