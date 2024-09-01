#!/bin/bash

userid=($id -u)

check_root()
if ($userid -ne 0)
then
 echo "\R user don't have sudo prevelaged"
 exit 1
fi

R=\e[32m
G=\e[33m
Y=\e[34m

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"
    fi
}