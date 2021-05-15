#!/bin/bash
INTERVAL=0.5
get_timestamp() {
  ls --full-time $1 | awk '{print $7"-"$8}'
}
chcp.com 65001 > /dev/null

CLIPBOARD=~/.clipboard
last=$(get_timestamp "$CLIPBOARD")
while true; do
  sleep "$INTERVAL"
  echo "last: $last"
  echo "curr: $current"
  current=$(get_timestamp "$CLIPBOARD")
  if [ "$last" != "$current" ] ; then
    last="$current"
    echo "updated @$current"
    cat "$CLIPBOARD"
    echo "EOF"
    # iconv -c -f utf-8 -t cp932 $CLIPBOARD | clip
    cat "$CLIPBOARD" | clip
  fi
done
