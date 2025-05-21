#!/bin/bash
# This script generates a list of random passwords.
# A random number as a password
PASSWORD="${RANDOM}"
echo "the random password depend no random is :"${PASSWORD}""

# Three random numbers together.

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "the random password depend no 3 random is :${PASSWORD}"

# Use the current date/time as the basis for the password.
PASSWORD=$(date +%s%n)
echo "the random password depend no date is :${PASSWORD}"

# A better password
PASSWORD=$(date +%s%n | sha256sum | head -c32)
echo "A better password is :"${PASSWORD}""
