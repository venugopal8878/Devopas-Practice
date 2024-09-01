#!bin/bash

logs_folder="var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date _+%d-%m-%y-%h-%m-%s)
log_file="$logs_folder/$script_name-$time_stamp.log"
mkdir -p $logs_folder

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

check_root(){
    if [$userid -ne 0]
  echo "user don't have sudo prevelages"
  exit 1
fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"  | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}

