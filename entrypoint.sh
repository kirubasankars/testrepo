#!/bin/sh
val=""
touch /tmp/t.txt
echo "[hit enter key to exit] or run 'docker stop <container>'"
read $val
echo "exited $0"
