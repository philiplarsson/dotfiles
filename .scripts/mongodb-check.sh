#!/bin/bash

systemctl -q is-active mongodb

if [ $? -eq 0 ]
then
  echo "[ON]"
else
  echo "[OFF]"
fi

