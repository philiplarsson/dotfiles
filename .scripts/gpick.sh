#!/bin/bash

(gpick -p);
pid=$(pidof gpick)
sleep 5
xclip -se c -o | xclip -i -se c -l 1
kill $pid

