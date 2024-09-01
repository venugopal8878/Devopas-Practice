#!/bin/bash

userid=$(id -u)

if [$userid -ne o]
then
    echo "user have not sudo previlages"
    exit 1 #inshell script other than 0 is failed so comeout of the script
else
    echo "user have root access"
fi

dnf list install mysql

#$?  gives the previoes comd run/installed or not

if [ $? -ne 0]
then
    echo " mysql is not insatll going to install"
dnf install mysql -y
    if [ $? -ne 0]
    then 
        echo "mysql is not installed kindly check"
         exit 1 #inshell script other than 0 is failed so comeout of the script
    else
        echo "my sql is installed"
else
    echo "mysql is alredy install"
fi

dng list install git

if [ $? -ne 0]
then 
    echo "git not installed going to install"
    dnf instal git -y
    if [ $? -ne 0]
    then 
        echo "git  not installed kindly check"
         exit 1
    else 
        echo "git installed"
else
  echo "git is already installed"
fi