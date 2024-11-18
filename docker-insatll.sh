#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


root_check(){
    if [ $USERID -ne 0]
    then
    echo -e "Please run the script with root user $R" 
    exit
    fi
}

VALIDATE(){
     if [$1 -ne 0]
 then 
 echo -e "$1 command failed please recheckonce $R"
 else
 echo -e "$G the commnand is success $2"
 fi
}

docker version

if ( $? -ne 0 )
then
echo "docker is alredy there $N"
else
 echo "going to install docker"

 sudo dnf -y install dnf-plugins-core
 VALIDATE $? "install docker"


 
 