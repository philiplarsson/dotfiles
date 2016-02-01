#!/bin/bash

waittime=30

echo "Internet script started."
echo "Wait $waittime seconds between attempts. "

while true; do
    ping -c 1 google.se &> /dev/null
    rc=$?
    if [[ $rc -eq 0 ]]; then
        # Internet is up
        notify-send -u critical "Internet is up!"
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
        echo "Internet is up!"
        date

        exit 0
    fi
    # echo $rc
    # Wait 30 sec
    sleep $waittime

done

