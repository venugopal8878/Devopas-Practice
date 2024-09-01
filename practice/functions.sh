#!/bin/bash

userid =$(id -u) #check user have root access 

validate(){
    if ($1 -ne o)  #$1 means this is first argument
     echo "$2 is failed"  #$2is secong argument of function
     exit 1
    else
     echo "$2 is sucesss"
}

if ($userid -ne o)
    echo "you dont have sudo prevelages"
    exit 1
fi

dnf list install git

if($? -ne 0)
then 
 echo "going to install git"
 dnf  insatll git -y
 validate $? "installing git"
else
 echo "git is alredy their"
fi

dnf install mysql

if ($? -ne 0)
then 
 echo "going to install mysql"
 dnf install mysql -y
 validate $? "installing mysql"
else
 echo "my sql filed to their"
fi