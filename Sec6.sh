#!/bin/bash
case "${1}" in 
   start) echo 'Starting' ;;
   stop)  echo 'Stopping' ;;
   status) echo 'Status' ;;
   *) echo 'Please supply valid arguments' 
    #   exit 1;;
esac


log()
{
    #This function sends a message to syslog and to std output if VERBOSE is true
    local MESSAGE=$@ #variable value exists only inside the function (local variable)
    if [[ $VERBOSE = 'true' ]]
    then    
      echo $MESSAGE
    fi

    logger -t Sec6.sh $MESSAGE
}

readonly VERBOSE='true'  #global varible

log 'Hello!'
log 'This is fun'

# sudo tail /var/log/messages (you can see those log statements in there)


usage(){
   echo "Usage: ${0} [-vs] [-l length]" >&2
   echo 'Generate a random password'
   echo  '-l Length specify'
   echo '-s special char'
   echo '-v verbose mode on'
   exit 1
}

logNew()
{
    local MESSAGE=$@
    if [[ $VERB = 'true' ]]
    then    
      echo $MESSAGE
    fi
}

LENGTH=48

#l: means -l must be followed by a argument such as -l 4
while getopts vl:s OPTION
do
  case $OPTION in
    v)
      VERB='true'
      echo 'VERBOSE mode on'
      ;;
    l)
      LENGTH=$OPTARG
      ;;
    s)
      USE_SPECIAL_CHAR='true'
      ;;
    ?)
      usage
      ;;
  esac    
done

logNew 'Generating a password'

PASSWORD=$(date +%s%N$RANDOM$RANDOM | sha256sum | head -c${LENGTH})

if [[ $USE_SPECIAL_CHAR = 'true' ]]
then
   SPECIAL_CHAR=$(echo '!@#$%^&*()-+=' | fold -w1 | shuf | head -c1)
   PASSWORD=$PASSWORD$SPECIAL_CHAR
fi   

logNew 'Done'
logNew 'Here is the password'

#DISplay Password
echo $PASSWORD

exit 0

