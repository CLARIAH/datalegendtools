#!/bin/bash

# set user and group ID to that of host
USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

usermod -ou $USER_ID datalegend
groupmod -og $GROUP_ID users

# start wetty
cd /usr/src/app && yarn start wetty
