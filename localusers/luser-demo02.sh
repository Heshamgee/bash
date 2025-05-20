#!/bin/bash

# Display the UID and username of the user executing this script 
# Display if the user is the root user or not 
# Display the UID 
echo "your UID is ${UID}"

# Display the username 
USERNAME=$(id -un)
echo "your name is = ${USERNAME}"
# Display if the user is the root user or not
if [[ "${UID}" = 0 ]]; then
  echo "you are the root ." 
else 
  echo "you are not a root "
fi