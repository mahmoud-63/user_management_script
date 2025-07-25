#!/bin/bash
CSV_FILE="/home/mahm00d/user_management_script/employee.csv"
read -p "Please Enter Your Username: " name
read -p "Please Enter Your Full-Name: " full_name
INFO=$name,$full_name
echo "Please Make Sure You Enterd Your Full-Name and Username correctly, Your Username is: $name, Your Full-Name is: $full_name "
read -p " That Was Correct? [y/n]" ans
case $ans in
        n | N)
                echo " Full name or username was not correct "
                ;;
        y | Y)
                echo " Thank You Sir "
                echo "$INFO" >> $CSV_FILE
                ;;
        *)
                echo "wrong input"
                exit
                ;;
esac