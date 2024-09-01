#!/bin/bash

userid=$(id -u)
R="\e[31m"
Y="\e[32m"
G="\e[33m"

root_check(){
    if [$userid -ne 0]
    then 
      echo "user don't have sudu prevelages"
      exit 1
    fi
}

validate(){
    if [$? -ne 0]
     echo "$2 is not $R failed to instllaed $N"
    else
     echo "$2 is $Y sucessfully installed $N"
    fi
}

root_chek 

# sh loops2.sh input pakage git mysql inginx
for pacakage in $@  #refer to all arguments passed to it
do 
  dnf list installed $pakage 
    if [$? -ne o]
    then
     echo "$package is not insatalled going to insall"
     dnf install $pakage -y
     validate $? "installing $package"
    else
     echo "$pakage is alredy installed"
    fi
done