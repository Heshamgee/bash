#!/bin/bash
# This script generates a random password for each user specified on the command line. 

# Display what the user typed on the command line.

echo "you executed this command : ${0}"

# Display the path and filname of the script .
echo "you used $(dirname ${0}) as the path to the $(basename ${0}) script."

# Tell them how many arguments they passed in . 
# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS="${#}"
echo "you supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line "

# Make sure they at least supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" = 0 ]]
then 
  echo "Usage : ${0} USER_NAME [USER_NAME]..."
  exit 1 
fi
# Generate and display a password for each parameter  .
for USER_NAME in "${@}" 
do 
  PASSWORD=$(date +%s%n | sha256sum | head -c48)
  echo ""${USER_NAME}":"${PASSWORD}""
done
