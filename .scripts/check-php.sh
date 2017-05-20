#!/bin/bash
# Script to send output to another terminal that is waiting.
# Using the following alias: watch_here='clear;nc -kl 2777'

# Using https://github.com/squizlabs/PHP_CodeSniffer

## Check if we provided filename as argument
if [ -z $1 ]; then
    echo "Please provide a filename and path. Exiting... "
    exit 1
fi

## Variables
FILENAME=$1
PORT=2777
STANDARD="PSR2"
PHPCSPATH="${HOME}/.scripts"

## Check if phpcs.phar is available
if [ ! -f "${PHPCSPATH}/phpcs.phar" ]; then
    echo -e "Could not find phpcs.phar in ${PHPCSPATH}/.\nDownload from 'https://github.com/squizlabs/PHP_CodeSniffer'"
    exit 1
fi

## Clear
printf "\033c" | nc localhost $PORT

## Check if any errors
if [ "$?" != "0" ]; then
    echo "Error! Could not send to other window. Did you start nc?"
    exit 1
fi

## Check file for violations
PHPCSOUTPUT="$(${PHPCSPATH}/phpcs.phar --standard=${STANDARD} ${FILENAME})"

if [ -z "$PHPCSOUTPUT" ]; then
    echo -e "\nGood job! No violations  \n\n Filename: ${FILENAME}\n Standard: ${STANDARD}\n" | nc localhost $PORT
    echo " See output in other window. "
else
    echo -e "${PHPCSOUTPUT}" | pygmentize -l shell | nc localhost $PORT
    echo " See output in other window."
fi

