#!/bin/bash
# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" != 0 ]]
then
  echo "please run with sudo or as root."
  exit 1
fi
# Username 
read -p "Enter the username:" USER_NAME

# Real-username of the user 
read -p "Enter the real name of user:" REAL_NAME

# Initial password 
read -p "Enter the password: " PASSWORD
echo ""${PASSWORD}"" | sudo chpasswd > /dev/null 2>&1
# add-user
adduser "${USER_NAME}"

# Check if the account created or not 
if [[ $? = 0 ]]
then 
  echo "the user name :"${USER_NAME}" is created . "
  exit 0
else 
  echo "there is an error try again please ."
  exit 1
fi
