#!/bin/bash 
# Display the UID and username of the user executing this script 
echo "the UID of username =${UID}"

# Display if the user is the root or not
UIT="1000" 
if [[ "${UID}" != "${UIT}" ]];then 
  echo "your UID does not match "${UIT}" "
  exit 1
fi
# Display the UID 

# Only display if the UID does NOT match 1000 .
# Display the uername .
USER_NAME=$(id -un)
# Test if the command succeeded .
if [[ "${?}" != 0 ]]
then 
  echo "the id cmd did not execute succesfully . "
  exit 1
fi
echo "your username is ${USER_NAME}"
# you can use a string test conditional . 
USER_NAME_TO_TEST_FOR="HESHAM"
if [[ "${USER_NAME}" = "${USER_NAME}" ]]
then
  echo "your username matches ${USER_NAME_TO_TEST_FOR}"

fi
# Test for != (not eqal ) for the string 
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
  echo "your username does not match ${USER_NAME_TO_TEST_FOR}"
  exit 1
fi