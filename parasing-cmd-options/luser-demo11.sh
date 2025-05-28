#!/bin/bash

# This script generates a random password. 
# This user can set the password length with -l and add a special character wit h -s 
# Verbose mode can be enabled with -v .


usage(){
  echo "Usage:${0} [-vs][-l LENGTH]">&2
  echo "Generate a random password."
  echo " -l LENGTH Specify the password length."
  echo " -s  Append a special character to the passwrod."
  echo " -v  Increase verbosity ."
  exit 1
}

log(){
local MESSAGE="${@}"
if [[ "${VERBOSE}" = "true" ]]
then
  echo "Genrating a password"
  
fi
}

# Set a default password length 
LENGTH=48

while getopts vl:s OPTION
do 
  case ${OPTION} in 
  v)
    VERBOSE="ture"
    echo "Verbose mode on."
    ;;
  l)
    LENGTH="${OPTARG}"
    ;;
  s)
    USE_SPECIAL_CHARACTER="true"
    ;;
  ?)
    usage
    exit 1 
    ;;
  esac
done
# Remove the options while leaving the remaining arguments .
shift "$(( OPTIND -1 ))"

echo "Number of args :${#}"
echo " All args : ${@}"
echo " first args : ${1}"
echo " second args : ${2}"
echo " Third args : ${3}"

if [[ "${#}" > 0 ]]
then
  usage 
fi
# Inspect OPTIND
echo "OPTIND:${OPTIND}"
log "Generating a password"

PASSWORD=$(date +%s%n${RANDOM}${RANDOM}| sha256sum | head -c ${LENGTH})

# Append a special character if requested to do so .
if [[ "${USE_SPECIAL_CHARACTER}" = "true" ]]
then
  log "Selecting a random special character."
  SPECIAL_CHARACTER="$(echo "!@#$^&*()_+ "| fold -w1 | shuf | head -c1)"
  PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi
log "Done"
log "Here is the password."
# Display the password.
echo "${PASSWORD}"
exit 0 







