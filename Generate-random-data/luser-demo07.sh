#!/bin/bash

# Demonstrate the use of shift and while loops . 

# Display the first three parameters 
echo "parameter 1 : ${1}"
echo "parameter 2 : ${2}"
echo "parameter 3 : ${3}"
echo "parameter 4 : ${4}"

# Loop through all the positional parameters.
while [[ "${#}" > 0 ]]
do 
  echo "Number of parameters : ${#}"
  echo "parameter 1 : ${1}"
  echo "parameter 2 : ${2}"
  echo "parameter 3 : ${3}"
  echo 
  shift 
done