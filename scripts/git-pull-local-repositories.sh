#!/bin/sh
GREEN='\033[0;32m'
RST=$(tput sgr0)
bold=$(tput bold)
normal=$(tput sgr0)
CHECK='✅  '
GLASS='🔎  '
WAVE='👋  '
BREAKER='------------------------------------------------------------------------------------------'

pull_git_repositories()
{
  for GIT_REPO in *; do
    echo $BREAKER
    echo $(date) "==> Updating git repository '${bold}$GIT_REPO${normal}'"
    cd $GIT_REPO
    git checkout master
    git pull
    cd ..
    echo "\n\n" $(date) "${bold}==> ${GREEN}[OK]${RST} Finished pulling git repository"
    echo "$BREAKER\n"
  done
}

echo $BREAKER
echo "$GLASS Inspecting directory '$1'"
echo $BREAKER
echo "Repositories to be updated:"

cd $1
for GIT_REPO in *; do
  echo "$CHECK $GIT_REPO"
done

echo $BREAKER

while true; do
    read -p "Continue to pull the listed repositories? [y/n] " yn
    case $yn in
        [Yy]* ) pull_git_repositories; break;;
        [Nn]* ) echo "Bye! $WAVE"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done