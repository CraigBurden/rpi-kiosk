#!/bin/bash

LOCKFILE=/tmp/.X0-lock

# remove lockfile before launching X.
rm -f /tmp/.X0-lock
echo "STARTING X11"
openbox &
X -s 0 -dpms -nocursor -novtswitch vt2 -background none