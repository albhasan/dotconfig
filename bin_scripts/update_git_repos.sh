#!/bin/bash 

# update GIT REPOSITORIES IN THE CURRRENT DIRECTORY. 

# TODO: Write help.

command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

read -p "Updating each git repository in the current location. Do you want to continue [y,N]? " -n 1 -r
for d in */ 
do
    ( cd "$d" && git pull )
done

