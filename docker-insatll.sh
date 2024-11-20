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

dnf -y install dnf-plugins-core
 VALIDATE $? "install docker"

dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
VALIDATE $? "install docker second"

dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


systemctl enable --now docker

usermod -aG docker ec2-user

echo -e "$R Logout and Login again $N"
 
 
