#!/usr/bin/python3

# Checks if there is any precipitation using precipitation.py and also gets the temperature.
# Displays this using 3 types of icons and colors depending on the type of prepipitation.

import subprocess, sys

result = subprocess.check_output("$HOME/.scripts/precipitation/precipitation.py --include_temp --only_value", shell=True)
result = (result.decode("utf-8")).rstrip()

prec_value, temp = result.split(" ")

prec_value = int(prec_value)

if (prec_value == 0):
    # No precipitation
    print("<span color='#d0e9f2'>  %s °C</span>" % temp)
elif (prec_value == 1 or prec_value == 5 or prec_value == 6):
    # Snow or freezing rain or freezing drizzle
    print("<span color='#8399ae'>  %s °C</span>" % temp)
else:
    print("<span color='#b7d8a5'>  %s °C</span>" % temp)

