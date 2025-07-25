#!/bin/bash
CSV_FILE="/home/mahm00d/user_management_script/employee.csv"
OUTPUT_FILE="/home/mahm00d/user_management_script/output.txt"
if [ $UID -ne 0 ]
then
        echo " you should be root user to run this script"
        exit 2
fi

if [ ! -f $CSV_FILE ]
then
        echo " file not found! "
        exit 2
fi

while IFS=, read -r username full_name
do
        password=$(openssl rand -base64 12)
        useradd -m -c "$full_name " $username
        echo "$username:$password" | chpasswd
        chage -d 0 $username
        echo " user created: $username"
        echo " full name: $full_name"
        echo "random password: $password "
        echo "---------------------------"
        echo "$username , $password " >> $OUTPUT_FILE
done < $CSV_FILE
echo " user creation completed  "