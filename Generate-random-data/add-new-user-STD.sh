#!/bin/bash
# This script creates a new user on the local system
# You must supply a username as an argument to the script
# Optionally , you can also provide a comment for the account as an argument
# A password will be automaticall generated for the account . 
# The username , password , and host for the account will be diplayed . 
# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" != 0 ]]
then
  echo "please run with sudo or as root." >&2
  exit 1
fi
# If they don't supply at least one argument, then give them help.
if [[ "${#}" = 0 ]]
then 
  echo "Usge:${0} USER_NAME [COMMENT].. " >&2
  echo "Create an account on the local system with the name of USER_NAME and a comments field of COMMENT . " >&2
  exit 1
fi 

# The first parameters are for the account comments.
USER_NAME="${1}"
# The rest of the parameters are for the account comments.
shift
COMMENT="${@}"

#Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)
# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been .
if [[ "${?}" != 0 ]]
then 
 echo " The password for the account could not be set." >&2
 exit 1
fi
# Force password change on first login.
passwd -e ${USER_NAME} &> /dev/null

# Display the username,password,and the host where the user was created.
echo
echo "username:"
echo "${USER_NAME}"
echo 
echo "${PASSWORD}"
echo 
echo "host:"
echo "${HOSTNAME}"
exit
