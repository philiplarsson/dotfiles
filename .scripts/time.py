#!/usr/bin/python3

# Small script that shows a red icon if it's bedtime.
# Until I've bought a mat-och-sov-klocka à la Skalman this will have to do.
# I'm using this with i3blocks.

import time
from subprocess import call

sleep_time = "22" 

hour = time.strftime("%H")
if hour >= sleep_time:
    print("<span color='red'>   </span>")
    call("notify-send -u critical '  It is nap time!'", shell=True)
else:
    print("<span color='#59a659'> </span>")
