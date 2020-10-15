#!/bin/bash
#
# clone all of the ICA-IT git repositories 
#
GHUSER=ICA-IT
curl "https://api.github.com/users/$GHUSER/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone

