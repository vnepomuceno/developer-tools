#!/bin/sh
GREEN='\033[0;32m'
RST=$(tput sgr0)
bold=$(tput bold)
normal=$(tput sgr0)
BREAKER='------------------------------------------------------------------------------------------'

for GIT_REPO in "$1"*;
do
    echo $BREAKER
    echo $(date) "==> Updating git repository '${bold}$GIT_REPO${normal}'"
    cd $GIT_REPO
    git pull
    cd ..
    echo "\n\n" $(date) "${bold}==> ${GREEN}[OK]${RST} Finished pulling git repository"
    echo "$BREAKER\n"
done