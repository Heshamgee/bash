#!/bin/bash
# This script disables local users or deletes them with options.

usage() {
  echo "Usage: ${0} [-dra] USERNAME" >&2
  echo "Disable or delete a local Linux account." >&2
  echo "  -d  Deletes the account instead of disabling it." >&2
  echo "  -r  Removes the home directory associated with the account." >&2
  echo "  -a  Creates an archive of the user's home directory in /archives." >&2
  exit 1
}

# Ensure the script is run as root
if [[ "${UID}" -ne 0 ]]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Parse options
while getopts "dra" opt; do
  case ${opt} in
    d) DELETE_USER="true" ;;
    r) REMOVE_HOME_DIR="true" ;;
    a) CREATE_ARCHIVE="true" ;;
    ?) usage ;;
  esac
done

# Remove options from positional parameters
shift "$((OPTIND - 1))"

# Get the username
USERNAME="${1}"

# Ensure a username was provided
if [[ -z "$USERNAME" ]]; then
  usage
fi

# Refuse to operate on system accounts (UID < 1000)
USER_ID=$(id -u "$USERNAME" 2>/dev/null)
if [[ $? -ne 0 ]]; then
  echo "The user '$USERNAME' does not exist."
  exit 1
elif [[ "$USER_ID" -lt 1000 ]]; then
  echo "Refusing to operate on the system account '$USERNAME'."
  exit 1
fi

# Create archive if requested
if [[ "$CREATE_ARCHIVE" == "true" ]]; then
  ARCHIVE_DIR="/archives"
  mkdir -p "$ARCHIVE_DIR"
  HOME_DIR="/home/${USERNAME}"
  ARCHIVE_FILE="${ARCHIVE_DIR}/${USERNAME}.tar.gz"

  if [[ -d "$HOME_DIR" ]]; then
    tar -czf "$ARCHIVE_FILE" "$HOME_DIR" && echo "Archived to $ARCHIVE_FILE"
  else
    echo "Home directory $HOME_DIR does not exist or cannot be archived."
  fi
fi

# Delete the user
if [[ "$DELETE_USER" == "true" ]]; then
  if [[ "$REMOVE_HOME_DIR" == "true" ]]; then
    userdel -r "$USERNAME"
  else
    userdel "$USERNAME"
  fi
  echo "User '$USERNAME' deleted."
else
  # Disable the account (lock it)
  chage -E 0 "$USERNAME"
  echo "User '$USERNAME' has been disabled."
fi
