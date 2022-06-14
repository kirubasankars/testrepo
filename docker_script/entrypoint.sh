#!/bin/sh
touch /tmp/t.txt
echo "[hit enter key to exit] or run 'docker stop <container>'"
read $a
echo "exited $0"
