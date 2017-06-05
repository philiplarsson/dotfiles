#!/bin/bash
# Script to check file with phpunit.
# Currently phpunit needs to be set manually.
# Using the following alias: watch_here='clear;nc -kl 2777'


## Check if we provided filename as argument
if [ -z $1 ]; then
    echo "Please provide a filename and path. Exiting... "
    exit 1
fi

## Variables
FILENAME=$1
PORT=2777
PHPUNITPATH="${HOME}/.config/composer/vendor/bin/phpunit"
## Clear
printf "\033c" | nc localhost $PORT

## Check if any errors
if [ "$?" != "0" ]; then
    echo "Error! Could not send to other window. Did you start nc?"
    exit 1
fi

## Check file for violations
PHPUNITOUTPUT="$(${PHPUNITPATH} ${FILENAME})"

if [ $? -eq 0  ]; then
    echo -e "\nGood job! All tests ok  \n\n Filename: ${FILENAME}\n\n${PHPUNITOUTPUT}" | nc localhost $PORT
    echo " See output in other window. "
else
    echo -e "${PHPUNITOUTPUT}" | pygmentize -l shell | nc localhost $PORT
    echo " See output in other window."
fi

