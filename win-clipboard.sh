#!/bin/bash
INTERVAL=0.5
CLIPBOARD=~/.clipboard
last=`ls --full-time $CLIPBOARD | awk '{print $6"-"$7}'`
while true; do
  sleep $INTERVAL
  current=`ls --full-time $CLIPBOARD | awk '{print $6"-"$7}'`
  if [ $last != $current ] ; then
    last=$current
    echo "updated @$current"
    cat $CLIPBOARD
    echo "EOF"
    iconv -c -f utf-8 -t sjis $CLIPBOARD | clip
  fi
done
